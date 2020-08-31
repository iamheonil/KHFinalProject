package com.privateplaylist.www.dto;

import java.util.Date;

public class Webshare {

	private int shareNo;
	private int connLessonNo;
	private String shareTitle;
	private String shareContent;
	private Date shareDate;
	
	
	@Override
	public String toString() {
		return "Webshare [shareNo=" + shareNo + ", connLessonNo=" + connLessonNo + ", shareTitle=" + shareTitle
				+ ", shareContent=" + shareContent + ", shareDate=" + shareDate + "]";
	}


	public int getShareNo() {
		return shareNo;
	}


	public void setShareNo(int shareNo) {
		this.shareNo = shareNo;
	}


	public int getConnLessonNo() {
		return connLessonNo;
	}


	public void setConnLessonNo(int connLessonNo) {
		this.connLessonNo = connLessonNo;
	}


	public String getShareTitle() {
		return shareTitle;
	}


	public void setShareTitle(String shareTitle) {
		this.shareTitle = shareTitle;
	}


	public String getShareContent() {
		return shareContent;
	}


	public void setShareContent(String shareContent) {
		this.shareContent = shareContent;
	}


	public Date getShareDate() {
		return shareDate;
	}


	public void setShareDate(Date shareDate) {
		this.shareDate = shareDate;
	}
	
	
	
	
	
	
}
