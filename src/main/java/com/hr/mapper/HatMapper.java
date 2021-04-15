package com.hr.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hr.pojo.HatArea;
import com.hr.pojo.HatCity;
import com.hr.pojo.HatProvince;


/**省市县三级关联接口
 *下午2:03:36
 *Administrator 
 * @author lvbing
 * @date 下午2:03:36
 */
@Repository("hatMapper")
public interface HatMapper {
	//查询所有的省份
	public List<HatProvince> selectprovince();
	//根据省份id查询该省内所有的市
	public List<HatCity> selectcity(Integer provinceID);
	//根据城市id查询该城市内所有的区县
	public List<HatArea> selectarea(Integer cityID);
}
