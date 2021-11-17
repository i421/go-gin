package company

import (
	"i421/model"
)

// company 模型
type Company struct {
	model.BaseModel
	UserID int
	Name   string `json:"name"`
}

// 指定表名
func (Company) TableName() string {
	return "companys"
}
