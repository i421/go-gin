package user

import (
	"i421/app/model"
	"i421/app/model/role"

	"gorm.io/datatypes"
)

// user 模型
type User struct {
	model.BaseModel
	Nickname        string         `json:"nickname"` // 用户名
	UUID            string         `json:"uuid"`     // 唯一标志
	Phone           string         `json:"phone"`
	Email           string         `json:"email"`
	EmailVerifiedAt string         `json:"email_verified_at"`
	Password        string         `json:"password"`
	Avatar          string         `json:"avatar"`
	Info            datatypes.JSON `json:"info"`
	Status          int            `gorm:"default:1" json:"status"` // 默认可用
	Roles           []role.Role    `json:"roles" gorm:"many2many:role_user"`
}

// 指定表名
func (User) TableName() string {
	return "users"
}
