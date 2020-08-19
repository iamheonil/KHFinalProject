package com.privateplaylist.www.dto;

public class MkFile {

	private int mkFileNo;
	private int mkNo;
	private String mkFileOrg;
	private String mkFileRename;
	
	@Override
	public String toString() {
		return "MkFile [mkFileNo=" + mkFileNo + ", mkNo=" + mkNo + ", mkFileOrg=" + mkFileOrg + ", mkFileRename="
				+ mkFileRename + "]";
	}
	
	public int getMkFileNo() {
		return mkFileNo;
	}
	public void setMkFileNo(int mkFileNo) {
		this.mkFileNo = mkFileNo;
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