package com.hr.service;

import java.util.List;

import com.hr.pojo.BusCompany;


/**
 * 汽车公司服务层
 * @author Administrator
 *
 */
public interface BusCompanyService {
	
	//获得所有汽车公司
	public List<BusCompany> getAllBusCompany();
	
	//根据汽车公司查询公司id
	public Integer getCompanyIdByName(String companyName);
}
