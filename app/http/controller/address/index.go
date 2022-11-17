package address

import (
	"net/http"

	. "i421/app/http/controller"

	"github.com/gin-gonic/gin"
)

type Address struct {
	Label string `json:"label"`
	Value string `json:"value"`
}

// ProvinceList 省份列表
func ProvinceList(c *gin.Context) {

	resp := Response{
		Code: 0,
		Msg:  "success",
		Data: []Address{
			{
				Label: "浙江省",
				Value: "浙江省",
			},
		},
	}

	c.JSON(http.StatusOK, resp)
}

// CityList 城市列表
func CityList(c *gin.Context) {

	resp := Response{
		Code: 0,
		Msg:  "success",
		Data: []Address{
			{
				Label: "嘉兴市",
				Value: "嘉兴市",
			},
		},
	}

	c.JSON(http.StatusOK, resp)
}

// AreaList 区域列表
func AreaList(c *gin.Context) {

	resp := Response{
		Code: 0,
		Msg:  "success",
		Data: []Address{
			{
				Label: "嘉善县",
				Value: "嘉善县",
			},
			{
				Label: "平湖市",
				Value: "平湖市",
			},
			{
				Label: "桐乡市",
				Value: "桐乡市",
			},
		},
	}

	c.JSON(http.StatusOK, resp)
}
