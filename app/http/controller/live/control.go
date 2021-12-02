package live

import "github.com/gin-gonic/gin"

// Push 推流
// @param oper=start&app=live&name=123456&url=rtmp://192.168.16.136/live/123456
func Push(c *gin.Context) {
	// todo
}

// Pull 拉流
// @param oper=start&app=live&name=123456&url=rtmp://192.168.16.136/live/123456
func Pull(c *gin.Context) {
	// todo
}

// Get 获取一个房间的 channelkey(channelkey用于推流，movie用于播放)
// @param room string 用于播放
// @return res interface{}  json: channelkey用于推流
func Get(c *gin.Context) {
	// todo
}

// Reset 重置
// @param room=ROOM_NAME
func Reset(c *gin.Context) {
	// todo
}

// Delete 删除
// @param room=ROOM_NAME
func Delete(c *gin.Context) {
	// todo
}
