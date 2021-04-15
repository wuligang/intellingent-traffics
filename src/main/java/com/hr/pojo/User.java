package com.hr.pojo;

/*
 * 用户信息表（普通用户和管理员）
 *上午11:00:04
 *Administrator 
 * @author 吕冰
 * @date 上午11:00:04
 */
public class User {
	private int userId;//用户Id
	private String userName;//用户名字
	private String password;//用户密码
	private int sex;//性别(0男  1女)
	private String user_phone;//user_phone
	private int power;//权限控制0:管理员  1:普通用户
	private String email;//用户邮箱
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public int getPower() {
		return power;
	}
	public void setPower(int power) {
		this.power = power;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public User(int userId, String userName, String password, int sex,
			String user_phone, int power, String email) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.password = password;
		this.sex = sex;
		this.user_phone = user_phone;
		this.power = power;
		this.email = email;
	}
	public User(){
		
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName
				+ ", password=" + password + ", sex=" + sex + ", user_phone="
				+ user_phone + ", power=" + power + ", email=" + email + "]";
	}
	
}
