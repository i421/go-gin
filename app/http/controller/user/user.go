package user

import (
	"context"
	"i421/app/global"
	. "i421/app/http/controller"
	request "i421/app/http/request/user"
	"i421/app/model/user"
	. "i421/app/redis"
	"i421/app/service"
	"i421/app/utils/ijwt"
	"net/http"

	"github.com/gin-gonic/gin"
)

var ctx = context.Background()

// login
func Login(c *gin.Context) {

	var userLoginRequest request.UserLoginRequest

	if err := c.ShouldBind(&userLoginRequest); err != nil {
		res := Response{
			Code: http.StatusBadRequest,
			Msg:  err.Error(),
		}
		c.JSON(http.StatusBadRequest, res)
		return
	}

	params := map[string]string{
		"username": userLoginRequest.Username,
		"password": userLoginRequest.Password,
	}

	userService := service.NewUserService()
	data := userService.Login(params)

	// 登陆失败
	if data == nil {
		res := Response{
			Code: 10000,
			Msg:  global.WRONG_USERNAME_OR_PASSWORD,
		}

		c.JSON(http.StatusOK, res)
		return
	}

	// 转换
	user, _ := data.(user.User)

	// 生成token
	token, _ := ijwt.NewIJwt().GenerateToken(user.ID, user.Phone)
	//data["token"] = token

	res := Response{
		Code: http.StatusOK,
		Msg:  "success",
		Data: map[string]interface{}{
			"token": token,
			"user":  user,
		},
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
