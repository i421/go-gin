package user

import (
	//"context"
	"fmt"
	. "i421/app/http/controller"
	request "i421/app/http/request/user"
	user "i421/app/model/user"
	"i421/app/redis"
	"i421/app/service"
	"i421/app/utils/ijwt"
	"net/http"

	"github.com/gin-gonic/gin"
)

//var ctx = context.Background()

type LoginResp struct {
	user.User        // 登陆用户
	Token     string `json:"token"` // 登陆后添加令牌
}

type GetUserInfoResp struct {
	user.User        // 登陆用户
	Token     string `json:"token"`    // 登陆后添加令牌
	HomePath  string `json:"homePath"` // 首页地址
}

// Login 用户登陆
func Login(c *gin.Context) {

	var userLoginRequest request.UserLoginRequest

	if err := c.ShouldBind(&userLoginRequest); err != nil {
		res := Response{
			Code: 1,
			Msg:  err.Error(),
		}
		c.JSON(http.StatusBadRequest, res)
		return
	}

	userService := service.NewUserService()
	user, err := userService.Login(userLoginRequest)

	// 登陆失败
	if err != nil {
		res := Response{
			Code: 1,
			Msg:  err.Error(),
		}

		c.JSON(http.StatusOK, res)
		return
	}

	// 生成token
	token, _ := ijwt.NewIJwt().GenerateToken(user.ID, user.Telephone)

	var loginResp LoginResp

	loginResp.User = user
	loginResp.Token = token

	res := Response{
		Code: 0,
		Msg:  "success",
		Data: loginResp,
	}

	c.JSON(http.StatusOK, res)
}

// 获取用户信息
func GetUserInfo(c *gin.Context) {

	userToken := c.MustGet("userToken").(*ijwt.MyClaims)

	token := c.MustGet("token").(string)

	userService := service.NewUserService()
	user, err := userService.GetUserInfo(userToken.UserId)

	// 登陆失败
	if err != nil {
		res := Response{
			Code: 1,
			Msg:  err.Error(),
		}

		c.JSON(http.StatusOK, res)
		return
	}

	var userInfoResp GetUserInfoResp

	userInfoResp.User = user
	userInfoResp.Token = token
	userInfoResp.HomePath = "/dashboard/analysis"

	res := Response{
		Code: 0,
		Msg:  "success",
		Data: userInfoResp,
	}

	c.JSON(http.StatusOK, res)
}

// 用户注销
func Logout(c *gin.Context) {

	// token := c.MustGet("token").(string)

	// todo 将当前token 加入redis 黑名单里面 添加中间件检查token

	res := Response{
		Code: 0,
		Msg:  "success",
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
