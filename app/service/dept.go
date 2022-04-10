package service

import (
	"errors"
	request "i421/app/http/request/dept"
	"i421/app/model"
	"i421/app/model/depart"
)

// DepartService 部门表service层
type DepartService struct {
}

type WhereCond struct {
	Name   string `json:"name"`
	Status int    `json:"status"`
}

// TreeList 菜单
type TreeList struct {
	ID         int64      `json:"id"`
	Name       string     `json:"deptName"`                    // 部门名称
	Sort       int64      `json:"orderNo"`                     // 排序
	Status     int        `json:"status"`                      // 状态
	ParentId   int64      `gorm:"default:0" json:"parentId"`   // 上级ID
	ParentDept int64      `gorm:"default:0" json:"parentDept"` // 上级部门
	CreateTime int64      `json:"createTime"`                  // 排序
	Remark     string     `json:"remark"`                      // 备注
	Children   []TreeList `json:"children,omitempty"`
}

// NewDepartService 实例化
func NewDepartService() *DepartService {
	return &DepartService{}
}

// FormMenu 格式化菜单
func (ds *DepartService) FormMenu(list []depart.Depart, pid int64) (formMenu []depart.Depart) {
	for _, val := range list {
		if val.ParentId == pid {
			if pid == -1 {
				// 顶层
				formMenu = append(formMenu, val)
			} else {
				var children []depart.Depart
				child := val
				children = append(children, child)
			}
		}
	}
	return
}

// GetMenu 获取菜单
func (ds *DepartService) GetMenu(menuList []depart.Depart, pid int64) []TreeList {
	treeList := []TreeList{}
	for _, v := range menuList {
		if v.ParentId == pid {
			child := ds.GetMenu(menuList, v.ID)
			node := TreeList{
				ID:         v.ID,
				Name:       v.Name,
				ParentId:   v.ParentId,
				ParentDept: v.ParentId,
				Sort:       v.Sort,
				Status:     v.Status,
				Remark:     v.Remark,
				CreateTime: v.CreateTime,
			}
			node.Children = child
			treeList = append(treeList, node)
		}
	}
	return treeList
}

// GetDepartList 获取部门列表
func (ds *DepartService) GetDepartList(deptListRequest request.DeptListRequest) (tree []TreeList, err error) {

	var departResp []depart.Depart

	// 查询条件结构体
	var whereCond WhereCond

	if deptListRequest.DeptName != "" {
		whereCond.Name = deptListRequest.DeptName
	}

	if deptListRequest.Status != 0 {
		whereCond.Status = deptListRequest.Status
	}

	res := model.Db.Model(&depart.Depart{}).Where("is_deleted != 1").Where(whereCond).Order("sort").Find(&departResp)

	if res.RowsAffected < 1 {
		return tree, errors.New("查询为空")
	}

	tree = ds.GetMenu(departResp, -1)

	return tree, nil
}

// updateDepart 更新部门
func (ds *DepartService) UpdateDepart(updateDept request.UpdateDeptRequest) (flag bool, err error) {

	res := model.Db.Model(&depart.Depart{}).Where("id = ?", updateDept.ID).Select("name", "sort", "remark", "status", "parent_id").Updates(map[string]interface{}{"name": updateDept.DeptName, "sort": updateDept.OrderNo, "remark": updateDept.Remark, "status": updateDept.Status, "parent_id": updateDept.ParentDept})

	if res.RowsAffected < 1 {
		return false, errors.New("更新失败")
	}
	return true, nil
}

// deleteDepart 删除部门
func (ds *DepartService) DeleteDepart(deleteDeptRequest request.DeleteDeptRequest) (flag bool, err error) {

	if deleteDeptRequest.Type != "" {
		res := model.Db.Model(&depart.Depart{}).Where("id = ?", deleteDeptRequest.ID).Updates(map[string]interface{}{"is_deleted": 1})

		if res.RowsAffected < 1 {
			return false, errors.New("删除失败")
		}
	} else {
		res := model.Db.Delete(&depart.Depart{}, deleteDeptRequest.ID)

		if res.RowsAffected < 1 {
			return false, errors.New("删除失败")
		}
	}

	return true, nil
}
