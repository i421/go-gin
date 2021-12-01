package imd5

import (
	"crypto/md5"
	"encoding/base64"
	"encoding/hex"
)

// iMD5 imd5结构体
type iMD5 struct{}

// NewIMD5 实例化
func NewIMD5() *iMD5 {
	return &iMD5{}
}

// MD5 加密
func (im5 *iMD5) encrypt(params string) string {
	md5Ctx := md5.New()
	md5Ctx.Write([]byte(params))
	return hex.EncodeToString(md5Ctx.Sum(nil))
}

// Base64Md5 先base64，然后MD5
func (im5 *iMD5) Base64Md5(params string) string {
	return im5.encrypt(base64.StdEncoding.EncodeToString([]byte(params)))
}
