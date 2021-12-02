package router

import (
	"i421/app/http/controller/home"
	"i421/app/http/controller/live"
	"i421/app/http/controller/user"
	"i421/app/http/middleware/authorization"
	"i421/app/http/middleware/cors"
	"net/http"

	"github.com/gin-gonic/gin"
)

func Routers(router *gin.Engine) {
	router.Use(cors.Next())
	router.GET("/", home.Index)
	router.POST("/api/register", user.Register)
	router.POST("/api/login", user.Login)

	//处理静态资源（不建议gin框架处理静态资源，参见 public/readme.md 说明 ）
	router.Static("/public", "./public")          //  定义静态资源路由与实际目录映射关系
	router.StaticFS("/dir", http.Dir("./public")) // 将public目录内的文件列举展示

	api := router.Group("/api/")
	{
		api.Use(authorization.CheckToken())
		{
			api.GET("/", home.Index)
		}
	}

	ilive := router.Group("/live/")
	{
		ilive.GET("/stat", live.Livestat)
		ilive.GET("/contral/get", live.Get)
		ilive.GET("/contral/reset", live.Reset)
		ilive.GET("/contral/delete", live.Delete)
		ilive.GET("/contral/push", live.Push)
		ilive.GET("/contral/pull", live.Pull)
	}
}
