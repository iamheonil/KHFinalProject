package com.privateplaylist.www.dto;

public class Question {

	private int questionNo;
	private int userNo;
	private String questionTitle;
	private String questionContent;
	private String questionDate;

	@Override
	public String toString() {
		return "Question [questionNo=" + questionNo + ", userNo=" + userNo + ", questionTitle=" + questionTitle
				+ ", questionContent=" + questionContent + ", questionDate=" + questionDate + "]";
	}

	public int getQuestionNo() {
		return questionNo;
	}

	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getQuestionTitle() {
		return questionTitle;
	}

	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}

	public String getQuestionContent() {
		return questionContent;
	}

	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}

	public String getQuestionDate() {
		return questionDate;
	}

	public void setQuestionDate(String questionDate) {
		this.questionDate = questionDate;
	}

}
