package com.hr.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("to")
public class TongYong {
	
	//通用跳转
		@RequestMapping("{name}")
		public String test(@PathVariable("name")String name){
			return name;
		}
}
