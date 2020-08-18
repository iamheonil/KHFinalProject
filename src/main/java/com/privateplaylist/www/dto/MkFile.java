package com.privateplaylist.www.dto;

public class MkFile {
	
	private int mkfileNo;
	private int mkNo;
	private String mkFileOrg;
	private String mkFileRename;
	
	@Override
	public String toString() {
		return "MkFile [mkfileNo=" + mkfileNo + ", mkNo=" + mkNo + ", mkFileOrg=" + mkFileOrg + ", mkFileRename="
				+ mkFileRename + "]";
	}
	
	public int getMkfileNo() {
		return mkfileNo;
	}
	public void setMkfileNo(int mkfileNo) {
		this.mkfileNo = mkfileNo;
	}
	public int getMkNo() {
		return mkNo;
	}
	public void setMkNo(int mkNo) {
		this.mkNo = mkNo;
	}
	public String getMkFileOrg() {
		return mkFileOrg;
	}
	public void setMkFileOrg(String mkFileOrg) {
		this.mkFileOrg = mkFileOrg;
	}
	public String getMkFileRename() {
		return mkFileRename;
	}
	public void setMkFileRename(String mkFileRename) {
		this.mkFileRename = mkFileRename;
	}
	
	

}
