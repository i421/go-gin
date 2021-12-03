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
	reUrl := fmt.Sprint("%s/control/pull?oper=%s&app=%s&name=%s&url=%s", ilive.address, oper, app, name, url)
	res, err := ilive.httpGet(reUrl)
	return res, err
}

// ControlPush 推流
func (ilive *iLive) ControlPush(oper, app, name, url string) (string, error) {
	reUrl := fmt.Sprint("%s/control/push?oper=%s&app=%s&name=%s&url=%s", ilive.address, oper, app, name, url)
	res, err := ilive.httpGet(reUrl)
	return res, err
}

// httpGet get请求
func (ilive *iLive) httpGet(url string) (string, error) {

	client := &http.Client{
		Timeout: 5 * time.Second,
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

	mp := make(map[string]interface{})

	err = jsoniter.Unmarshal(body, &mp)
	if err != nil {
		return "mp error:" + err.Error(), err
	}

	by, _ := jsoniter.Marshal(mp["data"])

	return string(by), nil
}
