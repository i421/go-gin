package service

import (
	"errors"
	request "i421/app/http/request/user"
	"i421/app/model"
	"i421/app/model/user"
)

// UserService 用户表service层
type UserService struct {
}

// NewUserService 实例化
func NewUserService() *UserService {
	return &UserService{}
}

// Login 用户登陆
func (us *UserService) Login(loginRequest request.UserLoginRequest) (userResp user.User, err error) {
	// 用户是否注册
	var isUser user.User
	res := model.Db.Model(&user.User{}).Where("account = ?", loginRequest.Username).First(&isUser)

	if res.RowsAffected < 1 {
		return userResp, errors.New("用户不存在")
	}

	//iAes := iaes.NewIAes()
	//passwd, _ := iAes.EncryptByAes([]byte(loginRequest.Password))

	res = model.Db.Model(&user.User{}).Preload("Roles").Select([]string{"id", "account", "name", "avatar", "real_name", "remark"}).Where("account = ? AND password = ?", loginRequest.Username, loginRequest.Password).First(&userResp)

	if res.RowsAffected < 1 {
		return userResp, errors.New("用户密码不匹配")
	}

	return userResp, nil
}

// UserInfo 用户信息
func (us *UserService) GetUserInfo(userId int64) (userResp user.User, err error) {

	res := model.Db.Model(&user.User{}).Preload("Roles").Select([]string{"id", "account", "name", "avatar", "real_name", "remark"}).Where("id = ?", userId).First(&userResp)

	if res.RowsAffected < 1 {
		return userResp, errors.New("用户不存在")
	}

	return userResp, nil
}

// Create 创建用户
/*
func (us *UserService) Create(registerRequest request.UserRegisterRequest) (userResp user.User, err error) {
	// 用户是否注册
	var isUser user.User
	res := model.Db.Where("phone = ?", registerRequest.Phone).First(&isUser)

	if res.RowsAffected > 0 {
		return userResp, errors.New("用户已存在")
	}

	iAes := iaes.NewIAes()
	passwd, _ := iAes.EncryptByAes([]byte(registerRequest.Password))
	userResp = user.User{
		Nickname:        registerRequest.Phone,
		Phone:           registerRequest.Phone,
		Password:        passwd,
		EmailVerifiedAt: "2020-01-01",
		UUID:            uuid.New().String(),
		Status:          1,
	}

	err = model.Db.Create(&userResp).Error
	if err != nil {
		return userResp, errors.New("用户创建失败")
	}

	return userResp, nil
}
*/
