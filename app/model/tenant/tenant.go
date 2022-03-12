package Tenant

import (
	"i421/app/model"
)

// tenant
type Tenant struct {
	model.BaseModel
	Name      string `json:"name"`                      // 租户名称
	Code      string `json:"code"`                      // 租户编码
	StartTime int64  `json:"start_time"`                // 开始时间
	EndTime   int64  `json:"end_time"`                  // 结束时间
	DelFlag   int64  `gorm:"default:0" json:"del_flag"` // 删除状态
	Status    int    `gorm:"default:0" json:"status"`   // 状态
	CreateBy  string `json:"create_by"`                 // 创建人
	UpdateBy  string `json:"update_by"`                 // 更新人
}

func (Tenant) TableName() string {
	return "sys_tenant"
}
