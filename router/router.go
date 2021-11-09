package router

import (
	"i421/controller/home"
	"i421/controller/user"

	"github.com/gin-gonic/gin"
)

func Routers(router *gin.Engine) {

	router.GET("/", home.Index)

	router.POST("/api/login", user.Login)
	router.POST("/api/register", user.Register)
}
