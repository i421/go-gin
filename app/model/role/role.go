package role

import (
	"i421/app/model"
	"i421/app/model/depart"
	"i421/app/model/menu"
)

// role
type Role struct {
	model.BaseModel
	RoleName    string          `json:"role_name"`                                  // 角色名称
	RoleCode    string          `json:"role_code"`                                  // 角色编码
	Description string          `json:"description"`                                // 描述
	Sort        int             `gorm:"default:0" json:"sort"`                      // 排序
	Status      int             `json:"status"`                                     // 状态
	CreateBy    string          `json:"create_by"`                                  // 创建人
	UpdateBy    string          `json:"update_by"`                                  // 更新人
	IsDeleted   bool            `json:"is_deleted"`                                 // 删除标志
	TenantId    int             `gorm:"default:100000" json:"tenant_id"`            // 租户ID
	Departs     []depart.Depart `json:"departs" gorm:"many2many:sys_role_depart"`   // 多部门
	Menus       []menu.Menu     `json:"menus" gorm:"many2many:sys_role_permission"` // 多权限
}

func (Role) TableName() string {
	return "sys_role"
}
