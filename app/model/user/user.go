package user

import (
	"i421/app/model"
	"time"
)

// user 模型
type User struct {
	model.BaseModel
	TenantId  string    `gorm:"default:100000" json:"tenant_id"` // 租户ID
	account   string    `json:"account"`                         // 账号
	Password  string    `json:"password"`                        // 密码
	Name      string    `json:"name"`                            //昵称
	RealName  string    `json:"real_name"`                       //真名
	Avatar    string    `json:"avatar"`                          // 头像
	Email     string    `json:"email"`                           // 邮件
	Telephone string    `json:"telephone"`                       // 手机
	Birthday  time.Time `json:"birthday"`                        // 生日
	Sex       int       `json:"sex"`                             // 性别
	RoleId    int64     `gorm:"default:0" json:"role_id"`        // 角色ID
	DepartId  int64     `gorm:"default:0" json:"depart_id"`      // 部门ID
	Status    string    `json:"status"`                          // 默认
	Remark    string    `json:"remark"`                          // 默认备注
	CreateBy  string    `json:"create_by"`                       // 创建人
	UpdateBy  string    `json:"update_by"`                       // 更新人
	IsDeleted bool      `gorm:"default:0" json:"is_deleted"`     // 删除标志
}

// 指定表名
func (User) TableName() string {
	return "sys_user"
}
