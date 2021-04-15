package com.hr.pojo;


/**
 * 区县实体类
 *下午5:16:20
 *Administrator 
 * @author lvbing
 * @date 下午5:16:20
 */
public class HatArea {
	private int id;
	private String areaID;//区县id
	private String area;//区县名称
	private String father;//市级的idcityID
	private HatCity city;//所属市
	
	public HatCity getCity() {
		return city;
	}
	public void setCity(HatCity city) {
		this.city = city;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAreaID() {
		return areaID;
	}
	public void setAreaID(String areaID) {
		this.areaID = areaID;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getFather() {
		return father;
	}
	public void setFather(String father) {
		this.father = father;
	}
	public HatArea(){
		
	}
	
	@Override
	public String toString() {
		return "HatArea [id=" + id + ", areaID=" + areaID + ", area=" + area
				+ ", father=" + father + ", city=" + city + "]";
	}
	
	
}
