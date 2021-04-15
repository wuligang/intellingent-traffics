package com.hr.pojo;


/**省实体类
 *下午5:35:24
 *Administrator 
 * @author zjq
 * @date 下午5:35:24
 */
public class HatProvince {
	private int id;//省id
	private String provinceID;//省份id
	private String province;//省份id名称
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProvinceID() {
		return provinceID;
	}
	public void setProvinceID(String provinceID) {
		this.provinceID = provinceID;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	@Override
	public String toString() {
		return "HatProvince [id=" + id + ", provinceID=" + provinceID
				+ ", province=" + province + "]";
	}
	
	public HatProvince(){
		
	}
}
