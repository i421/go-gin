package ijwt

import (
	"i421/config"
	"strconv"
	"time"

	"github.com/dgrijalva/jwt-go"
	"github.com/pkg/errors"
)

// iJwt 结构体
type iJwt struct {
	signKey     []byte
	tokenExpire int64
}

// NewIJwt 实例化
func NewIJwt() *iJwt {
	expireAt, _ := strconv.ParseInt(config.Configs.AuthConf.TokenExpire, 10, 64)
	return &iJwt{
		signKey:     []byte(config.Configs.AuthConf.Secret),
		tokenExpire: expireAt,
	}
}

//  MyClaims 自定义声明结构体并内嵌 jwt.StandardClaims
type MyClaims struct {
	UserId    int64  `json:"user_id"`
	Telephone string `json:"telephone"`
	jwt.StandardClaims
}

// CreateToken 内部方法生成一个token
func (ijwt *iJwt) createToken(claims MyClaims) (string, error) {
	// 生成jwt格式的header、claims 部分
	tokenPartA := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	// 继续添加秘钥值，生成最后一部分
	return tokenPartA.SignedString(ijwt.signKey)
}

// GenerateToken 对外接口生成token
func (ijwt *iJwt) GenerateToken(userId int64, telephone string) (token string, err error) {

	// 根据实际业务自定义token需要包含的参数，生成token，注意：用户密码请勿包含在token
	myC := MyClaims{
		UserId:    userId,
		Telephone: telephone,
		// 特别注意，针对前文的匿名结构体，初始化的时候必须指定键名，并且不带 jwt. 否则报错：Mixture of field: value and value initializers
		StandardClaims: jwt.StandardClaims{
			NotBefore: time.Now().Unix() - 10,               // 生效开始时间
			ExpiresAt: time.Now().Unix() + ijwt.tokenExpire, // 失效截止时间
		},
	}
	return ijwt.createToken(myC)
}

// VerifyTokenIsOk 解析 token 是否正确
func (ijwt *iJwt) VerifyTokenIsOk(tokenStr string) (bool, error) {
	// 解析token
	token, err := jwt.ParseWithClaims(tokenStr, &MyClaims{}, func(token *jwt.Token) (i interface{}, err error) {
		return ijwt.signKey, nil
	})
	if err != nil {
		if ve, ok := err.(*jwt.ValidationError); ok {
			if ve.Errors&jwt.ValidationErrorExpired != 0 {
				// 如果 TokenExpired ,只是过期（格式都正确），我们认为他是有效的，接下可以允许刷新操作
				token.Valid = true
				return true, nil
			}
		}
		return false, errors.Wrapf(err, "token: %v is invalid!", tokenStr)
	}
	if _, ok := token.Claims.(*MyClaims); ok && token.Valid { // 校验token
		return true, nil
	}
	return false, errors.Wrapf(err, "token: %v is invalid!", tokenStr)
}

// ParseToken 获取解析 token 里的数据
func (ijwt *iJwt) ParseToken(tokenStr string) (*MyClaims, error) {
	// 解析token
	token, err := jwt.ParseWithClaims(tokenStr, &MyClaims{}, func(token *jwt.Token) (i interface{}, err error) {
		return ijwt.signKey, nil
	})
	if err != nil {
		if ve, ok := err.(*jwt.ValidationError); ok {
			if ve.Errors&jwt.ValidationErrorExpired != 0 {
				// 如果 TokenExpired ,只是过期（格式都正确），我们认为他是有效的，接下可以允许刷新操作
				token.Valid = true
			}
		} else {
			return nil, errors.Wrapf(err, "token: %v is invalid!", tokenStr)
		}
	}
	if myClamis, ok := token.Claims.(*MyClaims); ok && token.Valid { // 校验token
		return myClamis, nil
	}
	return nil, errors.Wrapf(err, "token: %v is invalid!", tokenStr)
}

// 更新token
func (ijwt *iJwt) RefreshToken(tokenString string, extraAddSeconds int64) (string, error) {

	if MyClaims, err := ijwt.ParseToken(tokenString); err == nil {
		MyClaims.ExpiresAt = time.Now().Unix() + extraAddSeconds
		return ijwt.createToken(*MyClaims)
	} else {
		return "", err
	}
}
