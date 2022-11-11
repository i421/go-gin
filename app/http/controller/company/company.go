package company

import (
	. "i421/app/http/controller"
	request "i421/app/http/request/company"
	"i421/app/service"
	"net/http"

	"github.com/gin-gonic/gin"
)

// 获取公司信息
func GetAllCompanyList(c *gin.Context) {

	companyService := service.NewCompanyService()
	companyListResp, err := companyService.GetAllCompanyList()

	// 获取失败
	if err != nil {
		res := Response{
			Code: 1,
			Msg:  err.Error(),
		}

		c.JSON(http.StatusOK, res)
		return
	}

	res := Response{
		Code: 0,
		Msg:  "success",
		Data: companyListResp,
	}

	c.JSON(http.StatusOK, res)
}

// 获取分页公司信息
func GetCompanyListByPage(c *gin.Context) {

	var getCompanyListByPageRequest request.GetCompanyListByPageRequest

	if err := c.ShouldBind(&getCompanyListByPageRequest); err != nil {
		res := Response{
			Code: 1,
			Msg:  err.Error(),
		}
		c.JSON(http.StatusBadRequest, res)
		return
	}

	companyService := service.NewCompanyService()
	companyListResp, total, err := companyService.GetCompanyListByPage(getCompanyListByPageRequest)

	// 获取失败
	if err != nil {
		res := Response{
			Code: 1,
			Msg:  err.Error(),
		}

		c.JSON(http.StatusOK, res)
		return
	}

	res := Response{
		Code:  0,
		Msg:   "success",
		Data:  companyListResp,
		Total: total,
	}

	c.JSON(http.StatusOK, res)
}

// 设置公司状态
func SetCompanyStatus(c *gin.Context) {

	var setCompanyStatusRequest request.SetCompanyStatusRequest

	if err := c.ShouldBind(&setCompanyStatusRequest); err != nil {
		res := Response{
			Code: 1,
			Msg:  err.Error(),
		}
		c.JSON(http.StatusBadRequest, res)
		return
	}

	departService := service.NewCompanyService()
	_, err := departService.SetCompanyStatus(setCompanyStatusRequest)

	// 更新失败
	if err != nil {
		res := Response{
			Code: 1,
			Msg:  err.Error(),
		}

		c.JSON(http.StatusOK, res)
		return
	}

	res := Response{
		Code: 0,
		Msg:  "success",
	}

	c.JSON(http.StatusOK, res)
}

// 更新公司信息
func UpdateOrCreateCompany(c *gin.Context) {

	var updateOrCreateCompanyRequest request.UpdateOrCreateCompanyRequest

	if err := c.ShouldBind(&updateOrCreateCompanyRequest); err != nil {
		res := Response{
			Code: 1,
			Msg:  err.Error(),
		}
		c.JSON(http.StatusBadRequest, res)
		return
	}

	var err error

	companyService := service.NewCompanyService()
	if updateOrCreateCompanyRequest.ID != 0 {
		_, err = companyService.UpdateCompany(updateOrCreateCompanyRequest)
	} else {
		_, err = companyService.CreateCompany(updateOrCreateCompanyRequest)
	}

	// 更新失败
	if err != nil {
		res := Response{
			Code: 1,
			Msg:  err.Error(),
		}

		c.JSON(http.StatusOK, res)
		return
	}

	res := Response{
		Code: 0,
		Msg:  "success",
	}

	c.JSON(http.StatusOK, res)
}

// 删除公司信息
func DeleteCompany(c *gin.Context) {

	var deleteCompanyRequest request.DeleteCompanyRequest

	if err := c.ShouldBind(&deleteCompanyRequest); err != nil {
		res := Response{
			Code: 1,
			Msg:  err.Error(),
		}
		c.JSON(http.StatusBadRequest, res)
		return
	}

	companyService := service.NewCompanyService()
	_, err := companyService.DeleteCompany(deleteCompanyRequest)

	// 删除失败
	if err != nil {
		res := Response{
			Code: 1,
			Msg:  err.Error(),
		}

		c.JSON(http.StatusOK, res)
		return
	}

	res := Response{
		Code: 0,
		Msg:  "success",
		Data: 0,
	}

	c.JSON(http.StatusOK, res)
}