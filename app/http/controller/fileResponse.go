package controller

// 响应体
type FileResponse struct {
	Code uint   `json:"code"`              // 1 - 失败, 0 - 成功
	Msg  string `json:"message,omitempty"` // 提示
	Data string `json:"url,omitempty"`     // 类型
}
