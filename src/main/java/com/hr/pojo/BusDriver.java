package com.hr.pojo;


/**司机实体类
 *下午12:01:11
 *Administrator 
 * @author 吕冰
 * @date 下午12:01:11
 */
public class BusDriver {
	private int driverId;//司机id
	private String driverName;//司机姓名
	private String driverPhone;//司机电话
	private int driverStatus;//司机是否上班 0:不上班 1:上班
	private int driverTeam;//司机所属大队
	public int getDriverId() {
		return driverId;
	}
	public void setDriverId(int driverId) {
		this.driverId = driverId;
	}
	public String getDriverName() {
		return driverName;
	}
	public void setDriverName(String driverName) {
		this.driverName = driverName;
	}
	public String getDriverPhone() {
		return driverPhone;
	}
	public void setDriverPhone(String driverPhone) {
		this.driverPhone = driverPhone;
	}
	public int getDriverStatus() {
		return driverStatus;
	}
	public void setDriverStatus(int driverStatus) {
		this.driverStatus = driverStatus;
	}
	public int getDriverTeam() {
		return driverTeam;
	}
	public void setDriverTeam(int driverTeam) {
		this.driverTeam = driverTeam;
	}
	public BusDriver(){
		
	}
	@Override
	public String toString() {
		return "BusDriver [driverId=" + driverId + ", driverName=" + driverName
				+ ", driverPhone=" + driverPhone + ", driverStatus="
				+ driverStatus + ", driverTeam=" + driverTeam + "]";
	}
}
