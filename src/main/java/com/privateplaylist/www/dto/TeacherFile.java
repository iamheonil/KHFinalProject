package com.privateplaylist.www.dto;

public class TeacherFile {
	private int tchFileNo;
	private int userNo;
	private String tchFileOrg;
	private String tchFilerename;
	
	@Override
	public String toString() {
		return "TeacherFile [tchFileNo=" + tchFileNo + ", userNo=" + userNo + ", tchFileOrg=" + tchFileOrg
				+ ", tchFilerename=" + tchFilerename + "]";
	}
	
	public int getTchFileNo() {
		return tchFileNo;
	}
	public void setTchFileNo(int tchFileNo) {
		this.tchFileNo = tchFileNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getTchFileOrg() {
		return tchFileOrg;
	}
	public void setTchFileOrg(String tchFileOrg) {
		this.tchFileOrg = tchFileOrg;
	}
	public String getTchFilerename() {
		return tchFilerename;
	}
	public void setTchFilerename(String tchFilerename) {
		this.tchFilerename = tchFilerename;
	}
	
}
