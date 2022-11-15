package service

import (
	"errors"
	"fmt"
	request "i421/app/http/request/company"
	"i421/app/model"
	"i421/app/model/company"
)

// 公司列表查询
type CompanyListWhereCond struct {
	CompanyName string `json:"companyName"`
}

// CompanyService 公司表service层
type CompanyService struct {
}

// NewCompanyService 实例化
func NewCompanyService() *CompanyService {
	return &CompanyService{}
}

// GetAllCompanyList 获取所有公司
func (cs *CompanyService) GetAllCompanyList() (companies []company.Company, err error) {

	res := model.Db.Model(&company.Company{}).Where("is_deleted != 1").Order("id").Find(&companies)

	if res.RowsAffected < 1 {
		return companies, errors.New("查询为空")
	}

	return companies, nil
}

// GetMyCompanyList 获取我的公司
func (cs *CompanyService) GetMyCompanyList(userId int64, getCompanyListByPageRequest request.GetCompanyListByPageRequest) (companies []company.Company, err error) {

	// 查询条件结构体
	var whereCond CompanyListWhereCond

	if getCompanyListByPageRequest.CompanyName != "" {
		whereCond.CompanyName = getCompanyListByPageRequest.CompanyName
	}

	res := model.Db.Model(&company.Company{}).Where("is_deleted != 1 and user_id = ?", userId).Where(whereCond).Order("id").Find(&companies)

	if res.RowsAffected < 1 {
		return companies, errors.New("查询为空")
	}

	return companies, nil
}

// GetCompanyListByPage 获取角色列表
func (cs *CompanyService) GetCompanyListByPage(getCompanyListByPageRequest request.GetCompanyListByPageRequest) (companies []company.Company, total int64, err error) {

	// 查询条件结构体
	var whereCond CompanyListWhereCond

	if getCompanyListByPageRequest.CompanyName != "" {
		whereCond.CompanyName = getCompanyListByPageRequest.CompanyName
	}

	temp := model.Db.Model(&company.Company{}).Select([]string{"id", "company_name", "remark", "province", "city", "area", "address", "legal_person", "env_person", "env_person_phone", "handle_person", "handle_person_phone", "remark", "status", "files"}).Where("is_deleted != 1").Where(whereCond).Order("id")

	res := temp.Limit(getCompanyListByPageRequest.PageSize).Offset((getCompanyListByPageRequest.Page - 1) * getCompanyListByPageRequest.PageSize).Find(&companies)

	var count int64
	temp.Count(&count)

	if res.RowsAffected < 1 {
		return companies, count, errors.New("查询为空")
	}

	return companies, count, nil
}

// GetPublishedCompanyList 获取发布公司
func (cs *CompanyService) GetPublishedCompanyList(getCompanyListByPageRequest request.GetCompanyListByPageRequest) (companies []company.Company, err error) {

	// 查询条件结构体
	var whereCond CompanyListWhereCond

	if getCompanyListByPageRequest.CompanyName != "" {
		whereCond.CompanyName = getCompanyListByPageRequest.CompanyName
	}

	res := model.Db.Model(&company.Company{}).Where("is_deleted != 1 and status = 2").Where(whereCond).Order("id").Find(&companies)

	if res.RowsAffected < 1 {
		return companies, errors.New("查询为空")
	}

	return companies, nil
}

// setCompanyStatus 调整公司状态
func (cs *CompanyService) SetCompanyStatus(setCompanyStatusRequest request.SetCompanyStatusRequest) (flag bool, err error) {

	res := model.Db.Model(&company.Company{}).Where("id = ?", setCompanyStatusRequest.ID).Updates(map[string]interface{}{"status": setCompanyStatusRequest.Status})

	if res.RowsAffected < 1 {
		return false, errors.New("设置失败")
	}
	return true, nil
}

// updateCompany 更新公司状态
func (cs *CompanyService) UpdateCompany(updateOrCreateCompanyRequest request.UpdateOrCreateCompanyRequest) (flag bool, err error) {

	res := model.Db.Model(&company.Company{}).Where("id = ?", updateOrCreateCompanyRequest.ID).Select("company_name", "province", "city", "area", "address", "legal_person", "env_person", "ent_person_phone", "handle_person", "handle_person_phone", "status", "remark", "files").Updates(map[string]interface{}{"company_name": updateOrCreateCompanyRequest.CompanyName, "province": updateOrCreateCompanyRequest.Province, "city": updateOrCreateCompanyRequest.City, "area": updateOrCreateCompanyRequest.Area, "address": updateOrCreateCompanyRequest.Address, "legal_person": updateOrCreateCompanyRequest.LegalPerson, "env_person": updateOrCreateCompanyRequest.EnvPerson, "env_person_phone": updateOrCreateCompanyRequest.EnvPersonPhone, "handle_person": updateOrCreateCompanyRequest.HandlePerson, "handle_person_phone": updateOrCreateCompanyRequest.HandlePersonPhone, "status": updateOrCreateCompanyRequest.Status, "remark": updateOrCreateCompanyRequest.Remark, "files": updateOrCreateCompanyRequest.File})

	if res.RowsAffected < 1 {
		return false, errors.New("更新失败")
	}
	return true, nil
}

// createCompany 创建公司
func (cs *CompanyService) CreateCompany(userId int64, createCompanyRequest request.UpdateOrCreateCompanyRequest) (flag bool, err error) {

	companyResp := company.Company{
		CompanyName:       createCompanyRequest.CompanyName,
		UserId:            userId,
		Province:          createCompanyRequest.Province,
		City:              createCompanyRequest.City,
		Area:              createCompanyRequest.Area,
		Address:           createCompanyRequest.Address,
		LegalPerson:       createCompanyRequest.LegalPerson,
		EnvPerson:         createCompanyRequest.EnvPerson,
		EnvPersonPhone:    createCompanyRequest.EnvPersonPhone,
		HandlePerson:      createCompanyRequest.HandlePerson,
		HandlePersonPhone: createCompanyRequest.HandlePersonPhone,
		Remark:            createCompanyRequest.Remark,
		Status:            createCompanyRequest.Status,
		File:              createCompanyRequest.File,
	}

	res := model.Db.Create(&companyResp)

	fmt.Println(res)
	if res.RowsAffected < 1 {
		return false, errors.New("公司已存在")
	}

	return true, nil
}

// deleteCompany 删除角色
func (cs *CompanyService) DeleteCompany(deleteCompanyRequest request.DeleteCompanyRequest) (flag bool, err error) {

	if deleteCompanyRequest.Type != "" {
		// 强制删除
		res := model.Db.Model(&company.Company{}).Where("id = ?", deleteCompanyRequest.ID).Updates(map[string]interface{}{"is_deleted": 1})

		if res.RowsAffected < 1 {
			return false, errors.New("删除失败")
		}

	} else {
		// 软删除
		res := model.Db.Delete(&company.Company{}, deleteCompanyRequest.ID)

		if res.RowsAffected < 1 {
			return false, errors.New("删除失败")
		}
	}

	return true, nil
}
