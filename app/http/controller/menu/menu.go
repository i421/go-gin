package menu

import (
	. "i421/app/http/controller"
	request "i421/app/http/request/menu"
	"i421/app/service"
	"net/http"

	"github.com/gin-gonic/gin"
)

// 获取权限信息
func GetMenuList(c *gin.Context) {

	var menuListRequest request.MenuListRequest

	if err := c.ShouldBind(&menuListRequest); err != nil {
		res := Response{
			Code: 1,
			Msg:  err.Error(),
		}
		c.JSON(http.StatusBadRequest, res)
		return
	}

	menuService := service.NewMenuService()
	menuListResp, err := menuService.GetMenuList(menuListRequest)

	// 获取失败
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
		Data: menuListResp,
	}

	c.JSON(http.StatusOK, res)
}

// 更新菜单信息
func UpdateOrCreateMenu(c *gin.Context) {

	var updateOrCreateMenuRequest request.UpdateOrCreateMenuRequest

	if err := c.ShouldBind(&updateOrCreateMenuRequest); err != nil {
		res := Response{
			Code: 1,
			Msg:  err.Error(),
		}
		c.JSON(http.StatusBadRequest, res)
		return
	}

	var err error

	menuService := service.NewMenuService()
	if updateOrCreateMenuRequest.ID != 0 {
		_, err = menuService.UpdateMenu(updateOrCreateMenuRequest)
	} else {
		_, err = menuService.CreateMenu(updateOrCreateMenuRequest)
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

// 删除菜单
func DeleteMenu(c *gin.Context) {

	var deleteMenuRequest request.DeleteMenuRequest

	if err := c.ShouldBind(&deleteMenuRequest); err != nil {
		res := Response{
			Code: 1,
			Msg:  err.Error(),
		}
		c.JSON(http.StatusBadRequest, res)
		return
	}

	menuService := service.NewMenuService()
	_, err := menuService.DeleteMenu(deleteMenuRequest)

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
