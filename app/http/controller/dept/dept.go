package dept

import (
	. "i421/app/http/controller"
	request "i421/app/http/request/dept"
	"i421/app/service"
	"net/http"

	"github.com/gin-gonic/gin"
)

// 获取部门信息
func GetDeptList(c *gin.Context) {

	var deptListRequest request.DeptListRequest

	if err := c.ShouldBind(&deptListRequest); err != nil {
		res := Response{
			Code: 1,
			Msg:  err.Error(),
		}
		c.JSON(http.StatusBadRequest, res)
		return
	}

	departService := service.NewDepartService()
	departListResp, err := departService.GetDepartList(deptListRequest)

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
		Data: departListResp,
	}

	c.JSON(http.StatusOK, res)
}

// 更新部门信息
func UpdateDept(c *gin.Context) {

	var updateDeptRequest request.UpdateDeptRequest

	if err := c.ShouldBind(&updateDeptRequest); err != nil {
		res := Response{
			Code: 1,
			Msg:  err.Error(),
		}
		c.JSON(http.StatusBadRequest, res)
		return
	}

	departService := service.NewDepartService()
	_, err := departService.UpdateDepart(updateDeptRequest)

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

// 删除部门信息
func DeleteDept(c *gin.Context) {

	var deleteDeptRequest request.DeleteDeptRequest

	if err := c.ShouldBind(&deleteDeptRequest); err != nil {
		res := Response{
			Code: 1,
			Msg:  err.Error(),
		}
		c.JSON(http.StatusBadRequest, res)
		return
	}

	departService := service.NewDepartService()
	_, err := departService.DeleteDepart(deleteDeptRequest.ID)

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
	}

	c.JSON(http.StatusOK, res)
}
