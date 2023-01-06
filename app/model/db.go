package model

import (
	"fmt"
	"i421/config"
	"log"
	"os"
	"time"

	ilog "i421/log"

	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
)

// BaseModel 公共模块
type BaseModel struct {
	ID         int64 `json:"id"`
	CreateTime int64 `gorm:"autoCreateTime" json:"createTime,omitempty"`
	UpdateTime int64 `gorm:"autoUpdateTime" json:"updateTime,omitempty"`
}

var (
	// Db 全局数据库连接
	Db *gorm.DB // 对外的连接
)

// InitDb 初始化连接数据库
func InitDb() (err error) {
	// 把日志追加到 run.log
	handle, err := os.OpenFile(config.Configs.LogConf.LogPath, os.O_APPEND, 0666)
	if err != nil {
		ilog.Log.Error("os.OpenFile(config.Configs.LogConf.LogPath, os.O_APPEND, 0666) is failed, err: ", err)
	}
	newLogger := logger.New(
		log.New(handle, "SQL: ", log.LstdFlags), // io writer
		logger.Config{
			SlowThreshold: time.Second,   // 慢 SQL 阈值
			LogLevel:      logger.Silent, // Log level
			Colorful:      false,         // 禁用彩色打印
		},
	)
	dsn := fmt.Sprintf("%s:%s@tcp(%s)/%s?charset=utf8mb4&parseTime=True&loc=Local", config.Configs.MysqlConf.Username, config.Configs.MysqlConf.Password, config.Configs.MysqlConf.Host, config.Configs.MysqlConf.DbName)
	Db, err = gorm.Open(mysql.Open(dsn), &gorm.Config{Logger: newLogger})
	// Db, err = gorm.Open(mysql.Open(dsn), &gorm.Config{Logger: logger.Default.LogMode(logger.Info)})
	if err != nil {
		return err
	}
	// 这样设置在使用的时候都会打印 sql, 用于记录日志
	Db = Db.Debug()
	sqlDB, err := Db.DB()
	if err != nil {
		return err
	}
	// SetMaxIdleConns 设置空闲连接池中连接的最大数量
	sqlDB.SetMaxIdleConns(10)

	// SetMaxOpenConns 设置打开数据库连接的最大数量。
	sqlDB.SetMaxOpenConns(100)

	// SetConnMaxLifetime 设置了连接可复用的最大时间。
	sqlDB.SetConnMaxLifetime(time.Hour)
	return nil
}
