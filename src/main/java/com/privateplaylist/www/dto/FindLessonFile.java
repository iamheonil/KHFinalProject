package com.privateplaylist.www.dto;

public class FindLessonFile {
	
	private int tchFileNo;
	private int lessonNo;
	private int userNo;
	private String tchFileOrg;
	private String tchFileRename;
	private String savePath;
	
	
	
	@Override
	public String toString() {
		return "FindLessonFile [tchFileNo=" + tchFileNo + ", lessonNo=" + lessonNo + ", userNo=" + userNo
				+ ", tchFileOrg=" + tchFileOrg + ", tchFileRename=" + tchFileRename + ", savePath=" + savePath + "]";
	}
	public int getTchFileNo() {
		return tchFileNo;
	}
	public void setTchFileNo(int tchFileNo) {
		this.tchFileNo = tchFileNo;
	}
	public int getLessonNo() {
		return lessonNo;
	}
	public void setLessonNo(int lessonNo) {
		this.lessonNo = lessonNo;
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
