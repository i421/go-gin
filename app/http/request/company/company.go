package request

// 设置公司状态
type SetCompanyStatusRequest struct {
	ID     int `form:"id" json:"id" binding:"required"`
	Status int `form:"status" json:"status" binding:"-"`
}

// UpdateOrCreateCompanyRequest 更新公司
type UpdateOrCreateCompanyRequest struct {
	ID                int64  `form:"id" json:"id" binding:"-"`
	UserID            int64  `form:"userId" json:"userId" binding:"-"`
	CompanyName       string `form:"companyName" json:"companyName"  binding:"required"`
	Province          string `form:"province" json:"province" binding:"required"`
	City              string `form:"city" json:"city" binding:"-"`
	Area              string `form:"area" json:"area" binding:"-"`
	Address           string `form:"address" json:"address" binding:"-"`
	LegalPerson       string `form:"legalPerson" json:"legalPerson" binding:"-"`
	EnvPerson         string `form:"envPerson" json:"envPerson" binding:"-"`
	EnvPersonPhone    string `form:"envPersionPhone" json:"envPersonPhone" binding:"-"`
	HandlePerson      string `form:"handlePerson" json:"handlePerson" binding:"-"`
	HandlePersonPhone string `form:"handlePersonPhone" json:"handlePersonPhone" binding:"-"`
	Status            string `form:"status" json:"status" binding:"-"`
	Remark            string `form:"remark" json:"remark" binding:"-"`
	Path              string `form:"path" json:"path" binding:"-"`
}

// CompanyListByPageRequest 账号列表
type GetCompanyListByPageRequest struct {
	Page        int    `form:"page", json:"page" binding:"required"`
	PageSize    int    `form:"pageSize" json:"pageSize" binding:"required"`
	CompanyName string `form:"companyName" json:"companyName,omitempty" binding:"-"`
}

// DeleteCompanyRequest 删除账号
type DeleteCompanyRequest struct {
	ID   int64  `form:"id" json:"id" binding:"required"`
	Type string `form:"type" json:"type,omitempty" binding:"-"` // 默认强制删除, 软删除则: soft
}
