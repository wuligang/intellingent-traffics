package com.hr.pojo;


/**公交公司实体类
 *下午12:12:53
 *Administrator 
 * @author zjq
 * @date 下午12:12:53
 */
public class BusCompany {
	private int companyId;//公司id
	private String companyName;//公司名称
	private String companyAddress;//公司地址
	private int companyProvince;//公司所属的省份
	private String companyInfo;//公司介绍
	public int getCompanyId() {
		return companyId;
	}
	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getCompanyAddress() {
		return companyAddress;
	}
	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}
	public int getCompanyProvince() {
		return companyProvince;
	}
	public void setCompanyProvince(int companyProvince) {
		this.companyProvince = companyProvince;
	}
	public String getCompanyInfo() {
		return companyInfo;
	}
	public void setCompanyInfo(String companyInfo) {
		this.companyInfo = companyInfo;
	}
	public BusCompany(int companyId, String companyName, String companyAddress,
			int companyProvince, String companyInfo) {
		super();
		this.companyId = companyId;
		this.companyName = companyName;
		this.companyAddress = companyAddress;
		this.companyProvince = companyProvince;
		this.companyInfo = companyInfo;
	}
	public BusCompany(){
		
	}
	@Override
	public String toString() {
		return "BusCompany [companyId=" + companyId + ", companyName="
				+ companyName + ", companyAddress=" + companyAddress
				+ ", companyProvince=" + companyProvince + ", companyInfo="
				+ companyInfo + "]";
	}
	
}
