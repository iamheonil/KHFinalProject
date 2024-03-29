package com.privateplaylist.www.dto;

public class BlackList {
	
	private int blacklistNo;
	private int userNo;
	private String blacklistDate;
	private String blacklistContent;
	private int blacklistState;
	private String blacklistBoard;
	private int blacklistPostNo;
	
	@Override
	public String toString() {
		return "BlackList [blacklistNo=" + blacklistNo + ", userNo=" + userNo + ", blacklistDate=" + blacklistDate
				+ ", blacklistContent=" + blacklistContent + ", blacklistState=" + blacklistState + ", blacklistBoard="
				+ blacklistBoard + ", blacklistPostNo=" + blacklistPostNo + "]";
	}
	
	public int getBlacklistNo() {
		return blacklistNo;
	}
	public void setBlacklistNo(int blacklistNo) {
		this.blacklistNo = blacklistNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getBlacklistDate() {
		return blacklistDate;
	}
	public void setBlacklistDate(String blacklistDate) {
		this.blacklistDate = blacklistDate;
	}
	public String getBlacklistContent() {
		return blacklistContent;
	}
	public void setBlacklistContent(String blacklistContent) {
		this.blacklistContent = blacklistContent;
	}
	public int getBlacklistState() {
		return blacklistState;
	}
	public void setBlacklistState(int blacklistState) {
		this.blacklistState = blacklistState;
	}
	public String getBlacklistBoard() {
		return blacklistBoard;
	}
	public void setBlacklistBoard(String blacklistBoard) {
		this.blacklistBoard = blacklistBoard;
	}
	public int getBlacklistPostNo() {
		return blacklistPostNo;
	}
	public void setBlacklistPostNo(int blacklistPostNo) {
		this.blacklistPostNo = blacklistPostNo;
	}
	
	

}
