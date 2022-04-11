package roleUser

// RoleUser 模型
type RoleUser struct {
	ID         int64 `json:"id"`         // ID
	UserId     int64 `json:"user_id"`    // 用户id
	RoleId     int64 `json:"role_id"`    // 角色id
	CreateTime int64 `json:"createTime"` // 创建时间
	UpdateTime int64 `json:"updateTime"` // 更新时间
}

// 指定表名
func (RoleUser) TableName() string {
	return "role_user"
}
