package role

import (
	"i421/model"
	"i421/model/permission"
)

// role
type Role struct {
	model.BaseModel
	Name        string                  `json:"name"`
	Desc        string                  `json:"desc"`
	Status      int                     `json:"status"`
	Permissions []permission.Permission `json:"permissions" gorm:"many2many:permission_role"`
}

func (Role) TableName() string {
	return "roles"
}
