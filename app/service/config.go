package service

import (
	"errors"
	request "i421/app/http/request/config"
	"i421/app/model"
	"i421/app/model/config"
)

// ConfigService 配置表service层
type ConfigService struct {
}

type WhereConfigCond struct {
	Code string `json:"code"`
}

// NewConfigService 实例化
func NewConfigService() *ConfigService {
	return &ConfigService{}
}

// GetConfigList 获取配置列表
func (cs *ConfigService) GetConfigList(configListRequest request.ConfigListRequest) (configResp []config.Config, count int64, err error) {

	// 查询条件结构体
	var whereCond WhereConfigCond

	if configListRequest.Code != "" {
		whereCond.Code = configListRequest.Code
	}

	temp := model.Db.Model(&config.Config{}).Where("is_deleted != 1").Where(whereCond).Order("sort")

	temp.Count(&count)

	res := temp.Limit(configListRequest.PageSize).Offset((configListRequest.Page - 1) * configListRequest.PageSize).Find(&configResp)

	if res.RowsAffected < 1 {
		return configResp, 0, errors.New("查询为空")
	}

	return configResp, count, nil
}

// deleteConfig 删除配置
func (cs *ConfigService) DeleteConfig(deleteConfigRequest request.DeleteConfigRequest) (flag bool, err error) {

	if deleteConfigRequest.Type != "" {
		res := model.Db.Model(&config.Config{}).Where("id = ?", deleteConfigRequest.ID).Updates(map[string]interface{}{"is_deleted": 1})

		if res.RowsAffected < 1 {
			return false, errors.New("删除失败")
		}
	} else {
		res := model.Db.Delete(&config.Config{}, deleteConfigRequest.ID)

		if res.RowsAffected < 1 {
			return false, errors.New("删除失败")
		}
	}

	return true, nil
}

// updateConfig 更新配置
func (cs *ConfigService) UpdateConfig(updateConfig request.UpdateOrCreateConfigRequest) (flag bool, err error) {

	res := model.Db.Model(&config.Config{}).Where("id = ?", updateConfig.ID).Select("code", "c_key", "value", "sort", "remark", "parent_id").Updates(map[string]interface{}{"code": updateConfig.Code, "c_key": updateConfig.CKey, "value": updateConfig.Value, "sort": updateConfig.Order, "remark": updateConfig.Remark, "parent_id": updateConfig.ParentId})

	if res.RowsAffected < 1 {
		return false, errors.New("更新失败")
	}
	return true, nil
}

// createConfig 创建配置
func (cs *ConfigService) CreateConfig(createConfigRequest request.UpdateOrCreateConfigRequest) (flag bool, err error) {

	configResp := config.Config{Code: createConfigRequest.Code, CKey: createConfigRequest.CKey, Remark: createConfigRequest.Remark, Value: createConfigRequest.Value, Sort: createConfigRequest.Order, ParentId: createConfigRequest.ParentId}

	res := model.Db.Create(&configResp)

	if res.RowsAffected < 1 {
		return false, errors.New("配置已存在")
	}

	return true, nil
}
