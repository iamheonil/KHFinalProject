package com.privateplaylist.www.dto;

public class FindLesson {

	private int lessonNo; //과외번호
	private String lessonTitle; //과외제목
	private String lessonContent; //과외내용
	private String lessonDate; //작성일
	private int userNo; //작성자번호
	private String lessonLoc; //과외지역
	private String lessonSubject; //과외과목
	private int lessonPrice; //가격
	private String lessonAge; // 대상연령 15~17이므로 String
	private int maxPeople; 
	private int lessonState; //과외 상태 0이면 과외x 1이면 과외중
	private int lessonChk; //검토상태 0이면 검토x 1이면 검토완료
	private int payState; // 결제상태 0이면 미결제 1이면 결제완료 > 과외등록
	
	
	
	@Override
	public String toString() {
		return "FindLesson [lessonNo=" + lessonNo + ", lessonTitle=" + lessonTitle + ", lessonContent=" + lessonContent
				+ ", lessonDate=" + lessonDate + ", userNo=" + userNo + ", lessonLoc=" + lessonLoc + ", lessonSubject="
				+ lessonSubject + ", lessonPrice=" + lessonPrice + ", lessonAge=" + lessonAge + ", maxPeople="
				+ maxPeople + ", lessonState=" + lessonState + ", lessonChk=" + lessonChk + ", payState=" + payState
				+ "]";
	}
	public int getMaxPeople() {
		return maxPeople;
	}
	public void setMaxPeople(int maxPeople) {
		this.maxPeople = maxPeople;
	}
	public int getLessonNo() {
		return lessonNo;
	}
	public void setLessonNo(int lessonNo) {
		this.lessonNo = lessonNo;
	}
	public String getLessonTitle() {
		return lessonTitle;
	}
	public void setLessonTitle(String lessonTitle) {
		this.lessonTitle = lessonTitle;
	}
	public String getLessonContent() {
		return lessonContent;
	}
	public void setLessonContent(String lessonContent) {
		this.lessonContent = lessonContent;
	}
	public String getLessonDate() {
		return lessonDate;
	}
	public void setLessonDate(String lessonDate) {
		this.lessonDate = lessonDate;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getLessonLoc() {
		return lessonLoc;
	}
	public void setLessonLoc(String lessonLoc) {
		this.lessonLoc = lessonLoc;
	}
	public String getLessonSubject() {
		return lessonSubject;
	}
	public void setLessonSubject(String lessonSubject) {
		this.lessonSubject = lessonSubject;
	}
	public int getLessonPrice() {
		return lessonPrice;
	}
	public void setLessonPrice(int lessonPrice) {
		this.lessonPrice = lessonPrice;
	}
	public String getLessonAge() {
		return lessonAge;
	}
	public void setLessonAge(String lessonAge) {
		this.lessonAge = lessonAge;
	}
	public int getLessonState() {
		return lessonState;
	}
	public void setLessonState(int lessonState) {
		this.lessonState = lessonState;
	}
	public int getLessonChk() {
		return lessonChk;
	}
	public void setLessonChk(int lessonChk) {
		this.lessonChk = lessonChk;
	}
	public int getPayState() {
		return payState;
	}
	public void setPayState(int payState) {
		this.payState = payState;
	}
	
	
	
	
	
	
}
