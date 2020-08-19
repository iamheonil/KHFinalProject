package com.privateplaylist.www.dto;

public class FindStudent {
	
	private int findStuNo;
	private String findStuTitle;
	private String findStuContent;
	private String findStuDate;
	private int userNo;
	private String findStuLoc;
	private String findStuSubject;
	private int findStuState;
	
	@Override
	public String toString() {
		return "FindStudent [findStuNo=" + findStuNo + ", findStuTitle=" + findStuTitle + ", findStuContent="
				+ findStuContent + ", findStuDate=" + findStuDate + ", userNo=" + userNo + ", findStuLoc=" + findStuLoc
				+ ", findStuSubject=" + findStuSubject + ", findStuState=" + findStuState + "]";
	}
	
	public int getFindStuNo() {
		return findStuNo;
	}
	public void setFindStuNo(int findStuNo) {
		this.findStuNo = findStuNo;
	}
	public String getFindStuTitle() {
		return findStuTitle;
	}
	public void setFindStuTitle(String findStuTitle) {
		this.findStuTitle = findStuTitle;
	}
	public String getFindStuContent() {
		return findStuContent;
	}
	public void setFindStuContent(String findStuContent) {
		this.findStuContent = findStuContent;
	}
	public String getFindStuDate() {
		return findStuDate;
	}
	public void setFindStuDate(String findStuDate) {
		this.findStuDate = findStuDate;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getFindStuLoc() {
		return findStuLoc;
	}
	public void setFindStuLoc(String findStuLoc) {
		this.findStuLoc = findStuLoc;
	}
	public String getFindStuSubject() {
		return findStuSubject;
	}
	public void setFindStuSubject(String findStuSubject) {
		this.findStuSubject = findStuSubject;
	}
	public int getFindStuState() {
		return findStuState;
	}
	public void setFindStuState(int findStuState) {
		this.findStuState = findStuState;
	}
	
	
	
	

}
