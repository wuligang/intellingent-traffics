/**
 * 
 */
package com.hr.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hr.pojo.User;
import com.hr.service.UserService;


/**
 *下午3:36:44
 *Administrator 
 * @author zjq
 * @date 下午3:36:44
 */
@Controller
@RequestMapping(value="user")
public class UserController {
	
	@Autowired
	private UserService userService;
	/**
	 * 验证用户登录
	 *Administrator
	 *下午3:43:292018
	 *TODO
	 * @param userName
	 * @param password
	 * @return
	 */
	@RequestMapping(value="login")
	@ResponseBody
	public Map<String , String> selectUser(
			@RequestParam("name") String userName,
			@RequestParam("pwd") String password,HttpServletRequest request){
		User user = userService.selectUser(userName, password);
		Map<String , String> map = new HashMap<>();
		if(user != null){			
			request.getSession().setAttribute("nameasd" , userName);
			request.getSession().setAttribute("pojoUser", user);
			map.put("status", "200");
			return map;
		}else{
			map.put("status", "500");
			return map;
		}
	}
	
	
	
	
}
