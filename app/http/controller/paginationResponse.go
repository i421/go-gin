package controller

type PaginationStruct struct {
	Total int64       `json:"total"`
	Items interface{} `json:"items,omitempty"`
}

// 响应体
type PaginationResponse struct {
	Code uint             `json:"code"`              // 1 - 失败, 0 - 成功
	Msg  string           `json:"message,omitempty"` // 提示
	Data PaginationStruct `json:"result,omitempty"`  // 数据
}
