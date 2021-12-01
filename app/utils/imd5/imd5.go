package imd5

import (
	"crypto/md5"
	"encoding/base64"
	"encoding/hex"
)

type iMD5 struct{}

func NewIMD5() *iMd5 {
	return &iMD5{}
}

func (iM5 *iMD5) MD5(params string) string {
	md5Ctx := md5.New()
	md5Ctx.Write([]byte(params))
	return hex.EncodeToString(md5Ctx.Sum(nil))
}

//先base64，然后MD5
func (iM5 *iMD5) Base64Md5(params string) string {
	return MD5(base64.StdEncoding.EncodeToString([]byte(params)))
}
