/**
 * 
 */
package com.hr.service;

import com.hr.pojo.User;



/**
 *下午3:17:21
 *Administrator 
 * @author zjq
 * @date 下午3:17:21
 */
public interface UserService {
	//登录验证
	public User selectUser(String userName,String  password);
}
