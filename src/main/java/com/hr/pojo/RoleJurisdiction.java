package com.hr.pojo;
/**
 * 角色权限对应表
 * @author panqi
 *
 */
public class RoleJurisdiction {
	
	/*
	 `id` int(20) NOT NULL AUTO_INCREMENT,
  `r_id` int(20) DEFAULT NULL,
  `j_id` int(20) DEFAULT NULL,*/
	private int id;
	private int rId;//角色ID
	private int jId;//权限ID
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getrId() {
		return rId;
	}
	public void setrId(int rId) {
		this.rId = rId;
	}
	public int getjId() {
		return jId;
	}
	public void setjId(int jId) {
		this.jId = jId;
	}
	@Override
	public String toString() {
		return "RoleJurisdiction [id=" + id + ", rId=" + rId + ", jId=" + jId
				+ "]";
	}
	public RoleJurisdiction(int id, int rId, int jId) {
		super();
		this.id = id;
		this.rId = rId;
		this.jId = jId;
	}
	public RoleJurisdiction() {
		super();
	}
	
}
