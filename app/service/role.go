package service

import (
	"errors"
	"fmt"
	request "i421/app/http/request/role"
	"i421/app/model"
	"i421/app/model/role"
)

// 角色列表查询
type RoleListWhereCond struct {
	RoleName string `json:"roleName"`
	Status   int    `json:"status"`
}

// RoleService 角色表service层
type RoleService struct {
}

// NewRoleService 实例化
func NewRoleService() *RoleService {
	return &RoleService{}
}

// GetAllRoleList 获取所有角色
func (rs *RoleService) GetAllRoleList() (roles []role.Role, err error) {

	res := model.Db.Model(&role.Role{}).Where("is_deleted != 1").Order("sort").Find(&roles)

	if res.RowsAffected < 1 {
		return roles, errors.New("查询为空")
	}

	return roles, nil
}

// GetRoleListByPage 获取角色列表
func (rs *RoleService) GetRoleListByPage(getRoleListByPageRequest request.GetRoleListByPageRequest) (roles []role.Role, total int64, err error) {

	// 查询条件结构体
	var whereCond RoleListWhereCond

	if getRoleListByPageRequest.RoleName != "" {
		whereCond.RoleName = getRoleListByPageRequest.RoleName
	}

	if getRoleListByPageRequest.Status != 0 {
		whereCond.Status = getRoleListByPageRequest.Status
	}

	temp := model.Db.Model(&role.Role{}).Preload("Menus").Select([]string{"id", "role_name", "role_code", "description", "status", "create_time", "sort"}).Where("is_deleted != 1").Where(whereCond).Order("sort")

	res := temp.Limit(getRoleListByPageRequest.PageSize).Offset((getRoleListByPageRequest.Page - 1) * getRoleListByPageRequest.PageSize).Find(&roles)

	var count int64
	temp.Count(&count)

	if res.RowsAffected < 1 {
		return roles, count, errors.New("查询为空")
	}

	return roles, count, nil
}

// setRoleStatus 调整角色状态
func (rs *RoleService) SetRoleStatus(setRoleStatusRequest request.SetRoleStatusRequest) (flag bool, err error) {

	res := model.Db.Model(&role.Role{}).Where("id = ?", setRoleStatusRequest.ID).Updates(map[string]interface{}{"status": setRoleStatusRequest.Status})

	if res.RowsAffected < 1 {
		return false, errors.New("设置失败")
	}
	return true, nil
}

// updateRole 更新角色状态
func (rs *RoleService) UpdateRole(updateRoleRequest request.UpdateRoleRequest) (flag bool, err error) {

	fmt.Println(updateRoleRequest)

	return true, nil
	/*
		res := model.Db.Model(&role.Role{}).Where("id = ?", setRoleStatusRequest.ID).Updates()

		if res.RowsAffected < 1 {
			return false, errors.New("设置失败")
		}
		return true, nil
	*/
}

// deleteRole 删除角色
func (rs *RoleService) DeleteRole(deleteRoleRequest request.DeleteRoleRequest) (flag bool, err error) {

	if deleteRoleRequest.Type != "" {
		// 强制删除
		res := model.Db.Model(&role.Role{}).Where("id = ?", deleteRoleRequest.ID).Updates(map[string]interface{}{"is_deleted": 1})

		if res.RowsAffected < 1 {
			return false, errors.New("删除失败")
		}

	} else {
		// 软删除
		res := model.Db.Delete(&role.Role{}, deleteRoleRequest.ID)

		if res.RowsAffected < 1 {
			return false, errors.New("删除失败")
		}
	}

	return true, nil
}
