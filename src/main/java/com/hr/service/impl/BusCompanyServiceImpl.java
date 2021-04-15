package com.hr.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hr.mapper.BusCompanyMapper;
import com.hr.pojo.BusCompany;
import com.hr.service.BusCompanyService;
/**
 * 汽车公司管理层实现类
 * @author Administrator
 *
 */
@Service("busCompanyService")
public class BusCompanyServiceImpl implements BusCompanyService {
	
	@Autowired
	private BusCompanyMapper busCompanyMapper;
	
	//获得所有汽车公司
	@Override
	public List<BusCompany> getAllBusCompany() {
		return this.busCompanyMapper.quaryAllBusCompany();
	}

	//根据汽车公司查询公司id
	@Override
	public Integer getCompanyIdByName(String companyName) {
		BusCompany busCompany = this.busCompanyMapper.quaryCompanyIdByName(companyName);
		return busCompany.getCompanyId();
	}

}
