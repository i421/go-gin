package router

import (
	"i421/app/http/controller/dept"
	"i421/app/http/controller/home"
	"i421/app/http/controller/live"
	"i421/app/http/controller/menu"
	"i421/app/http/controller/role"
	"i421/app/http/controller/user"
	"i421/app/http/middleware/authorization"
	"i421/app/http/middleware/cors"
	"net/http"

	"github.com/gin-gonic/gin"
)

func Routers(router *gin.Engine) {
	router.Use(cors.Next())
	router.GET("/", home.Index)
	router.POST("/login", user.Login)
	router.POST("/api/register", user.Register)

	router.Use(authorization.CheckToken())
	{
		router.GET("getUserInfo", user.GetUserInfo)
		router.GET("logout", user.Logout)
	}

	// system 路由
	system := router.Group("/system/")
	{
		system.Use(authorization.CheckToken())
		{
			system.GET("getMenuList", menu.GetMenuList)
			system.POST("updateMenu", menu.UpdateMenu)
			system.DELETE("deleteMenu", menu.DeleteMenu)

			system.GET("getDeptList", dept.GetDeptList)
			system.POST("updateDept", dept.UpdateDept)
			system.DELETE("deleteDept", dept.DeleteDept)

			system.POST("accountExist", user.AccountExist)
			system.GET("getAccountList", user.GetAccountList)
			system.POST("updateAccount", user.UpdateAccount)
			system.DELETE("deleteAccount", user.DeleteAccount)
			system.POST("updatePassword", user.UpdatePassword)

			system.GET("getAllRoleList", role.GetAllRoleList)
			system.GET("getRoleListByPage", role.GetRoleListByPage)
			system.POST("updateRole", role.UpdateRole)
			system.DELETE("deleteRole", role.DeleteRole)
			system.POST("setRoleStatus", role.SetRoleStatus)
		}
	}

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
		ilive.GET("/control/get", live.Get)
		ilive.GET("/control/reset", live.Reset)
		ilive.GET("/control/delete", live.Delete)
		ilive.GET("/control/push", live.Push)
		ilive.GET("/control/pull", live.Pull)
	}
}
