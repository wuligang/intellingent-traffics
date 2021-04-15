package com.hr.service;

import java.util.List;
import java.util.Map;

import com.hr.pojo.BusLine;
import com.hr.pojo.BusStop;
import com.hr.util.EasyUi;


public interface BusLineService {
	
	//查询分页
	public EasyUi queryAll(int pageNum, int pageSize, String lineName,String companyName);
	
	//插入busline
	public int insertbusline(BusLine busLine);
	
	//更新
	public int updateBusLine(BusLine busLine);
	
	// 删除汽车信息
	public int deleteBus(Long[] lineIds);
	
	//查询某条线路的所有站点
	public List<BusStop> querySingleLine(Integer lineId  , Integer shangxia);
	
	//修改站点在线路中的顺序,计数器,公交线的id
	public int updateStopQueue(Integer stopId,Integer lineId,Integer counter);
	
	//删除某条线路中的某一站点
	public int deleteLineStop(Long[] stopIds , Integer lineId);
	
	//给某条线路增加车辆
	public int updateBus(Long[] stopIds , Integer busTeam);
	
	//根据线路id查询对应的车队id
	public int queryTeamIdBylineId(Integer lineId);
}
