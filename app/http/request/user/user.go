package request

// UserLoginRequest 用户登陆
type UserLoginRequest struct {
	Username string `form:"username", json:"username" binding:"required"`
	Password string `form:"password" json:"password" binding:"required"`
}

// UpdateOrCreateAccountRequest 更新账号
type UpdateOrCreateAccountRequest struct {
	UserID   int64   `form:"userId" json:"userId" binding:"-"`
	Account  string  `form:"account" json:"account"  binding:"required"`
	Password string  `form:"password" json:"password"  binding:"required"`
	RoleIds  []int64 `form:"role_ids" json:"role_ids" binding:"required"`
	Nickname string  `form:"nickname" json:"nickname" binding:"required"`
	Status   int     `form:"status" json:"status" binding:"-"`
	Remark   string  `form:"remark" json:"remark" binding:"-"`
}

// AccountListRequest 账号列表
type AccountListRequest struct {
	Page     int    `form:"page", json:"page" binding:"required"`
	PageSize int    `form:"pageSize" json:"pageSize" binding:"required"`
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

// 设置用户状态
type SetAccountStatusRequest struct {
	ID     int `form:"id" json:"id" binding:"required"`
	Status int `form:"status" json:"status" binding:"-"`
}
