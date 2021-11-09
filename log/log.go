package ilog

import (
	"i421/config"

	"github.com/natefinch/lumberjack"
	"go.uber.org/zap"
	"go.uber.org/zap/zapcore"
)

var Log *zap.SugaredLogger

// 初始化
func InitLogger() {
	writeSyncer := getLogWriter()
	encoder := getEncoder()
	core := zapcore.NewCore(encoder, writeSyncer, zapcore.InfoLevel)

	logger := zap.New(core)
	Log = logger.Sugar()
}

// 编码器(如何写入日志)
func getEncoder() zapcore.Encoder {
	encoderConfig := zap.NewProductionEncoderConfig()
	encoderConfig.EncodeTime = zapcore.ISO8601TimeEncoder
	encoderConfig.EncodeLevel = zapcore.CapitalLevelEncoder
	return zapcore.NewConsoleEncoder(encoderConfig)
}

// 指定日志将写到哪里去
func getLogWriter() zapcore.WriteSyncer {
	logPath := config.Configs.LogConf.LogPath
	lumberJackLogger := &lumberjack.Logger{
		Filename:   logPath,
		MaxSize:    10, // 保存的日志文件大小 10 M
		MaxBackups: 5,  // 当前目录下最多保存 10 个文件
		MaxAge:     30, //  最大保存天数
		Compress:   false,
	}
	return zapcore.AddSync(lumberJackLogger)
}
