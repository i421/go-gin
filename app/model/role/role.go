package role

import (
	"i421/app/model"
	"i421/app/model/depart"
	"i421/app/model/menu"
)

// role
type Role struct {
	model.BaseModel
	RoleName    string          `json:"roleName"`                               // 角色名称
	RoleCode    string          `json:"value"`                                  // 角色编码
	Description string          `json:"description"`                            // 描述
	Sort        int             `gorm:"default:0" json:"sort"`                  // 排序
	Status      int             `json:"status"`                                 // 状态
	CreateBy    string          `json:"createBy"`                               // 创建人
	UpdateBy    string          `json:"updateBy"`                               // 更新人
	IsDeleted   bool            `json:"isDeleted"`                              // 删除标志
	Departs     []depart.Depart `json:"departs" gorm:"many2many:depart_role"`   // 多部门
	Menus       []menu.Menu     `json:"menus" gorm:"many2many:permission_role"` // 多权限
}

func (Role) TableName() string {
	return "role"
}
