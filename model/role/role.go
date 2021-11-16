package role

import (
	"i421/model"
)

// role
type Role struct {
	model.BaseModel
	Name string `json:"name"`
}

func (Role) TableName() string {
	return "roles"
}
