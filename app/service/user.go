package service

import (
	"errors"
	"fmt"
	request "i421/app/http/request/user"
	"i421/app/model"
	"i421/app/model/roleUser"
	"i421/app/model/user"
	"i421/app/utils/iaes"
)

// UserService 用户表service层
type UserService struct {
}

// AccountListWhereCond 用户列表查询
type AccountListWhereCond struct {
	DeptId   int64  `json:"dept_id"`
	Account  string `json:"account"`
	Nickname string `json:"nickname"`
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

	iAes := iaes.NewIAes()
	passwd, _ := iAes.EncryptByAes([]byte(loginRequest.Password))

	res = model.Db.Model(&user.User{}).Preload("Roles").Select([]string{"id", "account", "nickname", "avatar", "user.status", "real_name", "remark"}).Where("account = ? AND password = ?", loginRequest.Username, passwd).First(&userResp)

	if res.RowsAffected < 1 {
		return userResp, errors.New("用户密码不匹配")
	}

	fmt.Println(userResp.Status)

	if userResp.Status == 1 {
		return userResp, errors.New("用户禁止登录")
	}

	return userResp, nil
}

// UserInfo 获取用户信息
func (us *UserService) GetUserInfo(userId int64) (userResp user.User, err error) {

	res := model.Db.Model(&user.User{}).Preload("Roles").Select([]string{"id", "account", "nickname", "avatar", "real_name", "remark"}).Where("id = ?", userId).First(&userResp)

	if res.RowsAffected < 1 {
		return userResp, errors.New("用户不存在")
	}

	return userResp, nil
}

// AccountList 获取用户列表
func (us *UserService) AccountList(accountListRequest request.AccountListRequest) (userResp []user.UserAppendRoleIds, total int64, err error) {

	// 查询条件结构体
	var whereCond AccountListWhereCond

	if accountListRequest.DeptId != 0 {
		whereCond.DeptId = accountListRequest.DeptId
	}

	if accountListRequest.Account != "" {
		whereCond.Account = accountListRequest.Account
	}

	if accountListRequest.Nickname != "" {
		whereCond.Nickname = accountListRequest.Nickname
	}

	temp := model.Db.Model(&user.User{}).Preload("Roles").Select([]string{"user.id", "account", "nickname", "password", "user.status", "user.create_time", "user.remark", "dept_id"}).Where("user.is_deleted != 1").Where(whereCond).Order("user.id")

	var count int64
	temp.Count(&count)

	res := temp.Limit(accountListRequest.PageSize).Offset((accountListRequest.Page - 1) * accountListRequest.PageSize).Find(&userResp)

	iAes := iaes.NewIAes()

	for i, v := range userResp {
		var ids []int64
		var names []string

		for _, vv := range v.Roles {
			ids = append(ids, vv.ID)
			names = append(names, vv.RoleName)
		}

		passwd, _ := iAes.DecryptByAes(userResp[i].Password)

		userResp[i].Password = string(passwd)
		userResp[i].RoleIds = ids
		userResp[i].RoleNames = names
	}

	if res.RowsAffected < 1 {
		return userResp, 0, errors.New("查询为空")
	}

	return userResp, count, nil
}

// deleteUser 删除账户
func (us *UserService) DeleteAccount(deleteAccountRequest request.DeleteAccountRequest) (flag bool, err error) {

	if deleteAccountRequest.Type != "" {
		res := model.Db.Model(&user.User{}).Where("id = ?", deleteAccountRequest.ID).Updates(map[string]interface{}{"is_deleted": 1})
		model.Db.Where("user_id = ?", deleteAccountRequest.ID).Delete(&roleUser.RoleUser{})

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

// updateAccount 更新用户
func (us *UserService) UpdateAccount(updateAccountRequest request.UpdateOrCreateAccountRequest) (flag bool, err error) {

	var roleUsers []roleUser.RoleUser

	iAes := iaes.NewIAes()
	passwd, _ := iAes.EncryptByAes([]byte(updateAccountRequest.Password))

	for _, item := range updateAccountRequest.RoleIds {
		var roleUser roleUser.RoleUser
		roleUser.RoleId = item
		roleUser.UserId = updateAccountRequest.UserID
		roleUsers = append(roleUsers, roleUser)
	}

	model.Db.Model(&user.User{}).Where("id = ?", updateAccountRequest.UserID).Select("account", "remark", "nickname", "password", "status", "dept_id").Updates(&user.User{Account: updateAccountRequest.Account, Remark: updateAccountRequest.Remark, Nickname: updateAccountRequest.Nickname, Password: passwd, Status: updateAccountRequest.Status, DeptId: updateAccountRequest.DeptId})

	model.Db.Where("user_id = ?", updateAccountRequest.UserID).Delete(&roleUser.RoleUser{})
	model.Db.Model(&roleUser.RoleUser{}).Create(&roleUsers)

	return true, nil
}

// CreateAccount 创建用户
func (us *UserService) CreateAccount(createAccountRequest request.UpdateOrCreateAccountRequest) (flag bool, err error) {

	iAes := iaes.NewIAes()
	passwd, _ := iAes.EncryptByAes([]byte(createAccountRequest.Password))

	userResp := user.User{Account: createAccountRequest.Account, Remark: createAccountRequest.Remark, Nickname: createAccountRequest.Nickname, Password: passwd, Status: createAccountRequest.Status, DeptId: createAccountRequest.DeptId}

	res := model.Db.Create(&userResp)

	if res.RowsAffected < 1 {
		return false, errors.New("用户已存在")
	}

	var roleUsers []roleUser.RoleUser

	for _, item := range createAccountRequest.RoleIds {
		var roleUser roleUser.RoleUser
		roleUser.RoleId = item
		roleUser.UserId = userResp.ID
		roleUsers = append(roleUsers, roleUser)
	}

	model.Db.Model(&roleUser.RoleUser{}).Create(&roleUsers)

	return true, nil
}

// UpdatePassword 更新用户
func (us *UserService) UpdatePassword(updatePasswordRequest request.UpdatePasswordRequest) (flag bool, err error) {

	var userResp user.User

	iAes := iaes.NewIAes()
	oldPasswd, _ := iAes.EncryptByAes([]byte(updatePasswordRequest.OldPwd))
	newPasswd, _ := iAes.EncryptByAes([]byte(updatePasswordRequest.NewPwd))

	res := model.Db.Model(&user.User{}).Where("id = ?", updatePasswordRequest.ID).Find(&userResp)

	if res.RowsAffected < 1 {
		return false, errors.New("用户不存在")
	}

	if userResp.Password != oldPasswd {
		return false, errors.New("原密码不正确")
	}

	if userResp.Password == newPasswd {
		return false, errors.New("新密码不能与原密码一致")
	}

	model.Db.Model(&user.User{}).Where("id = ?", updatePasswordRequest.ID).Update("password", newPasswd)

	return true, nil
}

// setAccountStatus 调整用户状态
func (us *UserService) SetAccountStatus(setAccountStatusRequest request.SetAccountStatusRequest) (flag bool, err error) {

	res := model.Db.Model(&user.User{}).Where("id = ?", setAccountStatusRequest.ID).Updates(map[string]interface{}{"status": setAccountStatusRequest.Status})

	if res.RowsAffected < 1 {
		return false, errors.New("设置失败")
	}
	return true, nil
}
