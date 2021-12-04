package live

import (
	"i421/app/global"
	. "i421/app/http/controller"
	"i421/app/utils/live"
	"i421/config"
	"net/http"

	"github.com/gin-gonic/gin"
)

// Push 推流
// @param oper=start&app=live&name=123456&url=rtmp://192.168.16.136/live/123456
func Push(c *gin.Context) {

	oper := c.Query("oper")
	app := c.Query("app")
	name := c.DefaultQuery("name", "live")
	url := c.Query("url")

	ilive := live.NewILive()

	res, err := ilive.ControlPush(oper, app, name, url)

	if err != nil {
		resp := Response{
			Code: global.HTTP_REQUEST_ERROR_CODE,
			Msg:  res,
		}
		c.JSON(http.StatusOK, resp)
		return
	}

	resp := Response{
		Code: 200,
		Msg:  "success",
		Data: res,
	}
	c.JSON(http.StatusOK, resp)
}

// Pull 拉流
// @param oper=start&app=live&name=123456&url=rtmp://192.168.16.136/live/123456
func Pull(c *gin.Context) {

	oper := c.Query("oper")
	app := c.Query("app")
	name := c.DefaultQuery("name", "live")
	url := c.Query("url")

	ilive := live.NewILive()

	res, err := ilive.ControlPull(oper, app, name, url)

	if err != nil {
		resp := Response{
			Code: global.HTTP_REQUEST_ERROR_CODE,
			Msg:  res,
		}
		c.JSON(http.StatusOK, resp)
		return
	}

	resp := Response{
		Code: 200,
		Msg:  "success",
		Data: res,
	}
	c.JSON(http.StatusOK, resp)
}

// Get 获取一个房间的 channelkey(channelkey用于推流，movie用于播放)
// @param room string 用于播放
// @return res interface{}  json: channelkey用于推流
func Get(c *gin.Context) {

	room := c.DefaultQuery("room", config.Configs.AppName)

	ilive := live.NewILive()

	res, err := ilive.ControlGet(room)

	if err != nil {
		resp := Response{
			Code: global.HTTP_REQUEST_ERROR_CODE,
			Msg:  res,
		}
		c.JSON(http.StatusOK, resp)
		return
	}

	resp := Response{
		Code: 200,
		Msg:  "success",
		Data: res,
	}
	c.JSON(http.StatusOK, resp)
}

// Reset 重置
// @param room=ROOM_NAME
func Reset(c *gin.Context) {

	room := c.DefaultQuery("room", config.Configs.AppName)

	ilive := live.NewILive()

	res, err := ilive.ControlReset(room)

	if err != nil {
		resp := Response{
			Code: global.HTTP_REQUEST_ERROR_CODE,
			Msg:  res,
		}
		c.JSON(http.StatusOK, resp)
		return
	}

	resp := Response{
		Code: 200,
		Msg:  "success",
		Data: res,
	}
	c.JSON(http.StatusOK, resp)
}

// Delete 删除
// @param room=ROOM_NAME
func Delete(c *gin.Context) {

	room := c.DefaultQuery("room", config.Configs.AppName)

	ilive := live.NewILive()

	res, err := ilive.ControlDelete(room)

	if err != nil {
		resp := Response{
			Code: global.HTTP_REQUEST_ERROR_CODE,
			Msg:  res,
		}
		c.JSON(http.StatusOK, resp)
		return
	}

	resp := Response{
		Code: 200,
		Msg:  "success",
		Data: res,
	}
	c.JSON(http.StatusOK, resp)
}
