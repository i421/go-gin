package api

import (
	"i421/app/model"
)

// api 模型
type Api struct {
	model.BaseModel
	Code        string `json:"code"`                    // 接口编码
	Name        string `json:"name"`                    // 接口名称
	Notes       string `json:"notes"`                   // 接口描述
	Method      string `json:"method"`                  // 请求方法
	ClassName   string `json:"class_name"`              // 类名
	MethodName  string `json:"method_name"`             // 方法名
	Path        string `json:"path"`                    // 请求路径
	ContentType string `json:"content_type"`            // 相应类型
	ServiceId   string `json:"service_id"`              // 服务ID
	Status      string `gorm:"default:1" json:"status"` // 状态0启用1禁用
	auth        string `json:"auth"`                    // 是否认证0不认证
	CreateBy    string `json:"create_by"`
	UpdateBy    string `json:"update_by"`
	IsDeleted   bool   `json:"is_deleted"`
	TenantId    string `gorm:"default:100000" json:"tenant_id"` // 租户ID
}

// 指定表名
func (Api) TableName() string {
	return "sys_api"
}
