package com.privateplaylist.www.member.vo;

public class Member {
    private int userNo;
    private String userId;
    private String userPw;
    private String userEmail;
    private int userActor;
    private String userName;
    private String userPhone;
    private String userAddr;
    private String userGender;
    private String userBirth;
    private int isLeave;

    @Override
    public String toString() {
        return "Membership{" +
                "userNo=" + userNo +
                ", userId='" + userId + '\'' +
                ", userPw='" + userPw + '\'' +
                ", userEmail='" + userEmail + '\'' +
                ", userActor=" + userActor +
                ", userName='" + userName + '\'' +
                ", userPhone=" + userPhone +
                ", userAddr='" + userAddr + '\'' +
                ", userGender='" + userGender + '\'' +
                ", userBirth='" + userBirth + '\'' +
                ", isLeave=" + isLeave +
                '}';
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

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserAddr() {
        return userAddr;
    }

    public void setUserAddr(String userAddr) {
        this.userAddr = userAddr;
    }

    public String getUserGender() {
        return userGender;
    }

    public void setUserGender(String userGender) {
        this.userGender = userGender;
    }

    public String getUserBirth() {
        return userBirth;
    }

    public void setUserBirth(String userBirth) {
        this.userBirth = userBirth;
    }

    public int getIsLeave() {
        return isLeave;
    }

    public void setIsLeave(int isLeave) {
        this.isLeave = isLeave;
    }

}