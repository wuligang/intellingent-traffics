package com.hr.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hr.mapper.BusDriverMapper;
import com.hr.pojo.BusDriver;
import com.hr.service.BusDriverService;
@Service("busDriverService")
public class BusDriverServiceImpl implements BusDriverService {
	
	@Autowired
	private BusDriverMapper busDriverMapper;

	// 插入司机用户
	@Override
	public int addBusDriver(BusDriver busDriver) {
		return this.busDriverMapper.insertBusDriver(busDriver);
	}

	//修改汽车司机信息
	@Override
	public int repliceBusDriver(BusDriver busDriver) {
		return this.busDriverMapper.updateBusDriver(busDriver);
	}

}
