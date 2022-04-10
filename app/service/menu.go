package service

import (
	"errors"
	request "i421/app/http/request/menu"
	"i421/app/model"
	"i421/app/model/menu"
)

// MenuTreeList 菜单
type MenuTreeList struct {
	ID         int64          `json:"id"`
	Icon       string         `json:"icon"`                      // 图标
	Component  string         `json:"component"`                 // 组建
	Type       int            `json:"type"`                      // 类型
	Menu       string         `json:"menuName"`                  // 名称
	Permission string         `json:"permission"`                // 权限
	ParentId   int64          `gorm:"default:0" json:"parentId"` // 上级ID
	Sort       int            `json:"sort"`                      // 排序
	CreateTime int64          `json:"createTime"`                // 时间
	Status     int            `json:"status"`                    // 状态
	Children   []MenuTreeList `json:"children,omitempty"`
}

// MenuService 部门表service层
type MenuService struct {
}

// NewMenuService 实例化
func NewMenuService() *MenuService {
	return &MenuService{}
}

// GetMenu 获取菜单
func (ms *MenuService) GetMenu(menuList []menu.Menu, pid int64) []MenuTreeList {
	treeList := []MenuTreeList{}
	for _, v := range menuList {
		if v.ParentId == pid {
			child := ms.GetMenu(menuList, v.ID)
			node := MenuTreeList{
				ID:         v.ID,
				Icon:       v.Icon,
				Menu:       v.Name,
				Component:  v.Component,
				Type:       v.Type,
				Permission: v.Permission,
				ParentId:   v.ParentId,
				Sort:       v.Sort,
				Status:     v.Status,
				CreateTime: v.CreateTime,
			}
			node.Children = child
			treeList = append(treeList, node)
		}
	}
	return treeList
}

// GetMenuList 获取部门列表
func (ms *MenuService) GetMenuList() (tree []MenuTreeList, err error) {

	var menuResp []menu.Menu

	res := model.Db.Model(&menu.Menu{}).Where("is_deleted != 1").Order("sort").Find(&menuResp)

	if res.RowsAffected < 1 {
		return tree, errors.New("查询为空")
	}

	tree = ms.GetMenu(menuResp, -1)

	return tree, nil
}

// deleteMenu 删除账户
func (ms *MenuService) DeleteMenu(deleteMenuRequest request.DeleteMenuRequest) (flag bool, err error) {

	if deleteMenuRequest.Type != "" {
		res := model.Db.Model(&menu.Menu{}).Where("id = ?", deleteMenuRequest.ID).Updates(map[string]interface{}{"is_deleted": 1})

		if res.RowsAffected < 1 {
			return false, errors.New("删除失败")
		}
	} else {

		res := model.Db.Delete(&menu.Menu{}, deleteMenuRequest.ID)

		if res.RowsAffected < 1 {
			return false, errors.New("删除失败")
		}
	}

	return true, nil
}
