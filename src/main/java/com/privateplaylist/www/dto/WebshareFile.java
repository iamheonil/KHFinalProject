package com.privateplaylist.www.dto;

public class WebshareFile {
<<<<<<< HEAD
	
	private int shareFileNo; 
	private int shareNo; 
	private String shareFileOrg; 
	private String shareFileRename; 
	
=======

	private int shareFileNo;
	private int shareNo;
	private String shareFileOrg;
	private String shareFileRename;
>>>>>>> 019ae24846550f919fadfd487d293d074c3a65f8
	
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
