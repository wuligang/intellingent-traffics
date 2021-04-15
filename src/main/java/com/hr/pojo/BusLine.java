package com.hr.pojo;

public class BusLine {
	private int lineId;//绾胯矾id
	private String lineName;//绾胯矾鍚嶇О
	private int lineStatus;//绾胯矾鐘舵�1:鍙互浣跨敤 0:涓嶈兘浣跨敤
	private int lineCompany;//鎵�睘鍏徃
	private BusCompany busCompany;//鎵�睘鍏徃瀵硅薄
	public int getLineId() {
		return lineId;
	}
	public void setLineId(int lineId) {
		this.lineId = lineId;
	}
	public String getLineName() {
		return lineName;
	}
	public void setLineName(String lineName) {
		this.lineName = lineName;
	}
	public int getLineStatus() {
		return lineStatus;
	}
	public void setLineStatus(int lineStatus) {
		this.lineStatus = lineStatus;
	}	
	public int getLineCompany() {
		return lineCompany;
	}
	public void setLineCompany(int lineCompany) {
		this.lineCompany = lineCompany;
	}
	public BusLine(int lineId, String lineName, int lineStatus, int lineCompany) {
		super();
		this.lineId = lineId;
		this.lineName = lineName;
		this.lineStatus = lineStatus;
		this.lineCompany = lineCompany;
	}
	public BusLine(){
		
	}
	public BusCompany getBusCompany() {
		return busCompany;
	}
	public void setBusCompany(BusCompany busCompany) {
		this.busCompany = busCompany;
	}
	@Override
	public String toString() {
		return "BusLine [lineId=" + lineId + ", lineName=" + lineName
				+ ", lineStatus=" + lineStatus + ", lineCompany=" + lineCompany
				+ ", busCompany=" + busCompany + "]";
	}
	
		
}