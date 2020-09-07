package com.privateplaylist.www.dto;

public class ConnectedLesson {
	
	private int connLessonNo; 
	private int lessonNo; 
	private int userFrom; 
	private int userTo; 
	private int isConnected; 
	private int isEnd;
	private int reviewReg;
	
	
	@Override
	public String toString() {
		return "ConnectedLesson [connLessonNo=" + connLessonNo + ", lessonNo=" + lessonNo + ", userFrom=" + userFrom
				+ ", userTo=" + userTo + ", isConnected=" + isConnected + ", isEnd=" + isEnd + ", reviewReg="
				+ reviewReg + "]";
	}

	
	public int getConnLessonNo() {
		return connLessonNo;
	}

	public void setConnLessonNo(int connLessonNo) {
		this.connLessonNo = connLessonNo;
	}

	public int getLessonNo() {
		return lessonNo;
	}

	public void setLessonNo(int lessonNo) {
		this.lessonNo = lessonNo;
	}

	public int getUserFrom() {
		return userFrom;
	}

	public void setUserFrom(int userFrom) {
		this.userFrom = userFrom;
	}

	public int getUserTo() {
		return userTo;
	}

	public void setUserTo(int userTo) {
		this.userTo = userTo;
	}

	public int getIsConnected() {
		return isConnected;
	}

	public void setIsConnected(int isConnected) {
		this.isConnected = isConnected;
	}

	public int getIsEnd() {
		return isEnd;
	}

	public void setIsEnd(int isEnd) {
		this.isEnd = isEnd;
	}

	public int getReviewReg() {
		return reviewReg;
	}

	public void setReviewReg(int reviewReg) {
		this.reviewReg = reviewReg;
	}

	

}
