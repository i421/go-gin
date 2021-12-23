package service

import (
	"errors"
	"fmt"
	request "i421/app/http/request/user"
	"i421/app/model"
	"i421/app/model/user"

	"github.com/google/uuid"
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
	// 尝试 var user []map[string]interface{}
	var user user.User
	res := model.Db.Select("id, nickname, uuid, phone, email, avatar").Where("status = 1 AND phone = ? AND password = ?", params["username"], params["password"]).Or("email = ? AND password = ?", params["username"], params["password"]).Find(&user)
	if res.RowsAffected == 0 {
		return nil
	}
	return user

}

// Create 创建用户
func (us *UserService) Create(registerRequest request.UserRegisterRequest) (int, error) {
	var user1 user.User
	res := model.Db.Where("phone = ?", registerRequest.Phone).First(&user1)

	if res.RowsAffected >= 1 {
		return -2, errors.New("用户已存在")
	}

	user2 := user.User{
		Nickname:        registerRequest.Phone,
		Phone:           registerRequest.Phone,
		Password:        registerRequest.Password,
		EmailVerifiedAt: "2020-01-01",
		UUID:            uuid.New().String(),
		Status:          1,
	}

	res = model.Db.Create(&user2)

	if res.Error != nil {
		fmt.Println(res.Error)
		return -1, errors.New("用户创建失败")
	}

	return user2.ID, nil
}
