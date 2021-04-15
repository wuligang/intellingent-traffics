package com.hr.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hr.pojo.BusStop;
import com.hr.pojo.HatArea;
import com.hr.service.BusSiteService;
import com.hr.util.EasyUi;


/**
 *上午11:36:08
 *Administrator 
 * @author lvbing
 * @date 上午11:36:08
 */
@Controller("busSiteController")
@RequestMapping(value="BusSite")
public class BusSiteController {
	@Autowired
	private BusSiteService busSiteService;
	//查询所有
	@RequestMapping(value="allBusStop")
	@ResponseBody
	public EasyUi selectAllBusStop(
			@RequestParam(value = "page", defaultValue = "1") int total,
			@RequestParam(value = "rows", defaultValue = "5") int rows,
			@RequestParam(value="stopName",required=false)String stopName
			){
		EasyUi allBusStop = this.busSiteService.selectAllBusStop(total, rows,stopName);
		return allBusStop;
	}
	//导出
	@RequestMapping(value="exportBusStop")
	public ModelAndView exportBusStop(
			@RequestParam(value = "page", defaultValue = "1") int total,
			@RequestParam(value = "rows", defaultValue = "5") int rows,
			@RequestParam(value="stopName",required=false)String stopName
			){
		ModelAndView mv = new ModelAndView();
		EasyUi easyUi =  this.busSiteService.selectAllBusStop(total, rows,stopName);
		List<BusStop> busStops = (List<BusStop>)easyUi.getRows();
		mv.addObject("busStops", busStops);
		mv.setViewName("BusShopExcelView");
		System.out.println(mv);
		return mv;
	}
	//添加
	@RequestMapping(value="addBusStop")
	@ResponseBody
	public Map<String, String> addBusStop(
			@RequestParam("stopName") String stopName,
			@RequestParam("stopArea") String stopArea,
			@RequestParam("stopInfo") String stopInfo,
			@RequestParam("stopStatus") Integer stopStatus
			){
		
		BusStop busStop = new BusStop();
		busStop.setStopName(stopName);
		busStop.setStopArea(stopArea);
		busStop.setStopInfo(stopInfo);
		busStop.setStopStatus(stopStatus);
		
		int i = this.busSiteService.addBusStop(busStop);
		Map<String, String> map = new HashMap<String, String>();
		if (i == 1) {
			map.put("status", "200");
		} else {
			map.put("status", "500");
		}
		return map;
	}
	//修改
	@RequestMapping(value="updateBusStop")
	@ResponseBody
	public Map<String, String> updateBusStop(
			@RequestParam("stopId") int stopId,
			@RequestParam("stopName") String stopName,
			@RequestParam("aArea") String stopArea,
			@RequestParam("stopStatus") Integer stopStatus
			){
		BusStop busStop = new BusStop();
		busStop.setStopId(stopId);
		busStop.setStopName(stopName);
		busStop.setStopArea(stopArea);
		busStop.setStopStatus(stopStatus);
		
		int i = this.busSiteService.updateBusStop(busStop);
		Map<String, String> map = new HashMap<String, String>();
		if (i == 1) {
			map.put("status", "200");
		} else {
			map.put("status", "500");
		}
		return map;
	}
	//删除
	@RequestMapping(value="delBusStop")
	@ResponseBody
	public Map<String, String> delBusStop(@RequestParam("stopId") int stopId){
		int i = this.busSiteService.delBusStop(stopId);
		Map<String, String> map = new HashMap<String, String>();
		if (i == 1) {
			map.put("status", "200");
		} else {
			map.put("status", "500");
		}
		return map;
	}
	//导入execl
	@ResponseBody  
    @RequestMapping(value="ajaxUpload",method={RequestMethod.GET,RequestMethod.POST})  
    public String ajaxUploadExcel(HttpServletRequest request,HttpServletResponse response) throws Exception { 
        return busSiteService.ajaxUploadExcel(request, response);
    }
}
