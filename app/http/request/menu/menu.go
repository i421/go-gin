package request

// 菜单列表参数
type MenuListRequest struct {
	MenuName string `form:"name" json:"name,omitempty" binding:"-"`
	Status   string `form:"status" json:"status,omitempty" binding:"-"`
}

// 角色菜单
type RoleMenuRequest struct {
	RoleId int64 `form:"role_id" json:"role_id,omitempty" binding:"-"`
}

// 更新或创建菜单
type UpdateOrCreateMenuRequest struct {
	ID         int64  `form:"id" json:"id" binding:"-"`
	Icon       string `form:"icon" json:"icon"  binding:"required"`
	MenuName   string `form:"name" json:"name" binding:"required"`
	OrderNo    int    `form:"sort" json:"sort" binding:"required"`
	RoutePath  string `form:"path" json:"path" binding:"required"`
	Permission string `form:"permission" json:"permission" binding:"-"`
	Status     int    `form:"status" json:"status" binding:"-"`
	Show       int    `form:"show" json:"show" binding:"-"`
	IsExt      int    `form:"isExt" json:"isExt" binding:"-"`
	Type       int    `form:"type" json:"type" binding:"-"`
	ParentId   int64  `form:"parentId" json:"parentId" binding:"-"`
}

// 更新用户菜单
type UpdateRoleMenuRequest struct {
	RoleId  int64   `form:"role_id" json:"role_id" binding:"required"`
	MenuIds []int64 `form:"menu_ids" json:"menu_ids" binding:"-"`
}

// 删除
type DeleteMenuRequest struct {
	ID   int64  `form:"id" json:"id" binding:"required"`
	Type string `form:"type" json:"type,omitempty" binding:"-"` // 默认强制删除, 软删除则: soft
}
