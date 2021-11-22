package user

import (
	"context"
	. "i421/controller"
	"i421/model/role"
	. "i421/redis"
	"i421/service"
	"net/http"

	"github.com/gin-gonic/gin"
)

var ctx = context.Background()

// login
func Login(c *gin.Context) {

	var roles []role.Role
	//var permissions []permission.Permission
	//model.Db.Preload("Permissions").Find(&roles)
	//model.Db.Model(&permission.Permission{}).Find(&permissions)

	params := map[string]string{
		"username": "admin",
		"password": "admin",
	}

	var us service.UserService
	data := service.UserService.Login(us, params)

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
