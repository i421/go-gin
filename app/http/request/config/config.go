package request

// 配置列表参数
type ConfigListRequest struct {
	Code     string `form:"code" json:"code,omitempty"`
	Page     int    `form:"page", json:"page" binding:"required"`
	PageSize int    `form:"pageSize" json:"pageSize" binding:"required"`
}

// 更新配置
type UpdateOrCreateConfigRequest struct {
	ID     int64  `form:"id" json:"id" binding:"-"`
	Code   string `form:"code" json:"code"  binding:"required"`
	CKey   string `form:"c_key" json:"c_key" binding:"-"`
	Value  string `form:"value" json:"value" binding:"-"`
	Order  int64  `form:"order" json:"order" binding:"-"`
	Remark string `form:"remark" json:"remark" binding:"-"`
}

// 删除
type DeleteConfigRequest struct {
	ID   int64  `form:"id" json:"id" binding:"required"`
	Type string `form:"type" json:"type,omitempty" binding:"-"` // 默认强制删除, 软删除则: soft
}
