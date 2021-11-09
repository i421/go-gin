package role

import (
	"i421/module"
	"i421/module/user"
)

// role
type Role struct {
	module.MyBaseModel
	Name      string           `json:"name"`
	Role2User []user.User2role `gorm:"foreignKey:RoleId" json:"-"`
}

func (Role) TableName() string {
	return "role"
}
