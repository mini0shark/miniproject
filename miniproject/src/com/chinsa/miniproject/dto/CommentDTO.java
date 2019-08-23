package com.chinsa.miniproject.dto;

public class CommentDTO {
	int cNo;
	int cPno;
	String cContent;
	String cUid;
	String cTime;
	public int getcNo() {
		return cNo;
	}
	public void setcNo(int cNo) {
		this.cNo = cNo;
	}
	public int getcPno() {
		return cPno;
	}
	public void setcPno(int cPno) {
		this.cPno = cPno;
	}
	public String getcContent() {
		return cContent;
	}
	public void setcContent(String cContent) {
		this.cContent = cContent;
	}
	public String getcUid() {
		return cUid;
	}
	public void setcUid(String cUid) {
		this.cUid = cUid;
	}
	public String getcTime() {
		return cTime;
	}
	public void setcTime(String cTime) {
		this.cTime = cTime;
	}
}
