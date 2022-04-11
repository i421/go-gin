package request

type UserLoginRequest struct {
	Username string `form:"username", json:"username" binding:"required"`
	Password string `form:"password" json:"password" binding:"required"`
}

type UserRegisterRequest struct {
	Phone    string `form:"phone", json:"phone" binding:"required"`
	Password string `form:"password" json:"password" binding:"required"`
}

type UpdateAccountRequest struct {
	UserID   int64   `form:"userId" json:"userId" binding:"required"`
	Account  string  `form:"account" json:"account"  binding:"required"`
	RoleIds  []int64 `form:"role_ids" json:"role_ids" binding:"required"`
	DeptId   int64   `form:"deptId" json:"deptId" binding:"-"`
	Nickname string  `form:"nickname" json:"nickname" binding:"required"`
	Email    string  `form:"email" json:"email" binding:"required"`
	Remark   string  `form:"remark" json:"remark" binding:"-"`
}

type AccountListRequest struct {
	Page     int    `form:"page", json:"page" binding:"required"`
	PageSize int    `form:"pageSize" json:"pageSize" binding:"required"`
	DeptId   int64  `form:"deptId" json:"deptId,omitempty" binding:"-"`
	Account  string `form:"account" json:"account,omitempty" binding:"-"`
	Nickname string `form:"nickname" json:"nickname,omitempty" binding:"-"`
}

// 删除
type DeleteAccountRequest struct {
	ID   int64  `form:"id" json:"id" binding:"required"`
	Type string `form:"type" json:"type,omitempty" binding:"-"` // 默认强制删除, 软删除则: soft
}

// account是否可用
type AccountExistRequest struct {
	Account string `form:"account" json:"account" binding:"required"`
	UserId  int64  `form:"userId" json:"userId" binding:"required"`
}
