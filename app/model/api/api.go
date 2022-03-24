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
	ClassName   string `json:"className"`               // 类名
	MethodName  string `json:"methodName"`              // 方法名
	Path        string `json:"path"`                    // 请求路径
	ContentType string `json:"contentType"`             // 相应类型
	ServiceId   string `json:"serviceId"`               // 服务ID
	Status      string `gorm:"default:1" json:"status"` // 状态0启用1禁用
	auth        string `json:"auth"`                    // 是否认证0不认证
	CreateBy    string `json:"createBy"`
	UpdateBy    string `json:"updateBy"`
	IsDeleted   bool   `json:"isDeleted"`
}

// 指定表名
func (Api) TableName() string {
	return "api"
}
