package user

import (
	"i421/app/model/role"
)

// user 模型
type User struct {
	ID         int64       `json:"userId"`                           // 用户ID
	Account    string      `json:"account"`                          // 账号
	Password   string      `json:"password"`                         // 密码
	Nickname   string      `json:"nickname"`                         // 昵称
	RealName   string      `json:"realName"`                         // 真名
	Avatar     string      `json:"avatar"`                           // 头像
	Status     string      `json:"status"`                           // 默认
	Remark     string      `json:"remark"`                           // 默认备注
	CreateBy   string      `json:"createBy"`                         // 创建人
	UpdateBy   string      `json:"updateBy"`                         // 更新人
	IsDeleted  bool        `gorm:"default:0" json:"isDeleted"`       // 删除标志
	Roles      []role.Role `gorm:"many2many:role_user" json:"roles"` // 角色
	CreateTime int64       `json:"createTime"`                       // 创建时间
	UpdateTime int64       `json:"updateTime"`                       // 更新时间
}

// user 包含角色模型
type UserAppendRoleIds struct {
	ID         int64       `json:"userId"`                                     // 用户ID
	Account    string      `json:"account"`                                    // 账号
	Password   string      `json:"password"`                                   // 密码
	Nickname   string      `json:"nickname"`                                   // 昵称
	RealName   string      `json:"realName"`                                   // 真名
	Avatar     string      `json:"avatar"`                                     // 头像
	Status     int         `json:"status"`                                     // 默认
	Remark     string      `json:"remark"`                                     // 默认备注
	CreateBy   string      `json:"createBy"`                                   // 创建人
	UpdateBy   string      `json:"updateBy"`                                   // 更新人
	IsDeleted  bool        `gorm:"default:0" json:"isDeleted"`                 // 删除标志
	Roles      []role.Role `gorm:"many2many:role_user" json:"roles,omitempty"` // 角色
	CreateTime int64       `json:"createTime"`                                 // 创建时间
	UpdateTime int64       `json:"updateTime"`                                 // 更新时间
	RoleIds    []int64     `gorm:"type:text" json:"role_ids,omitempty"`        // 角色id
	RoleNames  []string    `gorm:"type:text" json:"role_names,omitempty"`      // 角色名称
}

// 指定表名
func (User) TableName() string {
	return "user"
}
