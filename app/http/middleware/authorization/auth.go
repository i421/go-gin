package authorization

import (
	"i421/app/global"
	. "i421/app/http/controller"
	"i421/app/utils/ijwt"
	"i421/config"
	"net/http"
	"strings"

	"github.com/gin-gonic/gin"
)

type HeaderParams struct {
	Authorization string `header:"Authorization" binding:"required,min=20"`
}

// CheckTokenAuth 检查token完整性、有效性中间件
func CheckToken() gin.HandlerFunc {
	return func(c *gin.Context) {

		headerParams := HeaderParams{}

		//  推荐使用 ShouldBindHeader 方式获取头参数
		if err := c.ShouldBindHeader(&headerParams); err != nil {
			res := Response{
				Code: http.StatusBadRequest,
				Msg:  global.WRONG_TOKEN,
			}
			c.AbortWithStatusJSON(http.StatusBadRequest, res)
			return
		}
		token := strings.Split(headerParams.Authorization, " ")
		if len(token) == 2 && len(token[1]) >= 20 {
			iJwt := ijwt.NewIJwt()
			flag, _ := iJwt.VerifyTokenIsOk(token[1])
			if flag {
				if customeToken, err := iJwt.ParseToken(token[1]); err == nil {
					key := config.Configs.AuthConf.BindContextKeyName
					// token验证通过，同时绑定在请求上下文
					c.Set(key, customeToken)
				}
				c.Next()
			} else {
				res := Response{
					Code: http.StatusBadRequest,
					Msg:  global.TOKEN_AUTH_FAIL,
				}
				c.AbortWithStatusJSON(http.StatusBadRequest, res)
				return
			}
		} else {
			res := Response{
				Code: http.StatusBadRequest,
				Msg:  global.WRONG_TOKEN,
			}
			c.AbortWithStatusJSON(http.StatusBadRequest, res)
			return
		}
	}
}
