package com.privateplaylist.www.dto;

public class MkComm {

	private int	mkCommNo;
	private int	mkNo;
	private String	mkCommContent;
	private int	mkUserNo;
	private int	mkParentCommNo;
	private int	mkCommClass;
	private String	mkCommDate;
	
	@Override
	public String toString() {
		return "MkComm [mkCommNo=" + mkCommNo + ", mkNo=" + mkNo + ", mkCommContent=" + mkCommContent + ", mkUserNo="
				+ mkUserNo + ", mkParentCommNo=" + mkParentCommNo + ", mkCommClass=" + mkCommClass + ", mkCommDate="
				+ mkCommDate + "]";
	}
	
	public int getMkCommNo() {
		return mkCommNo;
	}
	public void setMkCommNo(int mkCommNo) {
		this.mkCommNo = mkCommNo;
	}
	public int getMkNo() {
		return mkNo;
	}
	public void setMkNo(int mkNo) {
		this.mkNo = mkNo;
	}
	public String getMkCommContent() {
		return mkCommContent;
	}
	public void setMkCommContent(String mkCommContent) {
		this.mkCommContent = mkCommContent;
	}
	public int getMkUserNo() {
		return mkUserNo;
	}
	public void setMkUserNo(int mkUserNo) {
		this.mkUserNo = mkUserNo;
	}
	public int getMkParentCommNo() {
		return mkParentCommNo;
	}
	public void setMkParentCommNo(int mkParentCommNo) {
		this.mkParentCommNo = mkParentCommNo;
	}
	public int getMkCommClass() {
		return mkCommClass;
	}
	public void setMkCommClass(int mkCommClass) {
		this.mkCommClass = mkCommClass;
	}
	public String getMkCommDate() {
		return mkCommDate;
	}
	public void setMkCommDate(String mkCommDate) {
		this.mkCommDate = mkCommDate;
	}
	
	
	
}
