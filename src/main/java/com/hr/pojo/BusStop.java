package com.hr.pojo;


/**站点信息表
 *上午11:11:14
 *Administrator 
 * @author 吕冰
 * @date 上午11:11:14
 */
public class BusStop {
	private int stopId;//站点id
	private String stopName;//站点名称
	private String stopAddress;//站点地址
	private String stopInfo;//站点信息
	private int stopStatus;//站点状态1:使用  0:使用
	private HatArea area;//所属区县
	private String stopArea;
	private StopLine stopLine;//线路站点第三方关联表
	
	public String getStopArea() {
		return stopArea;
	}
	public void setStopArea(String stopArea) {
		this.stopArea = stopArea;
	}
	public StopLine getStopLine() {
		return stopLine;
	}
	public void setStopLine(StopLine stopLine) {
		this.stopLine = stopLine;
	}
	public int getStopId() {
		return stopId;
	}
	public void setStopId(int stopId) {
		this.stopId = stopId;
	}
	public String getStopName() {
		return stopName;
	}
	public void setStopName(String stopName) {
		this.stopName = stopName;
	}
	public String getStopAddress() {
		return stopAddress;
	}
	public void setStopAddress(String stopAddress) {
		this.stopAddress = stopAddress;
	}
	public String getStopInfo() {
		return stopInfo;
	}
	public void setStopInfo(String stopInfo) {
		this.stopInfo = stopInfo;
	}
	public int getStopStatus() {
		return stopStatus;
	}
	public void setStopStatus(int stopStatus) {
		this.stopStatus = stopStatus;
	}
	public HatArea getArea() {
		return area;
	}
	public void setArea(HatArea area) {
		this.area = area;
	}
	@Override
	public String toString() {
		return "BusStop [stopId=" + stopId + ", stopName=" + stopName
				+ ", stopAddress=" + stopAddress + ", stopInfo=" + stopInfo
				+ ", stopStatus=" + stopStatus + ", area=" + area
				+ ", stopLine=" + stopLine + "]";
	}
	
}
