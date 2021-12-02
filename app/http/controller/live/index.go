package live

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

// Livestat 直播状态
func Livestat(c *gin.Context) {
	// todo
	resp, err := http.Get("http://example.com/")
}
