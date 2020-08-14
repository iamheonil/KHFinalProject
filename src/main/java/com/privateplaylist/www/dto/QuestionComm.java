package com.privateplaylist.www.dto;

public class QuestionComm {

	private int commNo;
	private int questionNo;
	private String commContent;
	private int userNo;
	private int parentCommNo;
	private int commClass;
	private String commDate;

	@Override
	public String toString() {
		return "QuestionComm [commNo=" + commNo + ", questionNo=" + questionNo + ", commContent=" + commContent
				+ ", userNo=" + userNo + ", parentCommNo=" + parentCommNo + ", commClass=" + commClass + ", commDate="
				+ commDate + "]";
	}

	public int getCommNo() {
		return commNo;
	}

	public void setCommNo(int commNo) {
		this.commNo = commNo;
	}

	public int getQuestionNo() {
		return questionNo;
	}

	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}

	public String getCommContent() {
		return commContent;
	}

	public void setCommContent(String commContent) {
		this.commContent = commContent;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getParentCommNo() {
		return parentCommNo;
	}

	public void setParentCommNo(int parentCommNo) {
		this.parentCommNo = parentCommNo;
	}

	public int getCommClass() {
		return commClass;
	}

	public void setCommClass(int commClass) {
		this.commClass = commClass;
	}

	public String getCommDate() {
		return commDate;
	}

	public void setCommDate(String commDate) {
		this.commDate = commDate;
	}

}
