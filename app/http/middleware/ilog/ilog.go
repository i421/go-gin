package ilog

import (
	"i421/app/model"
	"i421/app/model/log"
	"i421/app/utils/ijwt"

	"github.com/gin-gonic/gin"
)

// 记录日志
func Record() gin.HandlerFunc {
	return func(c *gin.Context) {
		token := c.MustGet("userToken").(*ijwt.MyClaims)

		url := string(c.Request.URL.Host)
		title := string(c.Request.RequestURI)
		method := string(c.Request.Method)
		ip := string(c.Request.RemoteAddr)

		logResp := log.Log{UserId: token.UserId, Title: title, Url: url, Ip: ip, Method: method, Operation: title}
		_ = model.Db.Create(&logResp)
		c.Next()
	}
}
