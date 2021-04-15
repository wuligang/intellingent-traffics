package com.hr.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hr.mapper.HatMapper;
import com.hr.pojo.HatArea;
import com.hr.pojo.HatCity;
import com.hr.pojo.HatProvince;
import com.hr.service.HatService;


/**省市县三级关联实现类
 *下午2:15:25
 *Administrator 
 * @author zjq
 * @date 下午2:15:25
 */
@Service("hatService")
public class HatServiceImpl implements HatService{
	
	@Autowired
	private HatMapper hatMapper;

	/*查询所有的省份
	 */
	@Override
	public List<HatProvince> selectprovince() {
		List<HatProvince> list = this.hatMapper.selectprovince();
		return list;
	}

	/*根据省份id查询该省内所有的市
	 */
	@Override
	public List<HatCity> selectcity(Integer provinceID) {
		List<HatCity> list = this.hatMapper.selectcity(provinceID);
		return list;
	}
	/*根据城市id查询该城市内所有的区县
	 */
	@Override
	public List<HatArea> selectarea(Integer cityID) {
		List<HatArea> list = this.hatMapper.selectarea(cityID);
		return list;
	}

}
