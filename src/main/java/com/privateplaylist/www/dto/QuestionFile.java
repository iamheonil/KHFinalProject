package com.privateplaylist.www.dto;

public class QuestionFile {

	private int questionFileNo;
	private int questionNo;
	private String qFileOriginal;
	private String qFileRename;

	@Override
	public String toString() {
		return "QuestionFile [questionFileNo=" + questionFileNo + ", questionNo=" + questionNo + ", qFileOriginal="
				+ qFileOriginal + ", qFileRename=" + qFileRename + "]";
	}

	public int getQuestionFileNo() {
		return questionFileNo;
	}

	public void setQuestionFileNo(int questionFileNo) {
		this.questionFileNo = questionFileNo;
	}

	public int getQuestionNo() {
		return questionNo;
	}

	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}

	public String getqFileOriginal() {
		return qFileOriginal;
	}

	public void setqFileOriginal(String qFileOriginal) {
		this.qFileOriginal = qFileOriginal;
	}

	public String getqFileRename() {
		return qFileRename;
	}

	public void setqFileRename(String qFileRename) {
		this.qFileRename = qFileRename;
	}

}
