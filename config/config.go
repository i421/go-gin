package config

import (
	"fmt"

	"github.com/spf13/viper"
)

var (
	Configs *AllConf // 对外出口
)

// 保存所有配置
type AllConf struct {
	AppName   string
	AppPort   string
	MysqlConf MysqlConf `json:"mysqlConf"`
	LogConf   LogConf   `json:"logConf"`
	AuthConf  AuthConf  `json:"authConf"`
}

// mysql 配置
type MysqlConf struct {
	MysqlHost string `json:"mysqlHost"`
	Username  string `json:"username"`
	Password  string `json:"password"`
	DbName    string `json:"dbname"`
}

// 日志配置
type LogConf struct {
	LogPath      string `json:"logPath"`
	LogSize      uint8  `json:"logSize,string"`
	MaxSaveFiles uint8  `json:"maxSaveFiles,string"`
	MaxSaveDays  uint8  `json:"maxSaveDays,string"`
}

// 权限配置
type AuthConf struct {
	Secret      string `json:"secret"`
	TokenExpire string `json:"tokenExpire"`
}

// GetInfo 返回conf 详情
func InitConf(projectDir string) {
	var configFile string
	// 生成环境为 linux, 路径为 /
	configFile = fmt.Sprintf("./config/")
	viper.SetConfigName("config")
	viper.SetConfigType("yaml")
	viper.AddConfigPath(configFile)
	if err := viper.ReadInConfig(); err != nil {
		fmt.Println("load config is failed, err: %v", err)
	}

	// 更新则重新载入
	viper.WatchConfig()

	// 将配置通过序列化来解析
	var (
		allConf AllConf
	)
	if err := viper.Unmarshal(&allConf); err != nil {
		fmt.Println("viper unmarshal err", err)
	}

	//fmt.Println(allConf)

	// log 的 path 还需要拼接
	allConf.LogConf.LogPath = projectDir + allConf.LogConf.LogPath
	//log.Printf("allConf: %v", allConf)
	Configs = &allConf
}
