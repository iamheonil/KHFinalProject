package com.privateplaylist.www.dto;

public class Review {
	
	private int reviewNo;
	private String reviewContent;
	private int userNo;
	private int connLessonNo;
	private String reviewDate;
	private int starPoint;
	
	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", reviewContent=" + reviewContent + ", userNo=" + userNo
				+ ", connLessonNo=" + connLessonNo + ", reviewDate=" + reviewDate + ", starPoint=" + starPoint + "]";
	}
	
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getConnLessonNo() {
		return connLessonNo;
	}
	public void setConnLessonNo(int connLessonNo) {
		this.connLessonNo = connLessonNo;
	}
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	public int getStarPoint() {
		return starPoint;
	}
	public void setStarPoint(int starPoint) {
		this.starPoint = starPoint;
	}
	
	
	
}
