package attachment

import (
	"i421/app/model"
)

// attachment 模型
type Attachment struct {
	model.BaseModel
	StorageId         int64  `json:"storage_id"`           // 存储ID
	AttachmentGroupId string `json:"aattachment_group_id"` // 组ID
	Name              string `json:"name"`                 // 文件名
	Size              int    `json:"size"`                 // 文件大小
	Url               string `json:"url"`                  // 路径
	FileName          string `json:"file_name"`            // 上传名称
	ThumbUrl          string `json:"thumb_url"`            // 缩略图
	Type              int    `json:"type"`                 // 类型
	IsRecycle         int    `json:"is_recycle"`           // 是否加入回收站0否1是
	CreateBy          string `json:"create_by"`
	UpdateBy          string `json:"update_by"`
	IsDeleted         bool   `json:"is_deleted"`
}

// 指定表名
func (Attachment) TableName() string {
	return "sys_attachment"
}
