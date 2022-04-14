package authorization

import (
	"i421/app/global"
	. "i421/app/http/controller"
	"i421/app/utils/ijwt"
	"i421/config"
	"net/http"

	"github.com/gin-gonic/gin"
)

type HeaderParams struct {
	Authorization string `header:"Authorization" binding:"required,min=20"` // Authorization:  "Authorization" + " " + jwt
}

// CheckTokenAuth 检查token完整性、有效性中间件
func CheckToken() gin.HandlerFunc {
	return func(c *gin.Context) {

		headerParams := HeaderParams{}

		//  推荐使用 ShouldBindHeader 方式获取头参数
		if err := c.ShouldBindHeader(&headerParams); err != nil {
			res := Response{
				Code: global.TOKEN_MISSING_CODE,
				Msg:  global.TOKEN_MISSING,
			}
			c.AbortWithStatusJSON(http.StatusBadRequest, res)
			return
		}

		token := headerParams.Authorization

		if len(token) >= 20 {
			iJwt := ijwt.NewIJwt()
			flag, _ := iJwt.VerifyTokenIsOk(token)
			if flag {
				if customeToken, err := iJwt.ParseToken(token); err == nil {
					if customeToken.ExpiresAt == -1 {
						// 固定-1 token已被删除
						res := Response{
							Code: global.TOKEN_DELETED_CODE,
							Msg:  global.TOKEN_DELETED,
						}
						c.AbortWithStatusJSON(http.StatusBadRequest, res)
						return
					}
					key := config.Configs.AuthConf.BindContextKeyName
					tokenKey := config.Configs.AuthConf.Token
					// 验证通过，同时绑定在请求上下文 { userId, telePhone }
					c.Set(key, customeToken)
					// 保存生成的令牌
					c.Set(tokenKey, token)
				}
				c.Next()
			} else {
				res := Response{
					Code: global.TOKEN_AUTH_FAIL_CODE,
					Msg:  global.TOKEN_AUTH_FAIL,
				}
				c.AbortWithStatusJSON(http.StatusBadRequest, res)
				return
			}
		} else {
			res := Response{
				Code: global.TOKEN_ILLEGAL_CODE,
				Msg:  global.TOKEN_ILLEGAL,
			}
			c.AbortWithStatusJSON(http.StatusBadRequest, res)
			return
		}
	}
}
