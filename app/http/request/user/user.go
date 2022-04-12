package request

// UserLoginRequest 用户登陆
type UserLoginRequest struct {
	Username string `form:"username", json:"username" binding:"required"`
	Password string `form:"password" json:"password" binding:"required"`
}

// UserRegisterRequest 用户注册
type UserRegisterRequest struct {
	Phone    string `form:"phone", json:"phone" binding:"required"`
	Password string `form:"password" json:"password" binding:"required"`
}

// UpdateAccountRequest 更新账号
type UpdateAccountRequest struct {
	UserID   int64   `form:"userId" json:"userId" binding:"required"`
	Account  string  `form:"account" json:"account"  binding:"required"`
	RoleIds  []int64 `form:"role_ids" json:"role_ids" binding:"required"`
	DeptId   int64   `form:"deptId" json:"deptId" binding:"-"`
	Nickname string  `form:"nickname" json:"nickname" binding:"required"`
	Email    string  `form:"email" json:"email" binding:"required"`
	Remark   string  `form:"remark" json:"remark" binding:"-"`
}

// AccountListRequest 账号列表
type AccountListRequest struct {
	Page     int    `form:"page", json:"page" binding:"required"`
	PageSize int    `form:"pageSize" json:"pageSize" binding:"required"`
	DeptId   int64  `form:"deptId" json:"deptId,omitempty" binding:"-"`
	Account  string `form:"account" json:"account,omitempty" binding:"-"`
	Nickname string `form:"nickname" json:"nickname,omitempty" binding:"-"`
}

// DeleteAccountRequest 删除账号
type DeleteAccountRequest struct {
	ID   int64  `form:"id" json:"id" binding:"required"`
	Type string `form:"type" json:"type,omitempty" binding:"-"` // 默认强制删除, 软删除则: soft
}

// AccountExistRequest 是否可用
type AccountExistRequest struct {
	Account string `form:"account" json:"account" binding:"required"`
	UserId  int64  `form:"userId" json:"userId" binding:"required"`
}

// UpdateAccountRequest 更新密码
type UpdatePasswordRequest struct {
	ID     int64  `form:"id" json:"id" binding:"required"`
	OldPwd string `form:"oldPwd" json:"oldPwd" binding:"required"`
	NewPwd string `form:"newPwd" json:"newPwd" binding:"required"`
}
