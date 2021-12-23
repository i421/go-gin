package request

type UserLoginRequest struct {
	Username string `form:"username", json:"username" binding:"required"`
	Password string `form:"password" json:"password" binding:"required"`
}

type UserRegisterRequest struct {
	Phone    string `form:"phone", json:"phone" binding:"required"`
	Password string `form:"password" json:"password" binding:"required"`
}
