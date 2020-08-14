package com.privateplaylist.www.dto;

public class Payment {
	
	private int payNo;
	private int lessonNo;
	private int userNo;
	private String payDate;
    private int payMoney;
    
    
	@Override
	public String toString() {
		return "Payment [payNo=" + payNo + ", lessonNo=" + lessonNo + ", userNo=" + userNo + ", payDate=" + payDate
				+ ", payMoney=" + payMoney + "]";
	}


	public int getPayNo() {
		return payNo;
	}


	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}


	public int getLessonNo() {
		return lessonNo;
	}


	public void setLessonNo(int lessonNo) {
		this.lessonNo = lessonNo;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public String getPayDate() {
		return payDate;
	}


	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}


	public int getPayMoney() {
		return payMoney;
	}


	public void setPayMoney(int payMoney) {
		this.payMoney = payMoney;
	}
    
    
    

}
