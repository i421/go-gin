package router

import (
	"i421/controller/home"
	"i421/controller/user"

	"github.com/gin-gonic/gin"
)

func Routers(router *gin.Engine) {

	router.GET("/api/login", user.Login)
	router.GET("/api/register", user.Register)
	router.GET("/", home.Index)
}
