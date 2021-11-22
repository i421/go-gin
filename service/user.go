package service

import "fmt"

type UserService struct {
}

func (us UserService) Login(params map[string]string) bool {
	fmt.Println("username:", params["username"])
	return true
}

func (us UserService) Create(users []map[string]interface{}) {
}
