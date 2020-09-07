package com.privateplaylist.www.dto;

public class MkThumb {
	private int mkThumbNo;
	private int mkNo;
	private String mkThumbOrg;
	private String mkThumbRename;
	
	@Override
	public String toString() {
		return "MkThumb [mkThumbNo=" + mkThumbNo + ", mkNo=" + mkNo + ", mkThumbOrg=" + mkThumbOrg + ", mkThumbRename="
				+ mkThumbRename + "]";
	}
	
	public int getMkThumbNo() {
		return mkThumbNo;
	}
	public void setMkThumbNo(int mkThumbNo) {
		this.mkThumbNo = mkThumbNo;
	}
	public int getMkNo() {
		return mkNo;
	}
	public void setMkNo(int mkNo) {
		this.mkNo = mkNo;
	}
	public String getMkThumbOrg() {
		return mkThumbOrg;
	}
	public void setMkThumbOrg(String mkThumbOrg) {
		this.mkThumbOrg = mkThumbOrg;
	}
	public String getMkThumbRename() {
		return mkThumbRename;
	}
	public void setMkThumbRename(String mkThumbRename) {
		this.mkThumbRename = mkThumbRename;
	}
	
	

}
