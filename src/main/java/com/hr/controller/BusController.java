package com.hr.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hr.pojo.Bus;
import com.hr.pojo.BusDriver;
import com.hr.service.BusCompanyService;
import com.hr.service.BusDriverService;
import com.hr.service.BusService;
import com.hr.service.BusTeamService;
import com.hr.util.EasyUi;

/**
 * 汽车管理控制层
 * 
 * @author Administrator
 * 
 */
@Controller("busController")
@RequestMapping("bus")
public class BusController {

	// 汽车业务逻辑类
	@Autowired
	private BusService busService;

	// 司机逻辑类
	@Autowired
	private BusDriverService busDriverService;
	
	// 汽车大队业务逻辑类
	@Autowired
	private BusTeamService busTeamService;

	/**
	 * 查询所有汽车相关的信息
	 * 
	 * @describe
	 * @author FYX
	 * @time:下午3:29:08
	 */
	@RequestMapping("all")
	@ResponseBody
	public EasyUi SendAllBus(
			@RequestParam(value = "page", defaultValue = "1") int total,
			@RequestParam(value = "rows", defaultValue = "2") int rows,
			@RequestParam(value="busNumber" , required=false) String busNumber,
			@RequestParam(value="driverName" , required=false) String driverName) {
		return this.busService.getAllBus(total, rows, busNumber, driverName);
	}

	/**
	 * 插入汽车和司机信息
	 * 
	 * @describe
	 * @author FYX
	 * @time:下午7:08:56
	 */
	@RequestMapping("add")
	@ResponseBody
	public Map<String, String> appendBus(
			@RequestParam("busNumber") String busNumber,
			@RequestParam("teamName") Integer teamId,
			@RequestParam("driverName") String driverName,
			@RequestParam("driverPhone") String driverPhone) {

		BusDriver busDriver = new BusDriver();
		busDriver.setDriverName(driverName);
		busDriver.setDriverPhone(driverPhone);
		busDriver.setDriverStatus(1);
		busDriver.setDriverTeam(teamId);
		

		Bus bus = new Bus();
		bus.setBusNumber(busNumber);
		bus.setBusTeam(teamId);
		bus.setBusStatus(1);
		bus.setBusDriver(busDriver.getDriverId());
		int i = this.busService.addBus(bus, busDriver);

		Map<String, String> map = new HashMap<String, String>();
		if (i == 1) {
			map.put("status", "200");
		} else {
			map.put("status", "500");
		}

		return map;
	}

	/**
	 * 汽车信息删除
	 * 
	 * @describe
	 * @author FYX
	 * @time:下午7:12:28
	 */
	@RequestMapping("delete")
	@ResponseBody
	public Map<String, String> cutOfBus(@RequestParam("busIds") Long[] busIds) {
		System.out.println(busIds[0]);
		Map<String, String> map = new HashMap<String, String>();
		int i = this.busService.deleteBus(busIds);

		if (i == 1) {
			map.put("status", "200");
		} else {
			map.put("status", "500");
		}

		return map;
	}

	@RequestMapping("update")
	@ResponseBody
	public Map<String, String> changeBus(@RequestParam("busId") Integer busId,
			@RequestParam("busNumber") String busNumber,
			@RequestParam("teamId1") Integer teamId,
			@RequestParam("driverId") Integer busDriverId,
			@RequestParam("driverName") String driverName,
			@RequestParam("driverPhone") String driverPhone) {
		Map<String, String> map = new HashMap<String,String>();
		Bus bus = new Bus();
		bus.setBusId(busId);
		bus.setBusNumber(busNumber);
		bus.setBusStatus(1);
		bus.setBusTeam(teamId);
		bus.setBusDriver(busDriverId);
		
		BusDriver busDriver = new BusDriver();
		busDriver.setDriverId(busDriverId);
		busDriver.setDriverName(driverName);
		busDriver.setDriverPhone(driverPhone);
		busDriver.setDriverTeam(teamId);
		busDriver.setDriverStatus(1);
		int i = this.busService.replaceBus(bus, busDriver);
		
		if (i == 1) {
			map.put("status", "200");
		} else {
			map.put("status", "500");
		}

		return map;
	}
	
	//导出
	@RequestMapping(value="/export/excel")
	public ModelAndView export(
			@RequestParam(value="page")Integer pageNum,
			@RequestParam(value="rows")Integer pageSize,
			@RequestParam(value="busNumber" , required=false) String busNumber,
			@RequestParam(value="driverName" , required=false)String driverName){
		EasyUi allBus = this.busService.getAllBus(pageNum, pageSize, busNumber, driverName);
		
		List<Bus> buslist = (List<Bus>) allBus.getRows();
		for (Bus bus : buslist) {
			System.out.println(bus);
		}
		ModelAndView mv = new ModelAndView();
		mv.addObject("busList",buslist);
		mv.setViewName("BusExcelView");
		return mv;
	}
}
