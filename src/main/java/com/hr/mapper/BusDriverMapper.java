package com.hr.mapper;

import org.springframework.stereotype.Repository;

import com.hr.pojo.BusDriver;

/**
 * 汽车司机dao层接口
 * @author Administrator
 *
 */
@Repository("busDriverMapper")
public interface BusDriverMapper {
	
	// 插入司机用户
	public int insertBusDriver(BusDriver busDriver);
	
	//更新司机用户
	public int updateBusDriver(BusDriver busDriver);
	
}
