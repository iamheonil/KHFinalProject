package com.privateplaylist.www.dto;

public class ConnectedLesson {
	
	private int connLessonNo; //연결(매칭) 번호
	private int lessonNo; //과외 번호
	private int userFrom; //신청자(userNo)
	private int userTo; //수락자(userNo)
	private int isConnected; //신청 수락 여부
	private int isEnd; //과외 완료 여부
	
	
	@Override
	public String toString() {
		return "ConnectedLesson [connLessonNo=" + connLessonNo + ", lessonNo=" + lessonNo + ", userFrom=" + userFrom
				+ ", userTo=" + userTo + ", isConnected=" + isConnected + ", isEnd=" + isEnd + "]";
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
	
	

}
