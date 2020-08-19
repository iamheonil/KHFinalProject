package com.privateplaylist.www.dto;

public class Membership {
	
	private int userNo;
	private String userId;
	private String userPw;
	private String userName;
	private String userGender;
	private String userAddr;
	private int userPhone;
	private String userEmail;
	private int userActor;
	private String userBirth;
	private int isLeave;
	
	
	
	@Override
	public String toString() {
		return "Membership [userNo=" + userNo + ", userId=" + userId + ", userPw=" + userPw + ", userName=" + userName
				+ ", userGender=" + userGender + ", userAddr=" + userAddr + ", userPhone=" + userPhone + ", userEmail="
				+ userEmail + ", userActor=" + userActor + ", userBirth=" + userBirth + ", isLeave=" + isLeave + "]";
	}
	public String getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserAddr() {
		return userAddr;
	}
	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}
	public int getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(int userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public int getUserActor() {
		return userActor;
	}
	public void setUserActor(int userActor) {
		this.userActor = userActor;
	}
	public int getIsLeave() {
		return isLeave;
	}
	public void setIsLeave(int isLeave) {
		this.isLeave = isLeave;
	}
	
	

}
