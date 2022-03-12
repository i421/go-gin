package depart

import (
	"i421/app/model"
)

// depart
type Depart struct {
	model.BaseModel
	Name      string `json:"name"`                        // 部门名称
	Sort      int    `gorm:"default:0" json:"sort"`       // 排序
	CreateBy  string `json:"create_by"`                   // 创建人
	UpdateBy  string `json:"update_by"`                   // 更新人
	IsDeleted bool   `gorm:"default:0" json:"is_deleted"` // 删除标志
	ParentId  int64  `gorm:"default:0" json:"parent_id"`  // 上级ID
	TenantId  int64  `gorm:"default:0" json:"tenant_id"`  // 租户ID
}

func (Depart) TableName() string {
	return "sys_depart"
}
