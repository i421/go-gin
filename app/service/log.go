package service

import (
	"errors"
	request "i421/app/http/request/log"
	"i421/app/model"
	"i421/app/model/log"
)

// LogService 日志表service层
type LogService struct {
}

type WhereLogCond struct {
	Title string `json:"title"`
}

// NewLogService 实例化
func NewLogService() *LogService {
	return &LogService{}
}

// GetLogList 获取部门列表
func (ls *LogService) GetLogList(logListRequest request.LogListRequest) (logResp []log.Log, count int64, err error) {

	// 查询条件结构体
	var whereCond WhereLogCond

	if logListRequest.Title != "" {
		whereCond.Title = logListRequest.Title
	}

	temp := model.Db.Model(&log.Log{}).Where("is_deleted != 1").Where(whereCond).Order("create_time")

	temp.Count(&count)

	res := temp.Limit(logListRequest.PageSize).Offset((logListRequest.Page - 1) * logListRequest.PageSize).Find(&logResp)

	if res.RowsAffected < 1 {
		return logResp, 0, errors.New("查询为空")
	}

	return logResp, count, nil
}

// deleteLog 删除日志
func (ls *LogService) DeleteLog(deleteLogRequest request.DeleteLogRequest) (flag bool, err error) {

	if deleteLogRequest.Type != "" {
		res := model.Db.Model(&log.Log{}).Where("id = ?", deleteLogRequest.ID).Updates(map[string]interface{}{"is_deleted": 1})

		if res.RowsAffected < 1 {
			return false, errors.New("删除失败")
		}
	} else {
		res := model.Db.Delete(&log.Log{}, deleteLogRequest.ID)

		if res.RowsAffected < 1 {
			return false, errors.New("删除失败")
		}
	}

	return true, nil
}
