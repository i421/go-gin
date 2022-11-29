package upload

import (
	//"context"

	. "i421/app/http/controller"
	"i421/app/utils/ijwt"
	"net/http"
	"os"
	"path/filepath"
	"strconv"
	"strings"
	"time"

	"github.com/gin-gonic/gin"
)

// Upload 上传文件
func Upload(c *gin.Context) {

	// Multipart form
	file, err := c.FormFile("file")

	if err != nil {
		res := FileResponse{
			Code: http.StatusBadRequest,
			Msg:  "get from err: " + err.Error(),
		}

		c.JSON(http.StatusOK, res)
		return
	}

	filename := filepath.Base(file.Filename)

	resArr := "http://" + c.Request.Host + "/basic-api/dir/uploads/anonymous/" + filename

	// mv to dist
	if err := c.SaveUploadedFile(file, "public/uploads/anonymous/"+filename); err != nil {
		res := FileResponse{
			Code: http.StatusBadRequest,
			Msg:  "get from err: " + err.Error(),
		}

		c.JSON(http.StatusOK, res)
		return
	}

	res := FileResponse{
		Code: http.StatusOK,
		Msg:  "success",
		Data: resArr,
	}

	c.JSON(http.StatusOK, res)
}

// PrivateUpload 私人上传
func PrivateUpload(c *gin.Context) {

	token := c.MustGet("userToken").(*ijwt.MyClaims)

	if _, err := os.Stat("public/uploads/" + strconv.FormatInt(token.UserId, 10)); os.IsNotExist(err) {
		err = os.Mkdir("public/uploads/"+strconv.FormatInt(token.UserId, 10), 0755)

		if err != nil {
			res := Response{
				Code: http.StatusBadRequest,
				Msg:  "目录不存在" + err.Error(),
			}

			c.JSON(http.StatusOK, res)
			return
		}
	}

	file, err := c.FormFile("file")

	if err != nil {
		res := FileResponse{
			Code: http.StatusBadRequest,
			Msg:  "get from err: " + err.Error(),
		}

		c.JSON(http.StatusOK, res)
		return
	}

	now := time.Now().Unix()
	nowString := strconv.FormatInt(now, 10)
	filename := nowString + "-" + filepath.Base(file.Filename)
	filename = strings.Replace(filename, " ", "", -1)
	filename = strings.Replace(filename, "\n", "", -1)

	// resArr := "http://" + c.Request.Host + "/basic-api/dir/uploads/" + strconv.FormatInt(token.UserId, 10) + "/" + filename
	resArr := "/basic-api/dir/uploads/" + strconv.FormatInt(token.UserId, 10) + "/" + filename

	// mv to dist
	if err := c.SaveUploadedFile(file, "public/uploads/"+strconv.FormatInt(token.UserId, 10)+"/"+filename); err != nil {
		res := FileResponse{
			Code: http.StatusBadRequest,
			Msg:  "get from err: " + err.Error(),
		}

		c.JSON(http.StatusOK, res)
		return
	}

	res := FileResponse{
		Code: http.StatusOK,
		Msg:  "success",
		Data: resArr,
	}

	c.JSON(http.StatusOK, res)
}
