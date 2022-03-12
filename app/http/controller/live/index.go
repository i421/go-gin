package live

import (
	"encoding/json"
	"i421/app/global"
	. "i421/app/http/controller"
	"i421/app/utils/live"
	"net/http"

	"github.com/gin-gonic/gin"
)

// Livestat 直播状态
func Livestat(c *gin.Context) {

	ilive := live.NewILive()

	res, err := ilive.Stat()

	if err != nil {
		resp := Response{
			Code:    global.HTTP_REQUEST_ERROR_CODE,
			Message: res,
		}
		c.JSON(http.StatusOK, resp)
		return
	}

	resp := Response{
		Code:    200,
		Message: "success",
		Result:  json.RawMessage(res),
	}
	c.JSON(http.StatusOK, resp)
}
