package permissionRole

// DeptRole 模型
type PermissionRole struct {
	ID         int64 `json:"id"`         // ID
	MenuId     int64 `json:"menu_id"`    // 菜单id
	RoleId     int64 `json:"role_id"`    // 角色id
	CreateTime int64 `json:"createTime"` // 创建时间
	UpdateTime int64 `json:"updateTime"` // 更新时间
}

// 指定表名
func (PermissionRole) TableName() string {
	return "permission_role"
}
