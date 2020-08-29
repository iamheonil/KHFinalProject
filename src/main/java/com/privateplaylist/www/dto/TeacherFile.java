package com.privateplaylist.www.dto;

public class TeacherFile {
	private int tchFileNo;
	private int userNo;
	private String userId;
	private String tchFileOrg;
	private String tchFileRename;
	private String savePath;
	
	@Override
	public String toString() {
		return "TeacherFile [tchFileNo=" + tchFileNo + ", userNo=" + userNo + ", userId=" + userId + ", tchFileOrg="
				+ tchFileOrg + ", tchFileRename=" + tchFileRename + ", savePath=" + savePath + "]";
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTchFileOrg() {
		return tchFileOrg;
	}
	public void setTchFileOrg(String tchFileOrg) {
		this.tchFileOrg = tchFileOrg;
	}
	public String getTchFileRename() {
		return tchFileRename;
	}
	public void setTchFileRename(String tchFileRename) {
		this.tchFileRename = tchFileRename;
	}
	public String getSavePath() {
		return savePath;
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	
	
	
	
	
	
}
