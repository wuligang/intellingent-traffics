package com.hr.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.hr.pojo.Bus;

/**
 * 汽车管理接口
 * 
 * @author Administrator
 * 
 */
@Repository("busMapper")
public interface BusMapper {

	// 查询所有汽车的信息
	public List<Bus> quaryAllBus(@Param("busNumber") String busNumber,@Param("driverName")String driverName);

	// 新增汽车信息
	public int insertBus(Bus bus);

	// 删除
	public int deleteBus(@Param("busIds")Long[] busIds);

	// 根据车主姓名模糊查询--无用
	public Bus quaryByDriverName(@Param("namelike") String namelike,
			@Param("numberlike") String numberlike);
	
	// 更新车辆信息
	public int updateBus(Bus bus);
	
	// 根据汽车id查询该汽车司机
	public Bus quaryDriverIdByBusId(int busId);
	
}
