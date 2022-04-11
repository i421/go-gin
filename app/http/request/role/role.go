package request

// 角色列表参数
type GetRoleListByPageRequest struct {
	RoleName string `form:"roleName" json:"roleName,omitempty" binding:"-"`
	Status   int    `form:"status" json:"status,omitempty" binding:"-"`
	Page     int    `form:"page", json:"page" binding:"required"`
	PageSize int    `form:"pageSize" json:"pageSize" binding:"required"`
}

// 设置角色状态
type SetRoleStatusRequest struct {
	ID     int `form:"id" json:"id" binding:"required"`
	Status int `form:"status" json:"status" binding:"-"`
}

// 更新角色
type UpdateRoleRequest struct {
	ID          int64   `form:"id" json:"id" binding:"required"`
	RoleName    string  `form:"roleName" json:"roleName"  binding:"required"`
	Value       string  `form:"value" json:"value"  binding:"required"`
	Description string  `form:"description" json:"description"  binding:"required"`
	Sort        int     `form:"sort" json:"sort" binding:"required"`
	Status      int     `form:"status" json:"status" binding:"-"`
	MenuIds     []int64 `form:"menu_ids" json:"menu_ids" binding:"-"`
}

// 删除
type DeleteRoleRequest struct {
	ID   int64  `form:"id" json:"id" binding:"required"`
	Type string `form:"type" json:"type,omitempty" binding:"-"` // 默认强制删除, 软删除则: soft
}
