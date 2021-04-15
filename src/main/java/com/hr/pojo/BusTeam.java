package com.hr.pojo;


/**大队实体信息类
 *下午12:09:05
 *Administrator 
 * @author zjq
 * @date 下午12:09:05
 */
public class BusTeam {
	private int teamId;//大队id
	private String teamName;//大队名称
	private int teamCompany;//大队所属公司
	private BusCompany busCompanys;//大队所属公司实体类
	private int teamLine;//大队线
	public int getTeamId() {
		return teamId;
	}
	public void setTeamId(int teamId) {
		this.teamId = teamId;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	
	public BusCompany getBusCompanys() {
		return busCompanys;
	}
	public void setBusCompanys(BusCompany busCompanys) {
		this.busCompanys = busCompanys;
	}
	public BusTeam(){
		
	}
	public int getTeamCompany() {
		return teamCompany;
	}
	public void setTeamCompany(int teamCompany) {
		this.teamCompany = teamCompany;
	}
	public int getTeamLine() {
		return teamLine;
	}
	public void setTeamLine(int teamLine) {
		this.teamLine = teamLine;
	}
	@Override
	public String toString() {
		return "BusTeam [teamId=" + teamId + ", teamName=" + teamName
				+ ", teamCompany=" + teamCompany + ", busCompanys="
				+ busCompanys + ", teamLine=" + teamLine + "]";
	}
}
