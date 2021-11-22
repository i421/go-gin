package passwordReset

import (
	"i421/model"
)

// password_reset 模型
type PasswordReset struct {
	model.BaseModel
	Email string `json:"email"` // 用户名
	Token string `json:"token"` // 唯一标志
}

// 指定表名
func (PasswordReset) TableName() string {
	return "password_resets"
}
