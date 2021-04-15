package com.hr.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hr.pojo.Bus;
import com.hr.pojo.BusLine;
import com.hr.pojo.BusStop;
import com.hr.service.BusLineService;
import com.hr.util.EasyUi;

/**
 * 公交线路controller
 * 
 * @author Administrator
 * 
 */
@Controller("busLineController")
@RequestMapping(value = "line")
public class BusLineController {

	@Autowired
	private BusLineService busLineService;

	@RequestMapping("all")
	@ResponseBody
	public EasyUi queryAllLine(
			@RequestParam(value = "page", defaultValue = "1") int total,
			@RequestParam(value = "rows", defaultValue = "2") int rows,
			@RequestParam(value = "lineName", required = false) String lineName,
			@RequestParam(value = "companyName", required = false) String companyName) {
		return busLineService.queryAll(total, rows, lineName, companyName);
	};

	@RequestMapping("add")
	@ResponseBody
	// 将对象转化为json响应给前端页面
	public Map<String, String> insert(
			@RequestParam("lineName") String lineName,
			@RequestParam("lineStatus") Integer lineStatus,
			@RequestParam("lineCompany") Integer lineCompany) {
		BusLine busLine = new BusLine();
		busLine.setLineName(lineName);
		busLine.setLineCompany(lineCompany);
		busLine.setLineStatus(lineStatus);
		int i = this.busLineService.insertbusline(busLine);
		Map<String, String> map = new HashMap<String, String>();
		if (i == 1) {
			map.put("status", "200");
		} else {
			map.put("status", "500");
		}
		return map;
	}

	@RequestMapping("update")
	@ResponseBody
	public Map<String, String> update(@RequestParam("lineId") Integer lineId,
			@RequestParam("lineName") String lineName,
			@RequestParam("lineStatus") Integer lineStatus,
			@RequestParam("lineCompany") Integer lineCompany) {
		BusLine busLine = new BusLine();
		busLine.setLineId(lineId);
		busLine.setLineName(lineName);
		busLine.setLineCompany(lineCompany);
		busLine.setLineStatus(lineStatus);
		int i = this.busLineService.updateBusLine(busLine);
		Map<String, String> map = new HashMap<String, String>();
		if (i == 1) {
			map.put("status", "200");
		} else {
			map.put("status", "500");
		}
		return map;
	}

	@RequestMapping("delete")
	@ResponseBody
	public Map<String, String> delete(@RequestParam("lineIds") Long[] lineIds) {
		Map<String, String> map = new HashMap<String, String>();
		int i = this.busLineService.deleteBus(lineIds);
		if (i == 1) {
			map.put("status", "200");
		} else {
			map.put("status", "500");
		}
		return map;
	}

	// 查询某条线路的所有站点
	@RequestMapping("querysingleline")
	@ResponseBody
	public List<BusStop> querySingleLine(
			@RequestParam("lineId") Integer lineId,
			@RequestParam(value = "shangxia", defaultValue = "0") Integer shangxia) {
		List<BusStop> bslist = this.busLineService.querySingleLine(lineId,
				shangxia);
		if (bslist != null) {
			return bslist;
		}
		return null;
	}

	// *******************************************************************************
	// **##(1.0)修改站点位置,传入的是一个站点的id，和上下移的状态，点击一次修改一次
	// **##(2.0)随意修改，点击保存的时候传入stopIds，这个是真实的站点顺序状态，这种方法更好，不用每次都保存
	// ** 在修改到自己满意的情况下之后再，入库
	// *******************************************************************************
	@RequestMapping("updateshangxia")
	@ResponseBody
	public Map<String, String> updateShangXia(
			@RequestParam(value = "stopIds") String stopId,
			@RequestParam(value = "lineId") Integer lineId) {
		Map<String, String> map = new HashMap<String, String>();
		String[] stopIds = stopId.split(",");
		int counter = 1;
		for (int i = 0; i < stopIds.length; i++) {
			int stopId1 = Integer.parseInt(stopIds[i]);
			int j = this.busLineService.updateStopQueue(stopId1, lineId,
					counter);
			if (j == 0) {
				map.put("status", "500");
				return map;
			}
			counter++;
		}
		map.put("status", "200");
		return map;
	}

	@RequestMapping("deletestop")
	@ResponseBody
	public Map<String, String> deletelinestop(
			@RequestParam("stopIds") Long[] stopIds,
			@RequestParam("lineId") Integer lineId) {
		Map<String, String> map = new HashMap<String, String>();
		int i = this.busLineService.deleteLineStop(stopIds, lineId);
		System.out.println("controller**************************" + i);
		if (i > 0) {
			map.put("status", "200");
		} else {
			map.put("status", "500");
		}
		return map;
	}


	// 导出
	@RequestMapping(value = "/export/lineexcel")
	public ModelAndView export(
			@RequestParam(value = "page", defaultValue = "1") int total,
			@RequestParam(value = "rows", defaultValue = "2") int rows,
			@RequestParam(value = "lineName", required = false) String lineName,
			@RequestParam(value = "companyName", required = false) String companyName) {
		EasyUi allline = this.busLineService.queryAll(total, rows, lineName, companyName);

		List<BusLine> linelist = (List<BusLine>) allline.getRows();
		ModelAndView mv = new ModelAndView();
		mv.addObject("linelist", linelist);
		mv.setViewName("BusLineExcelView");
		return mv;
	}
	
	//根据线路id查询对应的车队id，更新车队里面的车辆
	@RequestMapping("updateBus")
	@ResponseBody
	public Map<String , String> updateBus(
			@RequestParam("busIds")Long[] busIds,
			@RequestParam("lineId")Integer lineId){
		Map<String , String> map = new HashMap<String , String>();
		int busTeam = this.busLineService.queryTeamIdBylineId(lineId);
		int i = this.busLineService.updateBus(busIds, busTeam);
		if(i > 0){
			map.put("status", "200");
		}else{
			map.put("status", "500");
		}
		return map;
	}
}
