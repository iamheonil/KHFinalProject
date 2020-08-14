package com.privateplaylist.www.dto;

public class Review {
	
	private int review_no;
	private String review_content;
	private int user_no;
	private int conn_lesson_no;
	private String review_date;
	private int star_point;
	
	
	@Override
	public String toString() {
		return "Review [review_no=" + review_no + ", review_content=" + review_content + ", user_no=" + user_no
				+ ", conn_lesson_no=" + conn_lesson_no + ", review_date=" + review_date + ", star_point=" + star_point
				+ "]";
	}
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getConn_lesson_no() {
		return conn_lesson_no;
	}
	public void setConn_lesson_no(int conn_lesson_no) {
		this.conn_lesson_no = conn_lesson_no;
	}
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	public int getStar_point() {
		return star_point;
	}
	public void setStar_point(int star_point) {
		this.star_point = star_point;
	}
	

}
