package main

import (
	"i421/amqp"
	"i421/config"
	"i421/crontask"
	ilog "i421/log"
	"i421/model"
	"i421/redis"
	"log"

	"i421/router"
	"os"

	"github.com/gin-gonic/gin"
)

// 项目初始化
func init() {
	projectDir, _ := os.Getwd()
	// 初始化配置信息
	config.InitConf(projectDir)
	// 初始化 log
	ilog.InitLogger()
	// 初始化数据库
	if err := model.InitDb(); err != nil {
		log.Fatal("model.InitDb() is failed, err: ", err)
	}
	// 初始化定时器
	if err := crontask.InitCronTask(); err != nil {
		log.Fatal("cronObj.AddFunc is failed, err: ", err)
	}

	if err := redis.InitRedis(); err != nil {
		log.Fatal("redis.InitRedis() is failed, err: ", err)
	}

	// 启动amqp接收器
	go amqp.InitAmqpRec()
}

func main() {
	gin.SetMode(config.Configs.AppMode)

	routerObj := gin.Default()
	// 路由
	router.Routers(routerObj)

	// 端口
	port := config.Configs.AppPort

	// 启动Web
	if err := routerObj.Run(port); err != nil {
		log.Fatal("server run is failed, err:", err)
	}
}
