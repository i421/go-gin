package home

import (
	"net/http"

	. "i421/controller"

	"github.com/gin-gonic/gin"
)

// index
func Index(c *gin.Context) {
	resp := Response{
		Code: 200,
		Msg:  "hello i421",
	}

	c.JSON(http.StatusOK, resp)
}
