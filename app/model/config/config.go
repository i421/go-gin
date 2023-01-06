package config

import (
	"i421/app/model"
)

// config
type Config struct {
	model.BaseModel
	Code      string `json:"code"`                       // code
	CKey      string `json:"c_key"`                      // key
	Value     string `json:"value"`                      // 值
	Sort      int64  `json:"sort"`                       // 排序
	Remark    string `json:"remark"`                     // 备注
	ParentId  int64  `gorm:"default:-1" json:"parentId"` // 上级ID
	IsDeleted bool   `gorm:"default:0" json:"isDeleted"` // 删除标志
}

func (Config) TableName() string {
	return "config"
}
