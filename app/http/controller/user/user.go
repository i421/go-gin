package user

import (
	//"context"
	"fmt"
	. "i421/app/http/controller"
	request "i421/app/http/request/user"
	"i421/app/redis"
	"i421/app/service"
	"i421/app/utils/ijwt"
	"net/http"

	"github.com/gin-gonic/gin"
)

//var ctx = context.Background()

// Login 用户登陆
func Login(c *gin.Context) {

	var userLoginRequest request.UserLoginRequest

	if err := c.ShouldBind(&userLoginRequest); err != nil {
		res := Response{
			Code:    http.StatusBadRequest,
			Message: err.Error(),
		}
		c.JSON(http.StatusBadRequest, res)
		return
	}

	userService := service.NewUserService()
	user, err := userService.Login(userLoginRequest)

	// 登陆失败
	if err != nil {
		res := Response{
			Code:    http.StatusBadRequest,
			Message: err.Error(),
		}

		c.JSON(http.StatusOK, res)
		return
	}

	// 生成token
	token, _ := ijwt.NewIJwt().GenerateToken(user.ID, user.Telephone)
	//data["token"] = token

	res := Response{
		Code:    http.StatusOK,
		Message: "success",
		Result: map[string]interface{}{
			"token": token,
			"user":  user,
		},
	}

	c.JSON(http.StatusOK, res)
}

// Register 注册用户
func Register(c *gin.Context) {

	/*
		var userRegisterRequest request.UserRegisterRequest

		if err := c.ShouldBind(&userRegisterRequest); err != nil {
			res := Response{
				Code: http.StatusBadRequest,
				Message:  err.Error(),
			}
			c.JSON(http.StatusBadRequest, res)
			return
		}

		userService := service.NewUserService()
		user, err := userService.Create(userRegisterRequest)
		if err != nil {
			res := Response{
				Code: http.StatusBadRequest,
				Message:  err.Error(),
			}

			c.JSON(http.StatusOK, res)
			return
		}

		res := Response{
			Code: http.StatusOK,
			Message:  "success",
			Result: user,
		}

		c.JSON(http.StatusOK, res)
	*/
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
func Hello(c *gin.Context) {
	redis := redis.GetRedis()
	err := redis.Set(c, "key", "newValue", 0).Err()
	if err != nil {
		panic(err)
	}

	fmt.Println("done")
}
