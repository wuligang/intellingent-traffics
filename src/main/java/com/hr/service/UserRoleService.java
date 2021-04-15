package com.hr.service;

import java.util.List;

import com.hr.pojo.Role;

/**
 * 用户对应角色 再对应权限
 * @author panqi
 *
 */
public interface UserRoleService {
	//根据用户uid得到role对象
	public Role queryRole(int uId);
	
	//查询所有role对象
	public List<Role> queryAllRole();
}
