package home

import (
	"fmt"
	"net/http"

	. "i421/app/http/controller"
	"i421/app/utils/ijwt"

	"github.com/gin-gonic/gin"
)

// index
func Index(c *gin.Context) {

	/*
		// md5加密
		im5 := imd5.NewIMD5()
		str := im5.Base64Md5("sssk")
		fmt.Println("str: ", str)
		str2 := im5.Base64Md5("sssk")
		fmt.Println("newstr: ", str2)
	*/

	/*
		// Aes加密
		ia := iaes.NewIAes()
		encStr, err := ia.EncryptByAes([]byte("aaaa"))
		fmt.Println("encstr:", encStr)
		fmt.Println("encstr err:", err)

		str, err := ia.DecryptByAes(encStr)

		fmt.Println("str:", string(str))
		fmt.Println("str err:", err)
	*/

	//var roles []role.Role
	//model.Db.Model(&role.Role{}).Where("id = 1").Find(&roles)
	//var users []user.User
	// 条件查询
	//model.Db.Model(&user.User{}).Where("id = 1").Find(&users)
	// 多对多
	//model.Db.Preload("Roles").Find(&users)

	token := c.MustGet("userToken").(*ijwt.MyClaims)

	fmt.Println("ExpiresAt:", token.ExpiresAt)
	//fmt.Println("user_id:", token.UserId)
	//fmt.Println("phone:", token.Phone)

	resp := Response{
		Code: 0,
		Msg:  "hello i421",
		Data: token.ExpiresAt,
	}

	c.JSON(http.StatusOK, resp)
}
