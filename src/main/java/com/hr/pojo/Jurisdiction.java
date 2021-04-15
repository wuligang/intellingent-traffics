package com.hr.pojo;
/**
 * 权限表  角色对应权限
 * @author Administrator
 *
 */
public class Jurisdiction {
	
	/*
	`j_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '权限表',
  	`j_page` varchar(40) DEFAULT NULL COMMENT '权限表-包括权限id和页面',
  	`j_pid` int(20) DEFAULT NULL,*/
	private int jId;
	private String jPage;//可用的功能或页面
	private int jPid;//父级
	public int getjId() {
		return jId;
	}
	public void setjId(int jId) {
		this.jId = jId;
	}
	public String getjPage() {
		return jPage;
	}
	public void setjPage(String jPage) {
		this.jPage = jPage;
	}
	public int getjPid() {
		return jPid;
	}
	public void setjPid(int jPid) {
		this.jPid = jPid;
	}
	@Override
	public String toString() {
		return "Jurisdiction [jId=" + jId + ", jPage=" + jPage + ", jPid="
				+ jPid + "]";
	}
	public Jurisdiction(int jId, String jPage, int jPid) {
		super();
		this.jId = jId;
		this.jPage = jPage;
		this.jPid = jPid;
	}
	public Jurisdiction() {
		super();
	}
	
}
