package service

import (
	"errors"
	request "i421/app/http/request/dept"
	"i421/app/model"
	"i421/app/model/dept"
)

// DeptService 部门表service层
type DeptService struct {
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

// NewDeptService 实例化
func NewDeptService() *DeptService {
	return &DeptService{}
}

// FormMenu 格式化菜单
func (ds *DeptService) FormMenu(list []dept.Dept, pid int64) (formMenu []dept.Dept) {
	for _, val := range list {
		if val.ParentId == pid {
			if pid == -1 {
				// 顶层
				formMenu = append(formMenu, val)
			} else {
				var children []dept.Dept
				child := val
				children = append(children, child)
			}
		}
	}
	return
}

// GetMenu 获取菜单
func (ds *DeptService) GetMenu(menuList []dept.Dept, pid int64) []TreeList {
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

// GetDeptList 获取部门列表
func (ds *DeptService) GetDeptList(deptListRequest request.DeptListRequest) (tree []TreeList, err error) {

	var deptResp []dept.Dept

	// 查询条件结构体
	var whereCond WhereCond

	if deptListRequest.DeptName != "" {
		whereCond.Name = deptListRequest.DeptName
	}

	if deptListRequest.Status != 0 {
		whereCond.Status = deptListRequest.Status
	}

	res := model.Db.Model(&dept.Dept{}).Where("is_deleted != 1").Where(whereCond).Order("sort").Find(&deptResp)

	if res.RowsAffected < 1 {
		return tree, errors.New("查询为空")
	}

	tree = ds.GetMenu(deptResp, -1)

	return tree, nil
}

// updateDept 更新部门
func (ds *DeptService) UpdateDept(updateDept request.UpdateOrCreateDeptRequest) (flag bool, err error) {

	res := model.Db.Model(&dept.Dept{}).Where("id = ?", updateDept.ID).Select("name", "sort", "remark", "status", "parent_id").Updates(map[string]interface{}{"name": updateDept.DeptName, "sort": updateDept.OrderNo, "remark": updateDept.Remark, "status": updateDept.Status, "parent_id": updateDept.ParentDept})

	if res.RowsAffected < 1 {
		return false, errors.New("更新失败")
	}
	return true, nil
}

// createDept 创建部门
func (ds *DeptService) CreateDept(createDeptRequest request.UpdateOrCreateDeptRequest) (flag bool, err error) {

	deptResp := dept.Dept{Name: createDeptRequest.DeptName, Sort: createDeptRequest.OrderNo, Remark: createDeptRequest.Remark, Status: createDeptRequest.Status, ParentId: createDeptRequest.ParentDept}

	res := model.Db.Create(&deptResp)

	if res.RowsAffected < 1 {
		return false, errors.New("部门已存在")
	}

	return true, nil
}

// deleteDept 删除部门
func (ds *DeptService) DeleteDept(deleteDeptRequest request.DeleteDeptRequest) (flag bool, err error) {

	if deleteDeptRequest.Type != "" {
		res := model.Db.Model(&dept.Dept{}).Where("id = ?", deleteDeptRequest.ID).Updates(map[string]interface{}{"is_deleted": 1})

		if res.RowsAffected < 1 {
			return false, errors.New("删除失败")
		}
	} else {
		res := model.Db.Delete(&dept.Dept{}, deleteDeptRequest.ID)

		if res.RowsAffected < 1 {
			return false, errors.New("删除失败")
		}
	}

	return true, nil
}
