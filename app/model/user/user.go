package user

import (
	"i421/app/model/role"
	"time"
)

// user 模型
type User struct {
	ID         int64       `json:"userId"`                           // 用户ID
	Account    string      `json:"account"`                          // 账号
	Password   string      `json:"password"`                         // 密码
	Name       string      `json:"username"`                         // 昵称
	RealName   string      `json:"realName"`                         // 真名
	Avatar     string      `json:"avatar"`                           // 头像
	Email      string      `json:"email"`                            // 邮件
	Telephone  string      `json:"telephone"`                        // 手机
	Birthday   time.Time   `json:"birthday"`                         // 生日
	Sex        int         `json:"sex"`                              // 性别
	DepartId   int64       `gorm:"default:0" json:"departId"`        // 部门ID
	Status     string      `json:"status"`                           // 默认
	Remark     string      `json:"desc"`                             // 默认备注
	CreateBy   string      `json:"createBy"`                         // 创建人
	UpdateBy   string      `json:"updateBy"`                         // 更新人
	IsDeleted  bool        `gorm:"default:0" json:"isDeleted"`       // 删除标志
	Roles      []role.Role `gorm:"many2many:role_user" json:"roles"` // 角色
	CreateTime time.Time   `json:"createTime"`                       // 创建时间
	UpdateTime time.Time   `json:"updateTime"`                       // 更新时间
}

// 指定表名
func (User) TableName() string {
	return "user"
}
