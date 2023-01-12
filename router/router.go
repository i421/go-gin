package router

import (
	"i421/app/http/controller/config"
	"i421/app/http/controller/dept"
	"i421/app/http/controller/home"
	"i421/app/http/controller/log"
	"i421/app/http/controller/menu"
	"i421/app/http/controller/role"
	"i421/app/http/controller/upload"
	"i421/app/http/controller/user"
	"i421/app/http/middleware/authorization"
	"i421/app/http/middleware/cors"
	"i421/app/http/middleware/ilog"
	"net/http"

	"github.com/gin-gonic/gin"
)

func Routers(router *gin.Engine) {
	router.Use(cors.Next())
	router.GET("/", home.Index)
	router.POST("/basic-api/login", user.Login)
	router.GET("basic-api/userInfo", authorization.CheckToken(), user.GetUserInfo)
	router.GET("basic-api/getPermCode", authorization.CheckToken(), menu.GetPermCode)
	router.POST("basic-api/menu/navigate", authorization.CheckToken(), menu.GetRoleMenuList)
	router.GET("basic-api/logout", authorization.CheckToken(), user.Logout)
	router.GET("basic-api/getRegisterRoleList", role.GetRegisterRoleList)
	router.POST("basic-api/createAccount", user.UpdateOrCreateAccount)

	// system 路由
	system := router.Group("basic-api/system/")
	{
		system.Use(authorization.CheckToken())
		system.Use(ilog.Record())
		{
			system.GET("getConfigList", config.GetConfigList)
			system.POST("updateOrCreateConfig", config.UpdateOrCreateConfig)
			system.DELETE("deleteConfig", config.DeleteConfig)

			system.GET("getLogList", log.GetLogList)
			system.DELETE("deleteLog", log.DeleteLog)

			system.GET("getDeptList", dept.GetDeptList)
			system.POST("updateOrCreateDept", dept.UpdateOrCreateDept)
			system.DELETE("deleteDept", dept.DeleteDept)

			system.GET("getMenuList", menu.GetMenuList)
			system.POST("updateOrCreateMenu", menu.UpdateOrCreateMenu)
			system.POST("getRoleMenu", menu.GetRoleMenu)
			system.POST("updateRoleMenu", menu.UpdateRoleMenu)
			system.DELETE("deleteMenu", menu.DeleteMenu)

			system.POST("accountExist", user.AccountExist)
			system.GET("getAccountList", user.GetAccountList)
			system.POST("updateOrCreateAccount", user.UpdateOrCreateAccount)
			system.DELETE("deleteAccount", user.DeleteAccount)
			system.POST("updatePassword", user.UpdatePassword)
			system.POST("setAccountStatus", user.SetAccountStatus)

			system.GET("getAllRoleList", role.GetAllRoleList)
			system.GET("getRoleListByPage", role.GetRoleListByPage)
			system.POST("updateOrCreateRole", role.UpdateOrCreateRole)
			system.DELETE("deleteRole", role.DeleteRole)
			system.POST("setRoleStatus", role.SetRoleStatus)
		}
	}

	//处理静态资源（不建议gin框架处理静态资源，参见 public/readme.md 说明 ）
	router.Static("/basic-api/public", "./public")          //  定义静态资源路由与实际目录映射关系
	router.StaticFS("/basic-api/dir", http.Dir("./public")) // 将public目录内的文件列举展示

	file := router.Group("/basic-api/file")
	{
		file.POST("upload", upload.Upload)
		// 个人上传
		file.POST("private-upload", authorization.CheckToken(), upload.PrivateUpload)
	}
}
