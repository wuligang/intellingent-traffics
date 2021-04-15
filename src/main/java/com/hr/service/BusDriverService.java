package com.hr.service;

import com.hr.pojo.BusDriver;

/**
 * 汽车司机业务逻辑层接口
 * 
 * @author Administrator
 * 
 */
public interface BusDriverService {

	// 插入司机用户
	public int addBusDriver(BusDriver busDriver);

	// 更新司机用户
	public int repliceBusDriver(BusDriver busDriver);
}
