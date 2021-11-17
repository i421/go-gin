package user

import (
	"i421/model"
	"i421/model/role"
	//"gorm.io/datatypes"
)

// user 模型
type User struct {
	model.BaseModel
	Name     string      `json:"name"` // 用户名
	Username string      `json:"username"`
	Password string      `json:"password"`
	Status   string      `gorm:"default:1" json:"status"` // 默认禁用
	Roles    []role.Role `gorm:"many2many:role_users"`
	//Info     datatypes.JSON
}

// 指定表名
func (User) TableName() string {
	return "users"
}
