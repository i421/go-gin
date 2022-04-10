package request

// 部门列表参数
type DeptListRequest struct {
	DeptName string `form:"deptName" json:"deptName,omitempty"`
	Status   int    `form:"status" json:"status,omitempty"`
}

// 更新部门
type UpdateDeptRequest struct {
	ID         string `form:"id" json:"id" binding:"required"`
	DeptName   string `form:"deptName" json:"deptName"  binding:"required"`
	ParentDept int    `form:"parentDept" json:"parentDept" binding:"required"`
	Status     int    `form:"status" json:"status" binding:"-"`
	OrderNo    int64  `form:"orderNo" json:"orderNo" binding:"required"`
	Remark     string `form:"remark" json:"remark" binding:"required"`
}

// 删除
type DeleteDeptRequest struct {
	ID   int64  `form:"id" json:"id" binding:"required"`
	Type string `form:"type" json:"type,omitempty" binding:"-"` // 默认强制删除, 软删除则: soft
}
