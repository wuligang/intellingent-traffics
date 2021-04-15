package com.hr.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hr.mapper.BusTeamMapper;
import com.hr.pojo.Bus;
import com.hr.pojo.BusLine;
import com.hr.pojo.BusTeam;
import com.hr.pojo.Export;
import com.hr.service.BusTeamService;
import com.hr.util.EasyUi;
/**
 * 汽车大队服务层实现类
 * @author Administrator
 *
 */
@Service("busTeamService")
public class BusTeamServiceImpl implements BusTeamService {
	
	@Autowired
	private BusTeamMapper busTeamMapper;
	
	// 根据公司id查询有哪些大队
	@Override
	public List<BusTeam> getTeamByCompanyId(int companyId) {
		return this.busTeamMapper.quaryTeamByCompanyId(companyId);
	}

	// 根据大队名称查询大队id
	@Override
	public Integer getTeamIdByName(String teamName) {
		BusTeam busTeam = this.busTeamMapper.quaryTeamByName(teamName);
		return busTeam.getTeamId();
	}

	//根据公司id查线路名
	@Override
	public List<BusLine> getbusline(Integer companyId) {
		return this.busTeamMapper.quarybusline(companyId);
	}

	//插入新车队
	@Override
	public Integer userAdd(String teamName, Integer companyName, Integer lineName) {
		return this.busTeamMapper.quarybusadd(teamName,companyName,lineName);
	}

	//删除
	@Override
	public Integer teamdelete(List<Object> ids) {
		return this.busTeamMapper.quarydelete(ids);
	}

	//全查
	@Override
	public List<Export> select() {
		return this.busTeamMapper.quaryselect();
	}

	//修改
	@Override
	public Integer edit(String teamId, String teamName, Integer companyName) {
		return this.busTeamMapper.quarybusedit(teamId,teamName,companyName);
	}

	//查询非本车队车辆
	@Override
	public EasyUi getnoAllBus(Integer total, Integer rows,Map<String, Object> map) {
		EasyUi easyUi = new EasyUi();	
		PageHelper.startPage(total, rows);
		List<Bus> list = this.busTeamMapper.quarynoAllBus(map);		
		PageInfo<Bus> pageInfo = new PageInfo<Bus>(list);
		easyUi.setTotal(pageInfo.getTotal());
		easyUi.setRows(pageInfo.getList());		
		return easyUi;
	}

	//查询本车队车辆
	@Override
	public EasyUi getAllBus(Integer total, Integer rows,Map<String, Object> map) {
		EasyUi easyUi = new EasyUi();	
		PageHelper.startPage(total, rows);
		List<Bus> list = this.busTeamMapper.quaryAllBus(map);		
		PageInfo<Bus> pageInfo = new PageInfo<Bus>(list);
		easyUi.setTotal(pageInfo.getTotal());
		easyUi.setRows(pageInfo.getList());		
		return easyUi;
	}

	//搜索车队
	@Override
	public List<BusTeam> getserach(String serach1, String serach2) {
		return this.busTeamMapper.quaryserach(serach1,serach2);
	}

	//添加车辆
	@Override
	public Integer teamupdata(List<Object> ids, Integer teamId) {
		return this.busTeamMapper.quaryupdata(ids,teamId);
	}

	//移除车辆
	@Override
	public Integer teamupdatato(List<Object> ids) {
		return this.busTeamMapper.quaryupdatato(ids);
	}
}
