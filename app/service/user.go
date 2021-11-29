package service

import (
	"fmt"
	"i421/app/model"
	"i421/app/model/user"
)

type UserService struct {
}

func NewUserService() *UserService {
	return &UserService{}
}

func (us *UserService) Login(params map[string]string) bool {
	var user user.User
	res := model.Db.Where("phone = ? AND password = ?", params["username"], params["password"]).Or("email = ? AND password = ?", params["username"], params["password"]).Find(&user)
	fmt.Println(user)
	if res.RowsAffected == 0 {
		return false
	}
	return true

}

func (us *UserService) Create(users []map[string]interface{}) {
}
