package com.hr.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.hr.pojo.BusCompany;

/**
 * 汽车公司管理接口
 * @author Administrator
 *
 */
@Repository("busCompanyMapper")
public interface BusCompanyMapper {

	//查询所有汽车公司
	public List<BusCompany> quaryAllBusCompany();
	
	//根据汽车公司查询id
	public BusCompany quaryCompanyIdByName(@Param("companyName")String companyName);
	
}
