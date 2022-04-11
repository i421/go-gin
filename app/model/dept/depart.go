package dept

import (
	"i421/app/model"
)

// dept
type Dept struct {
	model.BaseModel
	Name      string `json:"name"`                         // 部门名称
	Sort      int64  `gorm:"default:0" json:"sort"`        // 排序
	Status    int    `gorm:"default:0" json:"status"`      // 状态
	Remark    string `json:"remark"`                       // 备注
	CreateBy  string `gorm:"autoCreateBy" json:"createBy"` // 创建人
	UpdateBy  string `gorm:"autoUpdateBy" json:"updateBy"` // 更新人
	IsDeleted bool   `gorm:"default:0" json:"isDeleted"`   // 删除标志
	ParentId  int64  `gorm:"default:0" json:"parentId"`    // 上级ID
}

func (Dept) TableName() string {
	return "dept"
}
