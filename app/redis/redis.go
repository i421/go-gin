package redis

import (
	"context"
	"fmt"
	"i421/config"
	"sync"

	"github.com/go-redis/redis/v8"
)

var (
	// Redis 全局对象
	Redis *redis.Client
	once  sync.Once
)

var ctx = context.Background()

// GetRedis 单例模式
func GetRedis() *redis.Client {
	once.Do(func() {
		Redis = redis.NewClient(&redis.Options{
			Addr:     fmt.Sprintf("%s:%s", config.Configs.RedisConf.Host, config.Configs.RedisConf.Port),
			Password: config.Configs.RedisConf.Password,
			DB:       config.Configs.RedisConf.Db,
		})

		_, err := Redis.Ping(ctx).Result()
		if err != nil {
			fmt.Println("redis init err", err)
		}
	})

	return Redis
}
