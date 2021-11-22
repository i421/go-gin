package permission

import (
	"i421/model"
)

// permission
type Permission struct {
	model.BaseModel
	Name        string `json:"name"`
	DisplayName string `json:"display_name"`
	Icon        string `json:"icon"`
	Pid         int    `json:"pid"`
	IsMenu      int    `json:"is_menu"`
	Order       int    `json:"order"`
	Desc        string `json:"desc"`
	Status      int    `json:"status"`
}

func (Permission) TableName() string {
	return "permissions"
}
