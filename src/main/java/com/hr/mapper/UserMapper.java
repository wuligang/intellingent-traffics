package com.hr.mapper;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hr.pojo.User;

/**
 * mapper接口类
*下午3:13:25
*Administrator 
* @author zjq
* @date 下午3:13:25
 */
@Repository("userMapper")
public interface UserMapper {
	//查询用户名和密码进行登录
	public User selectUser(@Param("userName")String userName,@Param("password")String password);
}
