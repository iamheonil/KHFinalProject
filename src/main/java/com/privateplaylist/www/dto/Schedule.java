package com.privateplaylist.www.dto;

public class Schedule {
	
	private int schNo;
	private String schName;
	private String schContent;
	private String schStart;
	private String schEnd;
	private int userNo;
	
	
	@Override
	public String toString() {
		return "Schedule [schNo=" + schNo + ", schName=" + schName + ", schContent=" + schContent + ", schStart="
				+ schStart + ", schEnd=" + schEnd + ", userNo=" + userNo + "]";
	}
	public int getSchNo() {
		return schNo;
	}
	public void setSchNo(int schNo) {
		this.schNo = schNo;
	}
	public String getSchName() {
		return schName;
	}
	public void setSchName(String schName) {
		this.schName = schName;
	}
	public String getSchContent() {
		return schContent;
	}
	public void setSchContent(String schContent) {
		this.schContent = schContent;
	}
	public String getSchStart() {
		return schStart;
	}
	public void setSchStart(String schStart) {
		this.schStart = schStart;
	}
	public String getSchEnd() {
		return schEnd;
	}
	public void setSchEnd(String schEnd) {
		this.schEnd = schEnd;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	
	
	
	
}
