package live

import (
	"fmt"
	"i421/config"
	"io/ioutil"
	"net/http"
	"time"

	jsoniter "github.com/json-iterator/go"
)

// iLive livego结构体
type iLive struct {
	address string
}

// LiveAddress livego返回数据结构
type LiveResponse struct {
	Status interface{} `json:"status"`
	Data   interface{} `json:"data"`
}

// NewILive livego实例化
func NewILive() *iLive {
	return &iLive{
		address: config.Configs.LiveAddress,
	}
}

// Stat 当前状态
func (ilive *iLive) Stat() (string, error) {
	url := ilive.address + "stat/livestat"
	res, err := ilive.httpGet(url)
	return res, err
}

// ControlGet 获取room key
func (ilive *iLive) ControlGet(room string) (string, error) {
	url := ilive.address + "control/get?room=" + room
	res, err := ilive.httpGet(url)
	return res, err
}

// ControlReset 重置room key
func (ilive *iLive) ControlReset(room string) (string, error) {
	url := ilive.address + "control/reset?room=" + room
	res, err := ilive.httpGet(url)
	return res, err
}

// ControlDelete 删除room key
func (ilive *iLive) ControlDelete(room string) (string, error) {
	url := ilive.address + "control/delete?room=" + room
	res, err := ilive.httpGet(url)
	return res, err
}

// ControlPull 拉流 oper: start|stop
func (ilive *iLive) ControlPull(oper, app, name, url string) (string, error) {
	reUrl := fmt.Sprintf("%s/control/pull?oper=%s&app=%s&name=%s&url=%s", ilive.address, oper, app, name, url)
	res, err := ilive.httpGet(reUrl)
	return res, err
}

// ControlPush 推流
func (ilive *iLive) ControlPush(oper, app, name, url string) (string, error) {
	reUrl := fmt.Sprintf("%s/control/push?oper=%s&app=%s&name=%s&url=%s", ilive.address, oper, app, name, url)
	fmt.Println("reUrl:", reUrl)
	res, err := ilive.httpGet(reUrl)
	return res, err
}

// httpGet get请求
func (ilive *iLive) httpGet(url string) (string, error) {

	client := &http.Client{
		Timeout: 20 * time.Second,
	}
	resp, err := client.Get(url)
	if err != nil {
		return "request error", err
	}

	req, err := http.NewRequest("GET", url, nil)
	if err != nil {
		return "request error", err
	}
	resp, err = client.Do(req)

	body, err := ioutil.ReadAll(resp.Body)
	defer resp.Body.Close()

	liveResponse := LiveResponse{}
	err = jsoniter.Unmarshal(body, &liveResponse)

	if err != nil {
		return "unmarshal error", err
	}

	resStr, ok := liveResponse.Data.(string)

	if ok {
		return resStr, nil
	}

	resMap, ok := liveResponse.Data.(map[string]interface{})

	if ok {
		resS, _ := jsoniter.Marshal(resMap)
		return string(resS), nil
	}

	return "{}", nil
}
