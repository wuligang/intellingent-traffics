/**
 * 
 */
package com.hr.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hr.mapper.UserMapper;
import com.hr.pojo.User;
import com.hr.service.UserService;


/**
 *下午3:18:32
 *Administrator 
 * @author zjq
 * @date 下午3:18:32
 */
@Service(value="userService")
public class UserServiceImpl implements UserService{
	//注入userMapper
	@Autowired
	private UserMapper userMapper;
	@Override
	public User selectUser(String userName,String  password) {
		return this.userMapper.selectUser(userName, password);
	}
	
}
