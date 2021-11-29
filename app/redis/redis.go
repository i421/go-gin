package redis

import (
	"context"
	"fmt"
	"i421/config"

	"github.com/go-redis/redis/v8"
)

var (
	Redis *redis.Client
)

var ctx = context.Background()

func InitRedis() (err error) {
	Redis = redis.NewClient(&redis.Options{
		Addr:     fmt.Sprintf("%s:%s", config.Configs.RedisConf.Host, config.Configs.RedisConf.Port),
		Password: config.Configs.RedisConf.Password,
		DB:       config.Configs.RedisConf.Db,
	})

	_, err = Redis.Ping(ctx).Result()
	if err != nil {
		fmt.Println("redis ping err", err)
		return err
	}

	return nil
}
