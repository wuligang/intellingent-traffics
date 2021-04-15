package com.hr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hr.pojo.BusCompany;
import com.hr.service.BusCompanyService;

/**
 * 汽车公司管理控制层
 * 
 * @author Administrator
 * 
 */
@Controller("busCompanyController")
@RequestMapping("busCompany")
public class BusCompanyController {

	@Autowired
	private BusCompanyService busCompanyService;

	/**
	 * 发送所有公司的集合
	 * 
	 * @describe
	 * @author FYX
	 * @time:下午2:17:09
	 */
	@RequestMapping("allBusCompany")
	@ResponseBody
	public List<BusCompany> SendBusCompany() {
		return this.busCompanyService.getAllBusCompany();
	}

}
