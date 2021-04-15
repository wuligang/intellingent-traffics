package com.hr.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.hr.pojo.BusStop;


/**
 * 站点管理接口
 *上午11:12:54
 *Administrator 
 * @author lvbing
 * @date 上午11:12:54
 */
@Repository("busSiteMapper")
public interface BusSiteMapper {
	//查询所有的站点
	public List<BusStop> selectAllBusStop(@Param("stopName")String stopName);
	//插入站点
	public int addBusStop(BusStop busStop);
	//修改站点
	public int updateBusStop(BusStop busStop);
	//删除站点
	public int delBusStop(Integer stopId);
	//搜索站点的信息
	public List<BusStop> selectLike();
	//根据id查询
	public BusStop selectByPrimaryKey(@Param("stopId")Integer stopId);

}
