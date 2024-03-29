package request

// 部门列表参数
type DeptListRequest struct {
	DeptName string `form:"deptName" json:"deptName,omitempty"`
	Status   int    `form:"status" json:"status,omitempty"`
}

// 更新部门
type UpdateOrCreateDeptRequest struct {
	ID         int64  `form:"id" json:"id" binding:"-"`
	DeptName   string `form:"deptName" json:"deptName"  binding:"required"`
	ParentDept int64  `form:"parentDept" json:"parentDept" binding:"-"`
	Status     int    `form:"status" json:"status" binding:"-"`
	OrderNo    int64  `form:"orderNo" json:"orderNo" binding:"required"`
	Remark     string `form:"remark" json:"remark" binding:"-"`
}

// 删除
type DeleteDeptRequest struct {
	ID   int64  `form:"id" json:"id" binding:"required"`
	Type string `form:"type" json:"type,omitempty" binding:"-"` // 默认强制删除, 软删除则: soft
}
