package request

// 配置列表参数
type LogListRequest struct {
	Title    string `form:"title" json:"title,omitempty"`
	Page     int    `form:"page", json:"page" binding:"required"`
	PageSize int    `form:"pageSize" json:"pageSize" binding:"required"`
}

// 删除
type DeleteLogRequest struct {
	ID   int64  `form:"id" json:"id" binding:"required"`
	Type string `form:"type" json:"type,omitempty" binding:"-"` // 默认强制删除, 软删除则: soft
}
