package com.hr.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hr.pojo.BusStop;
import com.hr.util.EasyUi;

/**
 * 上午11:26:17 Administrator
 * 
 * @author lvbing
 * @date 上午11:26:17
 */
public interface BusSiteService {
	// 查询所有的站点
	public EasyUi selectAllBusStop(Integer pageNum, Integer pageSize,String stopName);

	// 插入站点
	public int addBusStop(BusStop busStop);

	// 修改站点信息
	public int updateBusStop(BusStop busStop);

	// 删除站点
	public int delBusStop(Integer stopId);
	
	//execl导入
	public String ajaxUploadExcel(HttpServletRequest request,HttpServletResponse response);
}
