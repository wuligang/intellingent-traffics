package com.hr.pojo;

import java.io.Serializable;
import java.util.List;

/**
 * 角色类   对应一个或多个用户
 * @author Administrator
 *
 */
public class Role implements Serializable{
	
	private int rId;//角色id
	private String rName;//角色名称
	private String rNote;//角色注释
	private List<Jurisdiction> jurisdictions;//权限的集合放在角色类里面
	public int getrId() {
		return rId;
	}
	public void setrId(int rId) {
		this.rId = rId;
	}
	public String getrName() {
		return rName;
	}
	public void setrName(String rName) {
		this.rName = rName;
	}
	public String getrNote() {
		return rNote;
	}
	public void setrNote(String rNote) {
		this.rNote = rNote;
	}
	
	public List<Jurisdiction> getJurisdictions() {
		return jurisdictions;
	}
	public void setJurisdictions(List<Jurisdiction> jurisdictions) {
		this.jurisdictions = jurisdictions;
	}
	
	@Override
	public String toString() {
		return "Role [rId=" + rId + ", rName=" + rName + ", rNote=" + rNote
				+ ", jurisdictions=" + jurisdictions + "]";
	}
	public Role() {
		super();
	}
	public Role(int rId, String rName, String rNote,
			List<Jurisdiction> jurisdictions) {
		super();
		this.rId = rId;
		this.rName = rName;
		this.rNote = rNote;
		this.jurisdictions = jurisdictions;
	}
	
	
}
