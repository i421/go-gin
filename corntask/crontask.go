package corntask

import (
	"github.com/robfig/cron/v3"
)

// 初始化定时任务
func InitCronTask() error {
	cronObj := cron.New()

	// 每小时统计一次
	//_, err := cronObj.AddFunc("0 */1 * * ?", visit.StatisticsVisitByDay)

	cronObj.Start()
	return nil
}
