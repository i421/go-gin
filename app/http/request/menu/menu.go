package request

// 菜单列表参数
type MenuListRequest struct {
	MenuName string `form:"menuName" json:"menuName,omitempty" binding:"-"`
	Status   int    `form:"status" json:"status,omitempty" binding:"-"`
}

// 更新或创建菜单
type UpdateOrCreateMenuRequest struct {
	ID         int64  `form:"id" json:"id" binding:"-"`
	Icon       string `form:"icon" json:"icon"  binding:"required"`
	MenuName   string `form:"menuName" json:"menuName" binding:"required"`
	OrderNo    int    `form:"orderNo" json:"orderNo" binding:"required"`
	RoutePath  string `form:"routePath" json:"routePath" binding:"required"`
	Permission string `form:"permission" json:"permission" binding:"-"`
	Status     int    `form:"status" json:"status" binding:"-"`
	Show       int    `form:"show" json:"show" binding:"-"`
	IsExt      int    `form:"isExt" json:"isExt" binding:"-"`
	Type       int    `form:"type" json:"type" binding:"-"`
	ParentMenu int64  `form:"parentMenu" json:"parentMenu" binding:"-"`
}

// 删除
type DeleteMenuRequest struct {
	ID   int64  `form:"id" json:"id" binding:"required"`
	Type string `form:"type" json:"type,omitempty" binding:"-"` // 默认强制删除, 软删除则: soft
}
