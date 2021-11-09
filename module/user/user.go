package user

import (
	"i421/module"
)

// user 模型
type User struct {
	module.MyBaseModel
	Name        string      `json:"name"` // 用户名
	Username    string      `json:"username"`
	Password    string      `json:"password"`
	Phone       string      `json:"phone,omitempty"`
	QQ          string      `json:"qq,omitempty"`
	Status      string      `gorm:"default:2" json:"status"` // 默认禁用
	IsAttention uint8       `json:"is_attention"`            // 微信端是否与我们系统进行配对
	OpenId      string      `json:"open_id"`                 // 微信 open_id
	User2Role   []User2role `gorm:"foreignKey:UserId" json:"-"`
	RoleId      uint8       `json:"role_id,omitempty" gorm:"-"` // 这个字段主要用于接受, 数据库没有定义这个
}

// 指定表名
func (User) TableName() string {
	return "user"
}

// user 关联 role
type User2role struct {
	module.MyBaseModel
	UserId uint8 `json:"user_id"`
	RoleId uint8 `json:"role_id"`
}

// 指定表名
func (User2role) TableName() string {
	return "user2role"
}
