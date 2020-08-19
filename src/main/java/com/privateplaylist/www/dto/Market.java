package com.privateplaylist.www.dto;

public class Market {
	
	private int mkNo;
	private String mkTitle;
	private String mkContent;
	private String mkDate;
	private int mkWriter;
	private int mkPrice;
	private int mkState;
	
	@Override
	public String toString() {
		return "Market [mkNo=" + mkNo + ", mkTitle=" + mkTitle + ", mkContent=" + mkContent + ", mkDate=" + mkDate
				+ ", mkWriter=" + mkWriter + ", mkPrice=" + mkPrice + ", mkState=" + mkState + "]";
	}
	
	public int getMkNo() {
		return mkNo;
	}
	public void setMkNo(int mkNo) {
		this.mkNo = mkNo;
	}
	public String getMkTitle() {
		return mkTitle;
	}
	public void setMkTitle(String mkTitle) {
		this.mkTitle = mkTitle;
	}
	public String getMkContent() {
		return mkContent;
	}
	public void setMkContent(String mkContent) {
		this.mkContent = mkContent;
	}
	public String getMkDate() {
		return mkDate;
	}
	public void setMkDate(String mkDate) {
		this.mkDate = mkDate;
	}
	public int getMkWriter() {
		return mkWriter;
	}
	public void setMkWriter(int mkWriter) {
		this.mkWriter = mkWriter;
	}
	public int getMkPrice() {
		return mkPrice;
	}
	public void setMkPrice(int mkPrice) {
		this.mkPrice = mkPrice;
	}
	public int getMkState() {
		return mkState;
	}
	public void setMkState(int mkState) {
		this.mkState = mkState;
	}
	
	
	
	

}