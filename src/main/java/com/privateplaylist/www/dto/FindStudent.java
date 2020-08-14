package com.privateplaylist.www.dto;

public class FindStudent {
	
	private int find_stu_no;
	private String find_stu_title;
	private String find_stu_content;
	private String find_stu_date;
	private int user_no;
	private String find_stu_loc;
	private String find_stu_subject;
	private int find_stu_state;
	
	
	
	@Override
	public String toString() {
		return "FindStudent [find_stu_no=" + find_stu_no + ", find_stu_title=" + find_stu_title + ", find_stu_content="
				+ find_stu_content + ", find_stu_date=" + find_stu_date + ", user_no=" + user_no + ", find_stu_loc="
				+ find_stu_loc + ", find_stu_subject=" + find_stu_subject + ", find_stu_state=" + find_stu_state + "]";
	}
	public int getFind_stu_no() {
		return find_stu_no;
	}
	public void setFind_stu_no(int find_stu_no) {
		this.find_stu_no = find_stu_no;
	}
	public String getFind_stu_title() {
		return find_stu_title;
	}
	public void setFind_stu_title(String find_stu_title) {
		this.find_stu_title = find_stu_title;
	}
	public String getFind_stu_content() {
		return find_stu_content;
	}
	public void setFind_stu_content(String find_stu_content) {
		this.find_stu_content = find_stu_content;
	}
	public String getFind_stu_date() {
		return find_stu_date;
	}
	public void setFind_stu_date(String find_stu_date) {
		this.find_stu_date = find_stu_date;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getFind_stu_loc() {
		return find_stu_loc;
	}
	public void setFind_stu_loc(String find_stu_loc) {
		this.find_stu_loc = find_stu_loc;
	}
	public String getFind_stu_subject() {
		return find_stu_subject;
	}
	public void setFind_stu_subject(String find_stu_subject) {
		this.find_stu_subject = find_stu_subject;
	}
	public int getFind_stu_state() {
		return find_stu_state;
	}
	public void setFind_stu_state(int find_stu_state) {
		this.find_stu_state = find_stu_state;
	}
	
	

}
