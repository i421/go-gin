package home

import (
	"net/http"

	. "i421/controller"
	"i421/model"
	"i421/model/user"

	"github.com/gin-gonic/gin"
)

// index
func Index(c *gin.Context) {

	//var roles []role.Role
	//model.Db.Model(&role.Role{}).Where("id = 1").Find(&roles)
	var users []user.User
	// 条件查询
	//model.Db.Model(&user.User{}).Where("id = 1").Find(&users)
	// 多对多
	model.Db.Preload("Roles").Find(&users)

	resp := Response{
		Code: 200,
		Msg:  "hello i421",
		Data: users,
	}

	c.JSON(http.StatusOK, resp)
}
