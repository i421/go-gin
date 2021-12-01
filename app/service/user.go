package service

import (
	"i421/app/model"
	"i421/app/model/user"
)

type UserService struct {
}

func NewUserService() *UserService {
	return &UserService{}
}

func (us *UserService) Login(params map[string]string) interface{} {
	var user user.User
	res := model.Db.Select("id, nickname, uuid, phone, email, avatar").Where("status = 1 AND phone = ? AND password = ?", params["username"], params["password"]).Or("email = ? AND password = ?", params["username"], params["password"]).Find(&user)
	if res.RowsAffected == 0 {
		return nil
	}
	return user

}

func (us *UserService) Create(users []map[string]interface{}) {
}
