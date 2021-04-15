package com.hr.pojo;


/**公交车
 *上午11:44:20
 *Administrator 
 * @author 吕冰
 * @date 上午11:44:20
 */
public class Bus {
	private int busId;//公交车
	private int busTeam;//公交车所属大队
	private int busDriver;//公交车司机
	private String busNumber;//公交车牌
	private int busStatus;//车辆状态(0不可用  1可用)
	private BusDriver busDrivers;//汽车司机
	private BusTeam busTeams;//汽车所属大队	
	public BusTeam getBusTeams() {
		return busTeams;
	}
	public void setBusTeams(BusTeam busTeams) {
		this.busTeams = busTeams;
	}	
	public int getBusId() {
		return busId;
	}
	public void setBusId(int busId) {
		this.busId = busId;
	}
	public int getBusTeam() {
		return busTeam;
	}
	public void setBusTeam(int busTeam) {
		this.busTeam = busTeam;
	}
	public int getBusDriver() {
		return busDriver;
	}
	public void setBusDriver(int busDriver) {
		this.busDriver = busDriver;
	}
	public String getBusNumber() {
		return busNumber;
	}
	public void setBusNumber(String busNumber) {
		this.busNumber = busNumber;
	}
	public int getBusStatus() {
		return busStatus;
	}
	public void setBusStatus(int busStatus) {
		this.busStatus = busStatus;
	}
	public BusDriver getBusDrivers() {
		return busDrivers;
	}
	public void setBusDrivers(BusDriver busDrivers) {
		this.busDrivers = busDrivers;
	}
	public Bus(){
		
	}
	@Override
	public String toString() {
		return "Bus [busId=" + busId + ", busTeam=" + busTeam + ", busDriver="
				+ busDriver + ", busNumber=" + busNumber + ", busStatus="
				+ busStatus + ", busDrivers=" + busDrivers + ", busTeams="
				+ busTeams + "]";
	}
}
