package com.hr.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hr.mapper.BusDriverMapper;
import com.hr.mapper.BusMapper;
import com.hr.pojo.Bus;
import com.hr.pojo.BusDriver;
import com.hr.service.BusService;
import com.hr.util.EasyUi;

/**
 * 汽车管理服务层实现类
 * 
 * @author Administrator
 * 
 */
@Service("busService")
public class BusServiceImpl implements BusService {

	@Autowired
	private BusMapper busMapper;

	@Autowired
	private BusDriverMapper busDriverMapper;

	// 查询所有汽车相关信息
	@Override
	public EasyUi getAllBus(int pageNum, int pageSize, String busNumber,
			String driverName) {
		EasyUi easyUi = new EasyUi();

		PageHelper.startPage(pageNum, pageSize);
		List<Bus> list = this.busMapper.quaryAllBus(busNumber, driverName);
		PageInfo<Bus> pageInfo = new PageInfo<Bus>(list);
		easyUi.setTotal(pageInfo.getTotal());
		easyUi.setRows(pageInfo.getList());
		return easyUi;
	}

	// 插入汽车信息
	@Override
	public int addBus(Bus bus, BusDriver busDriver) {
		int j = this.busDriverMapper.insertBusDriver(busDriver);
		int i = this.busMapper.insertBus(bus);
		int f;
		if (i == 1 && j == 1) {
			f = 1;
		} else {
			f = 0;
		}
		return f;
	}

	// 删除汽车信息
	@Override
	public int deleteBus(Long[] busIds) {
		return this.busMapper.deleteBus(busIds);
	}

	// 更新车辆信息
	@Override
	public int replaceBus(Bus bus, BusDriver busDriver) {
		int i = this.busDriverMapper.updateBusDriver(busDriver);
		int j = this.busMapper.updateBus(bus);
		int f;
		if (i == 1 && j == 1) {
			f = 1;
		} else {
			f = 0;
		}
		return f;
	}

	// 根据汽车id查询该汽车司机
	@Override
	public Bus getDriverIdByBusId(int busId) {
		return this.busMapper.quaryDriverIdByBusId(busId);
	}

}
