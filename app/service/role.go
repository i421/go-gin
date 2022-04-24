package service

import (
	"errors"
	request "i421/app/http/request/role"
	"i421/app/model"
	"i421/app/model/permissionRole"
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
func (rs *RoleService) GetRoleListByPage(getRoleListByPageRequest request.GetRoleListByPageRequest) (roles []role.RoleAppendMenuIds, total int64, err error) {

	// 查询条件结构体
	var whereCond RoleListWhereCond

	if getRoleListByPageRequest.RoleName != "" {
		whereCond.RoleName = getRoleListByPageRequest.RoleName
	}

	if getRoleListByPageRequest.Status != 0 {
		whereCond.Status = getRoleListByPageRequest.Status
	}

	// 树父节点
	var parentIds []int64
	model.Db.Raw("select id from menu where id in (select parent_id from menu where type = 2) or parent_id = 0").Scan(&parentIds)

	temp := model.Db.Model(&role.Role{}).Preload("Menus", "id not in (?)", parentIds).Select([]string{"id", "role_name", "role_code", "description", "status", "create_time", "sort"}).Where("is_deleted != 1").Where(whereCond).Order("sort")

	res := temp.Limit(getRoleListByPageRequest.PageSize).Offset((getRoleListByPageRequest.Page - 1) * getRoleListByPageRequest.PageSize).Find(&roles)

	var count int64
	temp.Count(&count)

	for i, v := range roles {
		var ids []int64
		var names []string
		for _, vv := range v.Menus {
			ids = append(ids, vv.ID)
			names = append(names, vv.Name)
		}

		roles[i].MenuIds = ids
		roles[i].MenuNames = names
	}

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
func (rs *RoleService) UpdateRole(updateRoleRequest request.UpdateOrCreateRoleRequest) (flag bool, err error) {

	var permissionRoles []permissionRole.PermissionRole

	for _, item := range updateRoleRequest.MenuIds {
		var permissionRole permissionRole.PermissionRole
		permissionRole.MenuId = item
		permissionRole.RoleId = updateRoleRequest.ID
		permissionRoles = append(permissionRoles, permissionRole)
	}

	model.Db.Model(&role.Role{}).Where("id = ?", updateRoleRequest.ID).Select("role_name", "role_code", "description", "sort", "status").Updates(&role.Role{RoleName: updateRoleRequest.RoleName, RoleCode: updateRoleRequest.Value, Description: updateRoleRequest.Description, Sort: updateRoleRequest.Sort, Status: updateRoleRequest.Status})

	model.Db.Model(&permissionRole.PermissionRole{}).Where("role_id = ?", updateRoleRequest.ID).Delete(&permissionRoles)
	model.Db.Model(&permissionRole.PermissionRole{}).Create(&permissionRoles)

	return true, nil
}

// createRole 创建角色
func (rs *RoleService) CreateRole(createRoleRequest request.UpdateOrCreateRoleRequest) (flag bool, err error) {

	roleResp := role.Role{RoleName: createRoleRequest.RoleName, RoleCode: createRoleRequest.Value, Description: createRoleRequest.Description, Sort: createRoleRequest.Sort, Status: createRoleRequest.Status}

	res := model.Db.Create(&roleResp)

	if res.RowsAffected < 1 {
		return false, errors.New("角色已存在")
	}

	var permissionRoles []permissionRole.PermissionRole

	for _, item := range createRoleRequest.MenuIds {
		var permissionRole permissionRole.PermissionRole
		permissionRole.MenuId = item
		permissionRole.RoleId = roleResp.ID
		permissionRoles = append(permissionRoles, permissionRole)
	}

	model.Db.Model(&permissionRole.PermissionRole{}).Create(&permissionRoles)

	return true, nil
}

// deleteRole 删除角色
func (rs *RoleService) DeleteRole(deleteRoleRequest request.DeleteRoleRequest) (flag bool, err error) {

	if deleteRoleRequest.Type != "" {
		// 强制删除
		res := model.Db.Model(&role.Role{}).Where("id = ?", deleteRoleRequest.ID).Updates(map[string]interface{}{"is_deleted": 1})
		model.Db.Where("role_id = ?", deleteRoleRequest.ID).Delete(&permissionRole.PermissionRole{})

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
