package com.hr.pojo;

import java.sql.Date;

/**
 * 问题信息实体类 下午12:37:56 Administrator
 * 
 * @author zjq
 * @date 下午12:37:56
 */
public class Proplem {
	private int proplemId;//问题id
	private String proplemTitle;//问题名称
	private String proplemInfo;//问题详解
	private int proplemAuthor;//问题提问者(用户id)
	private Date proplemTime;//问题提问时间
	private int proplemStatus;//问题状态(0未解决 1已解决)
	private int proplemAuditing;//问题是否审核(0未审核  1已审核)
	public int getProplemId() {
		return proplemId;
	}
	public void setProplemId(int proplemId) {
		this.proplemId = proplemId;
	}
	public String getProplemTitle() {
		return proplemTitle;
	}
	public void setProplemTitle(String proplemTitle) {
		this.proplemTitle = proplemTitle;
	}
	public String getProplemInfo() {
		return proplemInfo;
	}
	public void setProplemInfo(String proplemInfo) {
		this.proplemInfo = proplemInfo;
	}
	public int getProplemAuthor() {
		return proplemAuthor;
	}
	public void setProplemAuthor(int proplemAuthor) {
		this.proplemAuthor = proplemAuthor;
	}
	public Date getProplemTime() {
		return proplemTime;
	}
	public void setProplemTime(Date proplemTime) {
		this.proplemTime = proplemTime;
	}
	public int getProplemStatus() {
		return proplemStatus;
	}
	public void setProplemStatus(int proplemStatus) {
		this.proplemStatus = proplemStatus;
	}
	
	
	@Override
	public String toString() {
		return "Proplem [proplemId=" + proplemId + ", proplemTitle="
				+ proplemTitle + ", proplemInfo=" + proplemInfo
				+ ", proplemAuthor=" + proplemAuthor + ", proplemTime="
				+ proplemTime + ", proplemStatus=" + proplemStatus
				+ ", proplemAuditing=" + proplemAuditing + "]";
	}
}
