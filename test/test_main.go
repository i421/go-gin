package main

import (
	"fmt"
	"i421/config"
	"i421/corntask"
	ilog "i421/log"
	"i421/module"
	"log"

	"i421/router"
	"os"

	"github.com/gin-gonic/gin"
)

type User struct {
	Id int64
}

// 项目初始化
func init() {
	projectDir, _ := os.Getwd()
	// 初始化配置信息
	config.InitConf(projectDir)
	// 初始化 log
	ilog.InitLogger()
	// 初始化数据库
	if err := module.InitDb(); err != nil {
		log.Fatal("module.InitDb() is failed, err: ", err)
	}
	// 初始化定时器
	if err := corntask.InitCronTask(); err != nil {
		log.Fatal("cronObj.AddFunc is failed, err: ", err)
	}
}

func main() {
	routerObj := gin.Default()
	// 路由
	router.Routers(routerObj)

	// 端口
	port := config.Configs.AppPort

	fmt.Println("db")

	var users []User
	err := module.Db.Raw("select id from user").Scan(&users)
	if err != nil {
		fmt.Println("error", err)
	}
	fmt.Println(users)
	for k, v := range users {
		fmt.Println("k:\n", k)
		fmt.Println("v:\n", v.Id)
	}
	fmt.Println("db")

	// 启动Web
	if err := routerObj.Run(port); err != nil {
		log.Fatal("server run is failed, err:", err)
	}
}
