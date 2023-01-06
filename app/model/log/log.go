package log

import (
	"i421/app/model"
)

// log
type Log struct {
	model.BaseModel
	UserId    int64  `json:"user_id"`                    // 用户
	Type      int64  `gorm:"default:1" json:"type"`      // 类型
	Title     string `json:"title"`                      // 标题
	Operation string `json:"operation"`                  // 标题
	Method    string `json:"method"`                     // 方法
	Params    string `json:"params"`                     // 参数
	Url       string `json:"url"`                        // Url地址
	Ip        string `json:"ip"`                         // IP
	Location  string `json:"location"`                   // 地址
	IsDeleted bool   `gorm:"default:0" json:"isDeleted"` // 删除标志
}

func (Log) TableName() string {
	return "log"
}
