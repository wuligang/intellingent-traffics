package com.hr.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.hr.pojo.BusLine;
import com.hr.pojo.BusStop;

/**
 * 线路管理接口
 * @author Administrator
 *
 */
@Repository(value="busLineMapper")
public interface BusLineMapper {
	
	//查询
	public List<BusLine> queryAll(
			@Param("lineName")String lineName , 
			@Param("companyName")String companyName);
	
	//插入
	public int insertBusLine(BusLine busLine);
	
	//更新
	public int updateBusLine(BusLine busLine);
	
	// 删除
	public int deleteBusLine(@Param("lineIds")Long[] lineIds);
	
	//查询某条线路的所有站点
	public List<BusStop> querySingleLine(
			@Param("lineId")Integer lineId , 
			@Param("shangxia")Integer shangxia);
	
	//修改站点在线路中的顺序,计数器,公交线的id
	public int updateStopQueue(
			@Param("stopId")Integer stopId,
			@Param("counter")Integer counter,
			@Param("lineId")Integer lineId);
	
	//删除线路中的某一站点
	public int deleteLineStop(
			@Param("stopIds")Long[] stopIds ,
			@Param("lineId")Integer lineId);
	
	//修改车队里面的车辆，并保存
	public int updateBus(
			@Param("busIds")Long[] busIds ,
			@Param("busTeam")Integer busTeam);
	
	//根据线路id查询对应的车队id
	public int queryTeamIdBylineId(Integer lineId);
	
}
