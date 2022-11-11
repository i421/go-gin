package attachment

import (
	"i421/app/model"
)

// attachment 模型
type Attachment struct {
	model.BaseModel
	UserId    int64  `json:"userId"`    // 用户ID
	Name      string `json:"name"`      // 文件名
	Size      int    `json:"size"`      // 文件大小
	Url       string `json:"url"`       // 路径
	FileName  string `json:"fileName"`  // 上传名称
	ThumbUrl  string `json:"thumbUrl"`  // 缩略图
	Type      int    `json:"type"`      // 类型
	IsRecycle int    `json:"isRecycle"` // 是否加入回收站0否1是
	CreateBy  string `json:"createBy"`
	UpdateBy  string `json:"updateBy"`
	IsDeleted bool   `json:"isDeleted"`
}

// 指定表名
func (Attachment) TableName() string {
	return "attachment"
}
