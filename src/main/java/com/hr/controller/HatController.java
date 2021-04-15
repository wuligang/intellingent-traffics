package com.hr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hr.pojo.HatArea;
import com.hr.pojo.HatCity;
import com.hr.pojo.HatProvince;
import com.hr.service.HatService;

/**
 * 省市县三级关联的控制层 下午2:20:06 Administrator
 * 
 * @author zjq
 * @date 下午2:20:06
 */
@Controller("hatController")
@RequestMapping(value = "hat")
public class HatController {
	@Autowired
	private HatService hatService;

	// 查询所有的省份
	@RequestMapping("selectprovince")
	@ResponseBody
	public List<HatProvince> selectprovince() {
		List<HatProvince> list = this.hatService.selectprovince();
		return list;
	}

	// 根据省份id查询该省内所有的市
	@RequestMapping("selectcity")
	@ResponseBody
	public List<HatCity> selectcity(
			@RequestParam(value = "provinceID") Integer provinceID) {
		List<HatCity> list = this.hatService.selectcity(provinceID);
		return list;
	}

	// 根据省份id查询该省内所有的市
	@RequestMapping("selectarea")
	@ResponseBody
	public List<HatArea> selectarea(
			@RequestParam(value = "cityID") Integer cityID) {
		List<HatArea> list = this.hatService.selectarea(cityID);
		return list;
	}
}
