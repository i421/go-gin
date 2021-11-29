package user

import (
	"context"
	. "i421/app/http/controller"
	"i421/app/model"
	"i421/app/model/role"
	. "i421/app/redis"
	"i421/app/service"
	"net/http"

	"github.com/gin-gonic/gin"
)

var ctx = context.Background()

// login
func Login(c *gin.Context) {

	var roles []role.Role
	//var permissions []permission.Permission
	model.Db.Preload("Permissions").Find(&roles)
	//model.Db.Model(&permission.Permission{}).Find(&permissions)

	params := map[string]string{
		"username": "13738284583",
		"password": "admin",
	}

	userService := service.NewUserService()
	userService.Login(params)
	//data := us.Login(params)
	//fmt.Println("data:", data)

	res := Response{
		Code: 200,
		Msg:  "success",
		Data: roles,
	}

	c.JSON(http.StatusOK, res)
}

// register
func Register(c *gin.Context) {
	// todo
}

// user list
func List(c *gin.Context) {
	// todo
}

// edit user
func Edit(c *gin.Context) {
	// todo
}

// user del
func Del(c *gin.Context) {
	// todo
}

// Hello
func Hello() {
	err := Redis.Set(ctx, "key", "value", 0).Err()
	if err != nil {
		panic(err)
	}
}
