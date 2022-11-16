package company

import "i421/app/model"

// company 模型
type Company struct {
	model.BaseModel
	UserId            int64  `json:"userId"`                     // 账号
	CompanyName       string `json:"companyName"`                // 密码
	Province          string `json:"province"`                   // 省份
	City              string `json:"city"`                       // 城市
	Area              string `json:"area"`                       // 地区
	Address           string `json:"address"`                    // 详细地址
	LegalPerson       string `json:"legalPerson"`                // 法人
	EnvPerson         string `json:"envPerson"`                  // 环境负责人
	EnvPersonPhone    string `json:"envPersonPhone"`             // 环境负责人电弧
	HandlePerson      string `json:"handlePerson"`               // 处理人
	HandlePersonPhone string `json:"handlePersonPhone"`          // 处理人电话
	Status            string `json:"status"`                     // 1未发布 2已发布
	Remark            string `json:"remark"`                     // 默认备注
	Path              string `json:"path"`                       // 文件
	CreateBy          string `json:"createBy"`                   // 创建人
	UpdateBy          string `json:"updateBy"`                   // 更新人
	IsDeleted         bool   `gorm:"default:0" json:"isDeleted"` // 删除标志
	CreateTime        int64  `json:"createTime"`                 // 创建时间
	UpdateTime        int64  `json:"updateTime"`                 // 更新时间
}

// 指定表名
func (Company) TableName() string {
	return "company"
}
