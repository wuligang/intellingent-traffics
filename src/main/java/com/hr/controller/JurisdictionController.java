package com.hr.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hr.pojo.Role;
import com.hr.pojo.User;
import com.hr.service.UserRoleService;

/**
 * 权限控制
 * @author panqi
 *
 */

@Controller
@RequestMapping(value="jsdc")
public class JurisdictionController {
	
	@Autowired
	private UserRoleService userRoleService;
	
	//返回角色集合
	@RequestMapping(value="fan")
	@ResponseBody
	public List<Role> queryRole(HttpServletRequest request){		
		User user = (User)request.getSession().getAttribute("pojoUser");
		int uId = user.getUserId();
		if(user.getUserId()==1){
			List<Role> queryAllRole = this.userRoleService.queryAllRole();
			return queryAllRole;
		}else{
			Role role = this.userRoleService.queryRole(uId);
			List<Role> roles = new ArrayList<Role>();
			roles.add(role);
			return roles;
		}		
	}
	
}
