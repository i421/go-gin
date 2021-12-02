package live

import (
	"fmt"
	"i421/config"
	"io/ioutil"
	"net/http"

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

func (ilive *iLive) Stat() string {
	resp, err := http.Get(ilive.address + "stat/livestat")
	defer resp.Body.Close()
	if err != nil {
		return "request error:" + err.Error()
	}

	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		return "body error:" + err.Error()
	}

	mp := make(map[string]interface{})

	err = jsoniter.Unmarshal(body, &mp)
	if err != nil {
		return "mp error:" + err.Error()
	}

	by, _ := jsoniter.Marshal(mp["data"])

	return string(by)
}

// ControlGet 获取room key
func (ilive *iLive) ControlGet(room string) string {
	resp, err := http.Get(ilive.address + "control/get?room=" + room)
	defer resp.Body.Close()
	if err != nil {
		return "request error:" + err.Error()
	}

	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		return "body error:" + err.Error()
	}

	mp := make(map[string]interface{})

	err = jsoniter.Unmarshal(body, &mp)
	if err != nil {
		return "mp error:" + err.Error()
	}

	by, _ := jsoniter.Marshal(mp["data"])
	return string(by)
}

// ControlReset 重置room key
func (ilive *iLive) ControlReset(room string) string {
	resp, err := http.Get(ilive.address + "control/reset?room=" + room)
	defer resp.Body.Close()
	if err != nil {
		return "request error:" + err.Error()
	}

	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		return "body error:" + err.Error()
	}

	mp := make(map[string]interface{})

	err = jsoniter.Unmarshal(body, &mp)
	if err != nil {
		return "mp error:" + err.Error()
	}

	by, _ := jsoniter.Marshal(mp["data"])
	return string(by)
}

// ControlDelete 删除room key
func (ilive *iLive) ControlDelete(room string) string {
	resp, err := http.Get(ilive.address + "control/delete?room=" + room)
	defer resp.Body.Close()
	if err != nil {
		return "request error:" + err.Error()
	}

	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		return "body error:" + err.Error()
	}

	mp := make(map[string]interface{})

	err = jsoniter.Unmarshal(body, &mp)
	if err != nil {
		return "mp error:" + err.Error()
	}

	by, _ := jsoniter.Marshal(mp["data"])
	return string(by)
}

// ControlPull 拉流 oper: start|stop
func (ilive *iLive) ControlPull(oper, app, name, url string) string {
	resp, err := http.Get(fmt.Sprint("%s/control/pull?oper=%s&app=%s&name=%s&url=%s", ilive.address, oper, app, name, url))
	defer resp.Body.Close()
	if err != nil {
		return "request error:" + err.Error()
	}

	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		return "body error:" + err.Error()
	}

	mp := make(map[string]interface{})

	err = jsoniter.Unmarshal(body, &mp)
	if err != nil {
		return "mp error:" + err.Error()
	}

	by, _ := jsoniter.Marshal(mp["data"])
	return string(by)
}

// ControlPush 推流
func (ilive *iLive) ControlPush(oper, app, name, url string) string {
	resp, err := http.Get(fmt.Sprint("%s/control/push?oper=%s&app=%s&name=%s&url=%s", ilive.address, oper, app, name, url))
	defer resp.Body.Close()
	if err != nil {
		return "request error:" + err.Error()
	}

	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		return "body error:" + err.Error()
	}

	mp := make(map[string]interface{})

	err = jsoniter.Unmarshal(body, &mp)
	if err != nil {
		return "mp error:" + err.Error()
	}

	by, _ := jsoniter.Marshal(mp["data"])
	return string(by)
}
