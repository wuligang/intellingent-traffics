package com.hr.pojo;
/**
 * 用户角色对应表
 * @author Administrator
 *
 */
public class UserRole {

	/*
	`id` int(20) NOT NULL,
  `u_id` int(20) DEFAULT NULL,
  `r_id` int(20) DEFAULT NULL,*/
	private int id;
	private int uId;//用户ID
	private int rId;//角色ID
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getuId() {
		return uId;
	}
	public void setuId(int uId) {
		this.uId = uId;
	}
	public int getrId() {
		return rId;
	}
	public void setrId(int rId) {
		this.rId = rId;
	}
	@Override
	public String toString() {
		return "UserRole [id=" + id + ", uId=" + uId + ", rId=" + rId + "]";
	}
	public UserRole(int id, int uId, int rId) {
		super();
		this.id = id;
		this.uId = uId;
		this.rId = rId;
	}
	public UserRole() {
		super();
	}
	
}
