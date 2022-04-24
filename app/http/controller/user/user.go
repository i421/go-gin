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

// LoginResp 用户登陆返回结构体
type LoginResp struct {
	user.User        // 登陆用户
	Token     string `json:"token"` // 登陆后添加令牌
}

// GetUserInfoResp 用户信息结构体
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

// GetUserInfo 获取用户信息
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
	userInfoResp.HomePath = "/dashboard"

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

// GetAccountList 获取账户列表
func GetAccountList(c *gin.Context) {

	var accountListRequest request.AccountListRequest

	if err := c.ShouldBind(&accountListRequest); err != nil {
		res := Response{
			Code: 1,
			Msg:  err.Error(),
		}
		c.JSON(http.StatusBadRequest, res)
		return
	}

	userService := service.NewUserService()
	users, total, err := userService.AccountList(accountListRequest)

	// 登陆失败
	if err != nil {
		res := Response{
			Code: 1,
			Msg:  err.Error(),
		}

		c.JSON(http.StatusOK, res)
		return
	}

	res := Response{
		Code:  0,
		Msg:   "success",
		Data:  users,
		Total: total,
	}

	c.JSON(http.StatusOK, res)
}

// UpdateOrCreateAccount 更新用户信息
func UpdateOrCreateAccount(c *gin.Context) {

	var updateOrCreateAccountRequest request.UpdateOrCreateAccountRequest

	if err := c.ShouldBind(&updateOrCreateAccountRequest); err != nil {
		res := Response{
			Code: 1,
			Msg:  err.Error(),
		}
		c.JSON(http.StatusBadRequest, res)
		return
	}

	var err error

	userService := service.NewUserService()
	if updateOrCreateAccountRequest.UserID != 0 {
		_, err = userService.UpdateAccount(updateOrCreateAccountRequest)
	} else {
		_, err = userService.CreateAccount(updateOrCreateAccountRequest)
	}

	// 更新失败
	if err != nil {
		res := Response{
			Code: 1,
			Msg:  err.Error(),
		}

		c.JSON(http.StatusOK, res)
		return
	}

	res := Response{
		Code: 0,
		Msg:  "success",
	}

	c.JSON(http.StatusOK, res)
}

// DeleteAccount 删除用户
func DeleteAccount(c *gin.Context) {

	var deleteAccountRequest request.DeleteAccountRequest

	if err := c.ShouldBind(&deleteAccountRequest); err != nil {
		res := Response{
			Code: 1,
			Msg:  err.Error(),
		}
		c.JSON(http.StatusBadRequest, res)
		return
	}

	userService := service.NewUserService()
	_, err := userService.DeleteAccount(deleteAccountRequest)

	// 删除失败
	if err != nil {
		res := Response{
			Code: 1,
			Msg:  err.Error(),
		}

		c.JSON(http.StatusOK, res)
		return
	}

	res := Response{
		Code: 0,
		Msg:  "success",
		Data: 0,
	}

	c.JSON(http.StatusOK, res)
}

// AccountExist 检查账户是否可用
func AccountExist(c *gin.Context) {

	var accountExistRequest request.AccountExistRequest

	if err := c.ShouldBind(&accountExistRequest); err != nil {
		res := Response{
			Code: 1,
			Msg:  err.Error(),
		}
		c.JSON(http.StatusBadRequest, res)
		return
	}

	userService := service.NewUserService()
	_, err := userService.AccountExist(accountExistRequest.Account, accountExistRequest.UserId)

	// 删除失败
	if err != nil {
		res := Response{
			Code: 1,
			Msg:  err.Error(),
		}

		c.JSON(http.StatusOK, res)
		return
	}

	res := Response{
		Code: 0,
		Msg:  "success",
		Data: accountExistRequest.Account + " can use",
	}

	c.JSON(http.StatusOK, res)
}

// UpdatePassword 更新用户密码
func UpdatePassword(c *gin.Context) {

	var updatePasswordRequest request.UpdatePasswordRequest

	if err := c.ShouldBind(&updatePasswordRequest); err != nil {
		res := Response{
			Code: 1,
			Msg:  err.Error(),
		}
		c.JSON(http.StatusBadRequest, res)
		return
	}

	userService := service.NewUserService()
	_, err := userService.UpdatePassword(updatePasswordRequest)

	// 删除失败
	if err != nil {
		res := Response{
			Code: 1,
			Msg:  err.Error(),
		}

		c.JSON(http.StatusOK, res)
		return
	}

	res := Response{
		Code: 0,
		Msg:  "success",
		Data: 0,
	}

	c.JSON(http.StatusOK, res)
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
