package com.hr.pojo;

import java.sql.Date;


/**信息实体类
 *下午12:32:13
 *Administrator 
 * @author zjq
 * @date 下午12:32:13
 */
public class News {
	private int newsId;//信息id
	private String newsTitle;//信息题目
	private String newsAuthor;//信息作者
	private Date newsTime;//信息发布时间
	private String newsInfo;//信息具体信息
	private String newsPhoto;//图片路径
	private String newsAssortment;//信息所属板块(0失误招领  1交通新闻  2路况信息)
	private int newsStatus;//信息状态
	public int getNewsId() {
		return newsId;
	}
	public void setNewsId(int newsId) {
		this.newsId = newsId;
	}
	public String getNewsTitle() {
		return newsTitle;
	}
	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}
	public String getNewsAuthor() {
		return newsAuthor;
	}
	public void setNewsAuthor(String newsAuthor) {
		this.newsAuthor = newsAuthor;
	}
	public Date getNewsTime() {
		return newsTime;
	}
	public void setNewsTime(Date newsTime) {
		this.newsTime = newsTime;
	}
	public String getNewsInfo() {
		return newsInfo;
	}
	public void setNewsInfo(String newsInfo) {
		this.newsInfo = newsInfo;
	}
	public String getNewsPhoto() {
		return newsPhoto;
	}
	public void setNewsPhoto(String newsPhoto) {
		this.newsPhoto = newsPhoto;
	}
	public String getNewsAssortment() {
		return newsAssortment;
	}
	public void setNewsAssortment(String newsAssortment) {
		this.newsAssortment = newsAssortment;
	}	
	public int getNewsStatus() {
		return newsStatus;
	}
	public void setNewsStatus(int newsStatus) {
		this.newsStatus = newsStatus;
	}
	public News(){
			
	}
	public News(int newsId, String newsTitle, String newsAuthor, Date newsTime,
			String newsInfo, String newsPhoto, String newsAssortment,
			int newsStatus) {
		super();
		this.newsId = newsId;
		this.newsTitle = newsTitle;
		this.newsAuthor = newsAuthor;
		this.newsTime = newsTime;
		this.newsInfo = newsInfo;
		this.newsPhoto = newsPhoto;
		this.newsAssortment = newsAssortment;
		this.newsStatus = newsStatus;
	}
	
	
}
