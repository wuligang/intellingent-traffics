package com.hr.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hr.pojo.Role;

/**
 * 用户和角对应
 * @author panqi
 *
 */
@Repository(value="userRoleMapper")
public interface UserRoleMapper {
	
	//根据uID查询rId
	public int rueryRID(int uId);
	
	//根据角色的RID查询到角色的对象
	public Role queryRole(int rId);
	
	//返回角色对象的集合
	public List<Role> queryAllRole();
}
