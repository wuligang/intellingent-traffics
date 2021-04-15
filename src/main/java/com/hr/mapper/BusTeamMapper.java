package com.hr.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.hr.pojo.Bus;
import com.hr.pojo.BusLine;
import com.hr.pojo.BusTeam;
import com.hr.pojo.Export;
import com.hr.util.EasyUi;

/**
 * 汽车大队接口
 * 
 * @author Administrator
 * 
 */
@Repository("busTeamMapper")
public interface BusTeamMapper {

	// 根据公司id查询有哪些大队
	public List<BusTeam> quaryTeamByCompanyId(@Param("companyId") int companyId);

	// 根据大队名称查询大队
	public BusTeam quaryTeamByName(@Param("teamName") String teamName);

	//根据公司id查线路名
	public List<BusLine> quarybusline(Integer companyId);

	//插入新车队
	public Integer quarybusadd(@Param("teamName")String teamName,@Param("companyName") Integer companyName,
			@Param("lineName") Integer lineName);

	//删除
	public Integer quarydelete(@Param("ids")List<Object> ids);

	//全查
	public List<Export> quaryselect();

	//修改
	public Integer quarybusedit(@Param("teamId")String teamId,@Param("teamName") String teamName,
			@Param("companyName")Integer companyName);

	//查询非本车队车辆
	public List<Bus> quarynoAllBus(Map<String, Object> map);

	//查询本车队车辆
	public List<Bus> quaryAllBus(Map<String, Object> map);

	//搜索车队
	public List<BusTeam> quaryserach(@Param("serach1") String serach1,@Param("serach2") String serach2);

	//添加车辆
	public Integer quaryupdata(@Param("ids")List<Object> ids,@Param("teamId")Integer teamId);

	//移除车辆
	public Integer quaryupdatato(@Param("ids")List<Object> ids);
}
