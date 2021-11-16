package user

import "i421/model"

// user 模型
type User struct {
	model.BaseModel
	Name     string `json:"name"` // 用户名
	Username string `json:"username"`
	Password string `json:"password"`
	Status   string `gorm:"default:1" json:"status"` // 默认禁用
}

// 指定表名
func (User) TableName() string {
	return "users"
}
