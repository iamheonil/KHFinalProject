package com.privateplaylist.www.dto;

public class WebshareFile {
	
	private int shareFileNo; //파일번호
	private int shareNo; //자료실 글번호
	private String shareFileOrg; //원본이름
	private String shareFileRename; //변경된이름
	
	
	@Override
	public String toString() {
		return "WebshareFile [shareFileNo=" + shareFileNo + ", shareNo=" + shareNo + ", shareFileOrg=" + shareFileOrg
				+ ", shareFileRename=" + shareFileRename + "]";
	}


	public int getShareFileNo() {
		return shareFileNo;
	}


	public void setShareFileNo(int shareFileNo) {
		this.shareFileNo = shareFileNo;
	}


	public int getShareNo() {
		return shareNo;
	}


	public void setShareNo(int shareNo) {
		this.shareNo = shareNo;
	}


	public String getShareFileOrg() {
		return shareFileOrg;
	}


	public void setShareFileOrg(String shareFileOrg) {
		this.shareFileOrg = shareFileOrg;
	}


	public String getShareFileRename() {
		return shareFileRename;
	}


	public void setShareFileRename(String shareFileRename) {
		this.shareFileRename = shareFileRename;
	}
	
	
	
	

}
