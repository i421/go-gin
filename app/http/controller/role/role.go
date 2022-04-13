package role

import (
	. "i421/app/http/controller"
	request "i421/app/http/request/role"
	"i421/app/service"
	"net/http"

	"github.com/gin-gonic/gin"
)

// 获取角色信息
func GetAllRoleList(c *gin.Context) {

	roleService := service.NewRoleService()
	roleListResp, err := roleService.GetAllRoleList()

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
		Data: roleListResp,
	}

	c.JSON(http.StatusOK, res)
}

// 获取分页角色信息
func GetRoleListByPage(c *gin.Context) {

	var getRoleListByPageRequest request.GetRoleListByPageRequest

	if err := c.ShouldBind(&getRoleListByPageRequest); err != nil {
		res := Response{
			Code: 1,
			Msg:  err.Error(),
		}
		c.JSON(http.StatusBadRequest, res)
		return
	}

	roleService := service.NewRoleService()
	roleListResp, total, err := roleService.GetRoleListByPage(getRoleListByPageRequest)

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
		Code:  0,
		Msg:   "success",
		Data:  roleListResp,
		Total: total,
	}

	c.JSON(http.StatusOK, res)
}

// 设置角色状态
func SetRoleStatus(c *gin.Context) {

	var setRoleStatusRequest request.SetRoleStatusRequest

	if err := c.ShouldBind(&setRoleStatusRequest); err != nil {
		res := Response{
			Code: 1,
			Msg:  err.Error(),
		}
		c.JSON(http.StatusBadRequest, res)
		return
	}

	departService := service.NewRoleService()
	_, err := departService.SetRoleStatus(setRoleStatusRequest)

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

// 更新角色信息
func UpdateOrCreateRole(c *gin.Context) {

	var updateOrCreateRoleRequest request.UpdateOrCreateRoleRequest

	if err := c.ShouldBind(&updateOrCreateRoleRequest); err != nil {
		res := Response{
			Code: 1,
			Msg:  err.Error(),
		}
		c.JSON(http.StatusBadRequest, res)
		return
	}

	var err error

	roleService := service.NewRoleService()
	if updateOrCreateRoleRequest.ID != 0 {
		_, err = roleService.UpdateRole(updateOrCreateRoleRequest)
	} else {
		_, err = roleService.CreateRole(updateOrCreateRoleRequest)
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

// 删除角色信息
func DeleteRole(c *gin.Context) {

	var deleteRoleRequest request.DeleteRoleRequest

	if err := c.ShouldBind(&deleteRoleRequest); err != nil {
		res := Response{
			Code: 1,
			Msg:  err.Error(),
		}
		c.JSON(http.StatusBadRequest, res)
		return
	}

	roleService := service.NewRoleService()
	_, err := roleService.DeleteRole(deleteRoleRequest)

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
