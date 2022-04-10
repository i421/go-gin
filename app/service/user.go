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

// 用户列表查询
type AccountListWhereCond struct {
	Account  string `json:"account"`
	Nickname string `json:"nickname"`
	DeptId   int64  `json:"deptId"`
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

	res = model.Db.Model(&user.User{}).Preload("Roles").Select([]string{"id", "account", "nickname", "avatar", "real_name", "remark"}).Where("account = ? AND password = ?", loginRequest.Username, loginRequest.Password).First(&userResp)

	if res.RowsAffected < 1 {
		return userResp, errors.New("用户密码不匹配")
	}

	return userResp, nil
}

// UserInfo 用户信息
func (us *UserService) GetUserInfo(userId int64) (userResp user.User, err error) {

	res := model.Db.Model(&user.User{}).Preload("Roles").Select([]string{"id", "account", "nickname", "avatar", "real_name", "remark"}).Where("id = ?", userId).First(&userResp)

	if res.RowsAffected < 1 {
		return userResp, errors.New("用户不存在")
	}

	return userResp, nil
}

// AccountList 用户列表
func (us *UserService) AccountList(accountListRequest request.AccountListRequest) (userResp []user.User, total int64, err error) {

	// 查询条件结构体
	var whereCond AccountListWhereCond

	if accountListRequest.Account != "" {
		whereCond.Account = accountListRequest.Account
	}

	if accountListRequest.Nickname != "" {
		whereCond.Nickname = accountListRequest.Nickname
	}

	if accountListRequest.DeptId != 0 {
		whereCond.DeptId = accountListRequest.DeptId
	}

	temp := model.Db.Model(&user.User{}).Preload("Roles").Joins("Depart").Select([]string{"user.id", "account", "nickname", "email", "user.create_time", "user.remark", "depart_id"}).Where("user.is_deleted != 1").Where(whereCond).Order("user.id")

	res := temp.Limit(accountListRequest.PageSize).Offset((accountListRequest.Page - 1) * accountListRequest.PageSize).Find(&userResp)

	var count int64
	temp.Count(&count)

	if res.RowsAffected < 1 {
		return userResp, 0, errors.New("查询为空")
	}

	return userResp, count, nil
}

// deleteUser 删除账户
func (us *UserService) DeleteAccount(deleteAccountRequest request.DeleteAccountRequest) (flag bool, err error) {

	if deleteAccountRequest.Type != "" {
		res := model.Db.Model(&user.User{}).Where("id = ?", deleteAccountRequest.ID).Updates(map[string]interface{}{"is_deleted": 1})

		if res.RowsAffected < 1 {
			return false, errors.New("删除失败")
		}
	} else {

		res := model.Db.Delete(&user.User{}, deleteAccountRequest.ID)

		if res.RowsAffected < 1 {
			return false, errors.New("删除失败")
		}
	}

	return true, nil
}

// accountExist 是否可用
func (us *UserService) AccountExist(account string, userId int64) (flag bool, err error) {

	var userResp user.User
	res := model.Db.Model(&user.User{}).Where("account = ?", account).Find(&userResp)

	if res.RowsAffected < 1 {
		return true, nil
	}

	if userResp.ID == userId {
		return true, nil
	}

	return false, errors.New("不可用")
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
