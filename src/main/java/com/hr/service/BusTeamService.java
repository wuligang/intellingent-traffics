package com.hr.service;

import java.util.List;
import java.util.Map;

import com.hr.pojo.Bus;
import com.hr.pojo.BusLine;
import com.hr.pojo.BusTeam;
import com.hr.pojo.Export;
import com.hr.util.EasyUi;

/**
 * 汽车大队服务层
 * 
 * @author Administrator
 * 
 */
public interface BusTeamService {

	// 根据公司id查询有哪些大队
	public List<BusTeam> getTeamByCompanyId(int companyId);

	// 根据大队名称查询大队id
	public Integer getTeamIdByName(String teamName);

	//根据id查线路信息
	public List<BusLine> getbusline(Integer companyId);

	//插入新车队
	public Integer userAdd(String teamName, Integer companyName, Integer lineName);

	//删除
	public Integer teamdelete(List<Object> ids);

	//全查
	public List<Export> select();

	//修改
	public Integer edit(String teamId, String teamName, Integer companyName);

	//查询非本车队车辆
	public EasyUi getnoAllBus(Integer total, Integer rows,Map<String, Object> map);

	//查询本车队车辆
	public EasyUi getAllBus(Integer total, Integer rows,Map<String, Object> map);

	//搜索车队
	public List<BusTeam> getserach(String serach1, String serach2);

	//添加车辆
	public Integer teamupdata(List<Object> ids, Integer teamId);
	
	//移除车辆
	public Integer teamupdatato(List<Object> ids);
}
