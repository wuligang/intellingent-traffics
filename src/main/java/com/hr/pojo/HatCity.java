package com.hr.pojo;


/** 市实体类
 *下午5:21:25
 *Administrator 
 * @author zjq
 * @date 下午5:21:25
 */
public class HatCity {
	private int id;
	private String cityID;//城市id
	private String city;//城市名称
	private String father;//城市所属省份的id
	private HatProvince province;//所属省份
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCityID() {
		return cityID;
	}
	public void setCityID(String cityID) {
		this.cityID = cityID;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getFather() {
		return father;
	}
	public void setFather(String father) {
		this.father = father;
	}
	
	
	public HatProvince getProvince() {
		return province;
	}
	public void setProvince(HatProvince province) {
		this.province = province;
	}
	
	@Override
	public String toString() {
		return "HatCity [id=" + id + ", cityID=" + cityID + ", city=" + city
				+ ", father=" + father + ", province=" + province + "]";
	}
	
	
}
