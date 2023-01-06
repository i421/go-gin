package config

import (
	. "i421/app/http/controller"
	request "i421/app/http/request/config"
	"i421/app/service"
	"net/http"

	"github.com/gin-gonic/gin"
)

// 获取部门信息
func GetConfigList(c *gin.Context) {

	var configListRequest request.ConfigListRequest

	if err := c.ShouldBind(&configListRequest); err != nil {
		res := PaginationResponse{
			Code: 1,
			Msg:  err.Error(),
		}
		c.JSON(http.StatusBadRequest, res)
		return
	}

	configService := service.NewConfigService()
	configListResp, total, err := configService.GetConfigList(configListRequest)

	// 获取失败
	if err != nil {
		res := PaginationResponse{
			Code: 1,
			Msg:  err.Error(),
		}

		c.JSON(http.StatusOK, res)
		return
	}

	res := PaginationResponse{
		Code: 0,
		Msg:  "success",
		Data: PaginationStruct{
			Total: total,
			Items: configListResp,
		},
	}

	c.JSON(http.StatusOK, res)
}

// 删除部门信息
func DeleteConfig(c *gin.Context) {

	var deleteConfigRequest request.DeleteConfigRequest

	if err := c.ShouldBind(&deleteConfigRequest); err != nil {
		res := Response{
			Code: 1,
			Msg:  err.Error(),
		}
		c.JSON(http.StatusBadRequest, res)
		return
	}

	configService := service.NewConfigService()
	_, err := configService.DeleteConfig(deleteConfigRequest)

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

// 更新配置信息
func UpdateOrCreateConfig(c *gin.Context) {

	var updateOrCreateConfigRequest request.UpdateOrCreateConfigRequest

	if err := c.ShouldBind(&updateOrCreateConfigRequest); err != nil {
		res := Response{
			Code: 1,
			Msg:  err.Error(),
		}
		c.JSON(http.StatusBadRequest, res)
		return
	}

	var err error

	configService := service.NewConfigService()
	if updateOrCreateConfigRequest.ID != 0 {
		_, err = configService.UpdateConfig(updateOrCreateConfigRequest)
	} else {
		_, err = configService.CreateConfig(updateOrCreateConfigRequest)
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
