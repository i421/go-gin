package menu

import (
	"i421/app/model"
)

// menu
type Menu struct {
	model.BaseModel
	Name       string `json:"name"`                       // 菜单标题
	Permission string `json:"permission"`                 // 菜单权限
	Path       string `json:"path"`                       // 路径
	Component  string `json:"component"`                  // 组件
	ParentId   int64  `gorm:"default:0" json:"parentId"`  // 父菜单ID
	Icon       string `json:"icon"`                       // 菜单图标
	Sort       int    `gorm:"default:1" json:"sort"`      // 排序
	KeepAlive  bool   `gorm:"default:0" json:"keepAlive"` // 是否缓存改页面 1是
	Type       int    `gorm:"default:0" json:"type"`      // 菜单类型
	Hidden     int    `gorm:"default:0" json:"hidden"`    // 是否显示
	Target     int    `gorm:"default:0" json:"target"`    // 是否外链
	Status     int    `json:"status"`                     // 状态
	CreateBy   string `json:"createBy"`                   // 创建人
	UpdateBy   string `json:"updateBy"`                   // 更新人
	IsDeleted  bool   `gorm:"default:0" json:"isDeleted"` // 删除标志
}

func (Menu) TableName() string {
	return "menu"
}
