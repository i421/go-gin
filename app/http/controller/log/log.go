package log

import (
	. "i421/app/http/controller"
	request "i421/app/http/request/log"
	"i421/app/service"
	"net/http"

	"github.com/gin-gonic/gin"
)

// 获取日志信息
func GetLogList(c *gin.Context) {

	var logListRequest request.LogListRequest

	if err := c.ShouldBind(&logListRequest); err != nil {
		res := PaginationResponse{
			Code: 1,
			Msg:  err.Error(),
		}
		c.JSON(http.StatusBadRequest, res)
		return
	}

	logService := service.NewLogService()
	logListResp, total, err := logService.GetLogList(logListRequest)

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
			Items: logListResp,
		},
	}

	c.JSON(http.StatusOK, res)
}

// 删除部门信息
func DeleteLog(c *gin.Context) {

	var deleteLogRequest request.DeleteLogRequest

	if err := c.ShouldBind(&deleteLogRequest); err != nil {
		res := Response{
			Code: 1,
			Msg:  err.Error(),
		}
		c.JSON(http.StatusBadRequest, res)
		return
	}

	logService := service.NewLogService()
	_, err := logService.DeleteLog(deleteLogRequest)

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
