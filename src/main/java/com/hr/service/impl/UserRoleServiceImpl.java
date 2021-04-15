package com.hr.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hr.mapper.UserRoleMapper;
import com.hr.pojo.Role;
import com.hr.service.UserRoleService;

@Service(value="userRoleService")
public class UserRoleServiceImpl implements UserRoleService {
	
	@Autowired
	private UserRoleMapper userRoleMapper;
	
	@Override
	public Role queryRole(int uId) {
		int rId = userRoleMapper.rueryRID(uId);
		return this.userRoleMapper.queryRole(rId);
	}
	
	//查询所有的角色
	@Override
	public List<Role> queryAllRole() {
		return this.userRoleMapper.queryAllRole();
	}

}
