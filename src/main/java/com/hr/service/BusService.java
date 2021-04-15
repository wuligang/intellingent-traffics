package com.hr.service;

import com.hr.pojo.Bus;
import com.hr.pojo.BusDriver;
import com.hr.util.EasyUi;

/**
 * 汽车管理服务层
 * 
 * @author Administrator
 * 
 */
public interface BusService {

	// 查询所有汽车相关信息
	public EasyUi getAllBus(int pageNum, int pageSize, String busNumber,
			String driverName);

	// 插入汽车信息
	public int addBus(Bus bus, BusDriver busDriver);

	// 删除汽车信息
	public int deleteBus(Long[] busIds);

	// 修改汽车信息
	public int replaceBus(Bus bus, BusDriver busDriver);

	// 根据汽车id查询该汽车司机
	public Bus getDriverIdByBusId(int busId);

}
