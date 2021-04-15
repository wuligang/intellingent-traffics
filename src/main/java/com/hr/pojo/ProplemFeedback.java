package com.hr.pojo;

import java.sql.Date;


/**问题反馈信息实体类
 *下午12:43:18
 *Administrator 
 * @author zjq
 * @date 下午12:43:18
 */
public class ProplemFeedback {
	private int feedbackId;//反馈问题Id
	private String feedbackInfo;//反馈具体信息
	private Date feedbackTime;//反馈时间
	private int feedbackAuthor;//反馈信息的作者(用户id)
	private int feedbackProplem;//反馈所属问题
	public int getFeedbackId() {
		return feedbackId;
	}
	public void setFeedbackId(int feedbackId) {
		this.feedbackId = feedbackId;
	}
	public String getFeedbackInfo() {
		return feedbackInfo;
	}
	public void setFeedbackInfo(String feedbackInfo) {
		this.feedbackInfo = feedbackInfo;
	}
	public Date getFeedbackTime() {
		return feedbackTime;
	}
	public void setFeedbackTime(Date feedbackTime) {
		this.feedbackTime = feedbackTime;
	}
	public int getFeedbackAuthor() {
		return feedbackAuthor;
	}
	public void setFeedbackAuthor(int feedbackAuthor) {
		this.feedbackAuthor = feedbackAuthor;
	}
	public int getFeedbackProplem() {
		return feedbackProplem;
	}
	public void setFeedbackProplem(int feedbackProplem) {
		this.feedbackProplem = feedbackProplem;
	}
	public ProplemFeedback(int feedbackId, String feedbackInfo,
			Date feedbackTime, int feedbackAuthor, int feedbackProplem) {
		super();
		this.feedbackId = feedbackId;
		this.feedbackInfo = feedbackInfo;
		this.feedbackTime = feedbackTime;
		this.feedbackAuthor = feedbackAuthor;
		this.feedbackProplem = feedbackProplem;
	}
	public ProplemFeedback(){
		
	}
	@Override
	public String toString() {
		return "ProplemFeedback [feedbackId=" + feedbackId + ", feedbackInfo="
				+ feedbackInfo + ", feedbackTime=" + feedbackTime
				+ ", feedbackAuthor=" + feedbackAuthor + ", feedbackProplem="
				+ feedbackProplem + "]";
	}
	
}
