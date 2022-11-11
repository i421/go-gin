package service

import (
	"errors"
	request "i421/app/http/request/menu"
	"i421/app/model"
	"i421/app/model/menu"
)

type MenuWhereCond struct {
	Name   string `json:"name"`
	Status int    `json:"status"`
}

type Meta struct {
	Hidden    int    `json:"hiddenMenu"`
	Title     string `json:"title"`
	KeepAlive bool   `json:"ignoreKeepAlive"`
}

// 用户菜单
type RoleMenuTreeList struct {
	ID         int64              `json:"id"`
	Icon       string             `json:"icon"`                      // 图标
	Component  string             `json:"component"`                 // 组建
	Type       int                `json:"type"`                      // 类型
	Path       string             `json:"path"`                      // 类型
	Menu       string             `json:"name"`                      // 名称
	Permission string             `json:"permission"`                // 权限
	ParentId   int64              `gorm:"default:0" json:"parentId"` // 上级ID
	Sort       int                `json:"orderNo"`                   // 排序
	CreateTime int64              `json:"createTime"`                // 时间
	Status     int                `json:"status"`                    // 状态
	Meta       Meta               `json:"meta"`
	Children   []RoleMenuTreeList `json:"children,omitempty"`
}

// MenuTreeList 菜单
type MenuTreeList struct {
	ID         int64          `json:"id"`
	Icon       string         `json:"icon"`                      // 图标
	Component  string         `json:"component"`                 // 组建
	Type       int            `json:"type"`                      // 类型
	Path       string         `json:"routePath"`                 // 类型
	Menu       string         `json:"menuName"`                  // 名称
	Permission string         `json:"permission"`                // 权限
	ParentId   int64          `gorm:"default:0" json:"parentId"` // 上级ID
	Sort       int            `json:"orderNo"`                   // 排序
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
				Path:       v.Path,
				Status:     v.Status,
				CreateTime: v.CreateTime,
			}
			node.Children = child
			treeList = append(treeList, node)
		}
	}
	return treeList
}

// GetMenu 获取菜单
func (ms *MenuService) GetRoleMenu(menuList []menu.Menu, pid int64) []RoleMenuTreeList {
	treeList := []RoleMenuTreeList{}
	for _, v := range menuList {
		if v.ParentId == pid {
			child := ms.GetRoleMenu(menuList, v.ID)
			node := RoleMenuTreeList{
				ID:         v.ID,
				Icon:       v.Icon,
				Menu:       v.Name,
				Component:  v.Component,
				Type:       v.Type,
				Permission: v.Permission,
				ParentId:   v.ParentId,
				Sort:       v.Sort,
				Path:       v.Path,
				Status:     v.Status,
				CreateTime: v.CreateTime,
				Meta: Meta{
					Title:     v.Name,
					Hidden:    v.Hidden,
					KeepAlive: v.KeepAlive,
				},
			}
			node.Children = child
			treeList = append(treeList, node)
		}
	}
	return treeList
}

// GetRoleMenu 获取部门列表
func (ms *MenuService) GetRoleMenuList(userId int64) (tree []RoleMenuTreeList, err error) {

	var roleIds []int64

	model.Db.Table("role_user").Where("user_id", userId).Pluck("role_id", &roleIds)

	var menuResp []menu.Menu
	res := model.Db.Raw("SELECT menu.id, name, permission, path, component, parent_id, icon, sort, keep_alive, type, hidden, target FROM menu INNER JOIN permission_role ON menu.id = permission_role.menu_id WHERE menu.status != 1 AND menu.is_deleted != 1 AND menu.type < 2 AND permission_role.role_id IN ? order by sort asc", roleIds).Scan(&menuResp)

	if res.RowsAffected < 1 {
		return tree, errors.New("查询为空")
	}

	tree = ms.GetRoleMenu(menuResp, 0)

	return tree, nil
}

// GetMenuList 获取部门列表
func (ms *MenuService) GetMenuList(menuListRequest request.MenuListRequest) (tree []MenuTreeList, err error) {

	var menuResp []menu.Menu

	// 查询条件结构体
	var whereCond MenuWhereCond

	if menuListRequest.MenuName != "" {
		whereCond.Name = menuListRequest.MenuName
	}

	if menuListRequest.Status != 0 {
		whereCond.Status = menuListRequest.Status
	}

	res := model.Db.Model(&menu.Menu{}).Where("is_deleted != 1").Where(whereCond).Order("sort asc").Find(&menuResp)

	if res.RowsAffected < 1 {
		return tree, errors.New("查询为空")
	}

	tree = ms.GetMenu(menuResp, 0)

	return tree, nil
}

// GetPermCode 获取用户按钮权限ID数组
func (ms *MenuService) GetPermCode(userId int64) (ids []int64, err error) {

	var roleIds []int64

	model.Db.Table("role_user").Where("user_id", userId).Pluck("role_id", &roleIds)

	var menus []menu.Menu
	model.Db.Raw("SELECT menu.id FROM menu INNER JOIN permission_role ON menu.id = permission_role.menu_id WHERE menu.type = 2 AND permission_role.role_id IN ?", roleIds).Scan(&menus)

	for _, item := range menus {
		ids = append(ids, item.ID)
	}

	return ids, nil
}

// updateMenu 更新菜单
func (ms *MenuService) UpdateMenu(updateMenuRequest request.UpdateOrCreateMenuRequest) (flag bool, err error) {

	res := model.Db.Model(&menu.Menu{}).Where("id = ?", updateMenuRequest.ID).Select("name", "icon", "permission", "status", "sort", "hidden", "target", "type", "parent_id", "path", "sort").Updates(map[string]interface{}{"name": updateMenuRequest.MenuName, "icon": updateMenuRequest.Icon, "permission": updateMenuRequest.Permission, "status": updateMenuRequest.Status, "sort": updateMenuRequest.OrderNo, "hidden": updateMenuRequest.Show, "target": updateMenuRequest.IsExt, "type": updateMenuRequest.Type, "parent_id": updateMenuRequest.ParentMenu, "path": updateMenuRequest.RoutePath})

	if res.RowsAffected < 1 {
		return false, errors.New("更新失败")
	}
	return true, nil
}

// createMenu 创建菜单
func (ms *MenuService) CreateMenu(createMenuRequest request.UpdateOrCreateMenuRequest) (flag bool, err error) {

	menuResp := menu.Menu{Name: createMenuRequest.MenuName, Icon: createMenuRequest.Icon, Permission: createMenuRequest.Permission, Status: createMenuRequest.Status, Sort: createMenuRequest.OrderNo, Hidden: createMenuRequest.Show, Target: createMenuRequest.IsExt, Type: createMenuRequest.Type, ParentId: createMenuRequest.ParentMenu, Path: createMenuRequest.RoutePath}

	res := model.Db.Create(&menuResp)

	if res.RowsAffected < 1 {
		return false, errors.New("菜单已存在")
	}
	return true, nil
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
