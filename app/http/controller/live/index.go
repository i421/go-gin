package live

import (
	. "i421/app/http/controller"
	"i421/app/utils/live"
	"net/http"

	"github.com/gin-gonic/gin"
)

// Livestat 直播状态
func Livestat(c *gin.Context) {

	ilive := live.NewILive()

	res := ilive.Stat()

	resp := Response{
		Code: 200,
		Msg:  "success",
		Data: res,
	}
	c.JSON(http.StatusOK, resp)
}
