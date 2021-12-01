package service

import (
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
func (us *UserService) Login(params map[string]string) interface{} {
	var user user.User
	res := model.Db.Select("id, nickname, uuid, phone, email, avatar").Where("status = 1 AND phone = ? AND password = ?", params["username"], params["password"]).Or("email = ? AND password = ?", params["username"], params["password"]).Find(&user)
	if res.RowsAffected == 0 {
		return nil
	}
	return user

}

// Create 创建用户
func (us *UserService) Create(users []map[string]interface{}) {
}
