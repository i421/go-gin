package router

import (
	"i421/app/http/controller/address"
	"i421/app/http/controller/company"
	"i421/app/http/controller/home"
	"i421/app/http/controller/menu"
	"i421/app/http/controller/role"
	"i421/app/http/controller/upload"
	"i421/app/http/controller/user"
	"i421/app/http/middleware/authorization"
	"i421/app/http/middleware/cors"
	"net/http"

	"github.com/gin-gonic/gin"
)

func Routers(router *gin.Engine) {
	router.Use(cors.Next())
	router.GET("/", home.Index)
	router.POST("/basic-api/login", user.Login)
	router.GET("/basic-api/province", address.ProvinceList)
	router.GET("/basic-api/city", address.CityList)
	router.GET("/basic-api/area", address.AreaList)
	router.GET("basic-api/getUserInfo", authorization.CheckToken(), user.GetUserInfo)
	router.GET("basic-api/getPermCode", authorization.CheckToken(), menu.GetPermCode)
	router.GET("basic-api/getMenuList", authorization.CheckToken(), menu.GetRoleMenuList)
	router.GET("basic-api/logout", authorization.CheckToken(), user.Logout)
	router.GET("basic-api/getRegisterRoleList", role.GetRegisterRoleList)
	router.POST("basic-api/createAccount", user.UpdateOrCreateAccount)
	router.GET("basic-api/getPublishedCompany/:area", company.GetPublishedCompanyList)

	// system 路由
	system := router.Group("basic-api/system/")
	{
		system.Use(authorization.CheckToken())
		{
			system.GET("getAllCompanyList", company.GetAllCompanyList)
			// 1 平湖 2 桐乡 3 嘉善
			system.GET("getYhpcList/:area", company.GetYhpcList)
			system.GET("getDqbgList/:area", company.GetDqbgList)
			system.GET("getMyCompanyList/:area", company.GetMyCompanyList)
			system.GET("getPublishedCompanyList/:area", company.GetPublishedCompanyList)
			system.GET("getCompanyListByPage", company.GetCompanyListByPage)
			system.POST("updateOrCreateCompany", company.UpdateOrCreateCompany)
			system.DELETE("deleteCompany", company.DeleteCompany)
			system.POST("setCompanyStatus", company.SetCompanyStatus)

			system.GET("getMenuList", menu.GetMenuList)
			system.POST("updateOrCreateMenu", menu.UpdateOrCreateMenu)
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
