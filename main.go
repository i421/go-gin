package main

import (
	"i421/app/crontask"
	"i421/app/model"
	"i421/config"
	ilog "i421/log"
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

	// 启动amqp接收器
	//myamqp := amqp.New()
	//go myamqp.Consume()
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
