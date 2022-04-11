package request

// 菜单列表参数
type MenuListRequest struct {
	MenuName string `form:"menuName" json:"menuName,omitempty" binding:"-"`
	Status   int    `form:"status" json:"status,omitempty" binding:"-"`
}

// 更新菜单
type UpdateMenuRequest struct {
	ID         int64  `form:"id" json:"id" binding:"required"`
	Icon       string `form:"icon" json:"icon"  binding:"required"`
	MenuName   string `form:"menuName" json:"menuName" binding:"required"`
	OrderNo    int64  `form:"orderNo" json:"orderNo" binding:"required"`
	RoutePath  string `form:"routePath" json:"routePath" binding:"required"`
	Permission string `form:"permission" json:"permission" binding:"-"`
	Status     int64  `form:"status" json:"status" binding:"-"`
	Show       int64  `form:"show" json:"show" binding:"-"`
	IsExt      int64  `form:"isExt" json:"isExt" binding:"-"`
	Type       int64  `form:"type" json:"type" binding:"-"`
	ParentMenu int64  `form:"parentMenu" json:"parentMenu" binding:"-"`
}

// 删除
type DeleteMenuRequest struct {
	ID   int64  `form:"id" json:"id" binding:"required"`
	Type string `form:"type" json:"type,omitempty" binding:"-"` // 默认强制删除, 软删除则: soft
}
