package com.hr.pojo;

//站点线路关联三方表
public class StopLine {
	
	private int stopLineId;
	private int gLineId;
	private int gStopId;
	private int lineStopIndex;
	public StopLine() {
		super();
	}
	public StopLine(int stopLineId, int gLineId, int gStopId, int lineStopIndex) {
		super();
		this.stopLineId = stopLineId;
		this.gLineId = gLineId;
		this.gStopId = gStopId;
		this.lineStopIndex = lineStopIndex;
	}
	public int getStopLineId() {
		return stopLineId;
	}
	public void setStopLineId(int stopLineId) {
		this.stopLineId = stopLineId;
	}
	public int getgLineId() {
		return gLineId;
	}
	public void setgLineId(int gLineId) {
		this.gLineId = gLineId;
	}
	public int getgStopId() {
		return gStopId;
	}
	public void setgStopId(int gStopId) {
		this.gStopId = gStopId;
	}
	public int getLineStopIndex() {
		return lineStopIndex;
	}
	public void setLineStopIndex(int lineStopIndex) {
		this.lineStopIndex = lineStopIndex;
	}
	@Override
	public String toString() {
		return "StopLine [stopLineId=" + stopLineId + ", gLineId=" + gLineId
				+ ", gStopId=" + gStopId + ", lineStopIndex=" + lineStopIndex
				+ "]";
	}
	
	
}
