package controller

// 响应体
type Response struct {
	Code        uint        `json:"code"`                   // 1 - 失败, 0 - 成功
	Msg         string      `json:"message,omitempty"`      // 提示
	Type        string      `json:"type,omitempty"`         // 类型
	Data        interface{} `json:"result,omitempty"`       // 数据
	Total       int64       `json:"total,omitempty"`        // 总条数
	CurrentPage int         `json:"current_page,omitempty"` // 当前页
	TotalPage   int         `json:"total_page,omitempty"`   // 总页数
}
