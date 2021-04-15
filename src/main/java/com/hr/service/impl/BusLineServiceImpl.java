package com.hr.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hr.mapper.BusLineMapper;
import com.hr.pojo.BusLine;
import com.hr.pojo.BusStop;
import com.hr.service.BusLineService;
import com.hr.util.EasyUi;

@Service(value="busLineService")
public class BusLineServiceImpl implements BusLineService {
	
	@Autowired
	private BusLineMapper busLineMapper;
	//查询跟搜索的方法
	@Override
	public EasyUi queryAll(int pageNum, int pageSize, String lineName,String companyName) {
		EasyUi easyUi = new EasyUi();

		PageHelper.startPage(pageNum, pageSize);
		List<BusLine> busline = this.busLineMapper.queryAll(lineName,companyName);
		
		PageInfo<BusLine> pageInfo = new PageInfo<>(busline);
		easyUi.setTotal(pageInfo.getTotal());
		easyUi.setRows(pageInfo.getList());
		return easyUi;
	}
	
	//插入方法
	@Override
	public int insertbusline(BusLine busLine) {		
		return this.busLineMapper.insertBusLine(busLine);
	}

	//更新
	@Override
	public int updateBusLine(BusLine busLine) {
		return this.busLineMapper.updateBusLine(busLine);
	}
	
	//删除
	@Override
	public int deleteBus(Long[] lineIds) {
		return this.busLineMapper.deleteBusLine(lineIds);
	}
	
	//查询某条线路的所有站点
	@Override
	public List<BusStop> querySingleLine(Integer lineId , Integer shangxia) {
		return this.busLineMapper.querySingleLine(lineId, shangxia);
	}
	
	//修改站点在线路中的顺序,计数器,公交线的id
	@Override
	public int updateStopQueue(Integer stopId, Integer lineId, Integer counter) {
		return this.busLineMapper.updateStopQueue(stopId, counter, lineId);
	}

	@Override
	public int deleteLineStop(Long[] stopIds, Integer lineId) {
		int i = this.busLineMapper.deleteLineStop(stopIds, lineId);
		return i;
	}

	@Override
	public int updateBus(Long[] busIds, Integer busTeam) {
		return this.busLineMapper.updateBus(busIds, busTeam);
	}
	
	//根据线路id查询对应的车队id
	@Override
	public int queryTeamIdBylineId(Integer lineId) {
		return this.busLineMapper.queryTeamIdBylineId(lineId);
	}

	
	
	
	
}
