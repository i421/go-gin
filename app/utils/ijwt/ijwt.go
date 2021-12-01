package ijwt

import (
	"i421/config"
	"log"
	"strconv"
	"strings"
	"time"

	"github.com/dgrijalva/jwt-go"
	"github.com/pkg/errors"
)

type iJwt struct{}

func NewIJwt() *iJwt {
	return &iJwt{}
}

//  MyClaims 自定义声明结构体并内嵌 jwt.StandardClaims
type MyClaims struct {
	UserId string `json:"user_id"`
	Phone  string `json:"phone"`
	jwt.StandardClaims
}

// 生成 token
func (iJwt *iJwt) GenerateToken(user_id, phone string) (string, error) {
	mySecret := []byte(config.Configs.AuthConf.Secret)
	// 过期时间
	tokenExpireStr := config.Configs.AuthConf.TokenExpire
	// tokenExpireStr 中包含, 需要去掉 \u202c
	tokenExpireStr = strings.Replace(tokenExpireStr, "\u202c", "", -1)
	expireTimeInt, err := strconv.ParseInt(tokenExpireStr, 10, 64)
	if err != nil {
		log.Println("tokenexpire string to int is failed: ", err)
	}
	expireTimeInt += time.Now().Unix()
	c := MyClaims{
		user_id,
		phone,
		jwt.StandardClaims{
			ExpiresAt: expireTimeInt,
			Issuer:    "my-project",
		},
	}
	// 使用指定的签名方法创建签名对象
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, c)
	// 使用指定的secret签名并获得完整的编码后的字符串token
	return token.SignedString(mySecret)
}

// 解析 token 是否正确
func (iJwt *iJwt) VerifyTokenIsOk(tokenStr string) (bool, error) {
	mySecret := []byte(config.Configs.AuthConf.Secret)
	// 解析token
	token, err := jwt.ParseWithClaims(tokenStr, &MyClaims{}, func(token *jwt.Token) (i interface{}, err error) {
		return mySecret, nil
	})
	if err != nil {
		return false, errors.Wrapf(err, "token: %v is invalid!", tokenStr)
	}
	if _, ok := token.Claims.(*MyClaims); ok && token.Valid { // 校验token
		return true, nil
	}
	return false, errors.Wrapf(err, "token: %v is invalid!", tokenStr)
}

// 获取解析 token 里的数据
func (iJwt *iJwt) ParseToken(tokenStr string) (*MyClaims, error) {
	mySecret := []byte(config.Configs.AuthConf.Secret)
	// 解析token
	token, err := jwt.ParseWithClaims(tokenStr, &MyClaims{}, func(token *jwt.Token) (i interface{}, err error) {
		return mySecret, nil
	})
	if err != nil {
		return nil, errors.Wrapf(err, "token: %v is invalid!", tokenStr)
	}
	if myClamis, ok := token.Claims.(*MyClaims); ok && token.Valid { // 校验token
		return myClamis, nil
	}
	return nil, errors.Wrapf(err, "token: %v is invalid!", tokenStr)
}
