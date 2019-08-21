package com.chinsa.miniproject.dto;

public class ImageDTO {
	private int iNo;
	private String iFilename;
	private String iPath;
	private String iTime;
	public int getiNo() {
		return iNo;
	}
	public void setiNo(int iNo) {
		this.iNo = iNo;
	}
	public String getiFilename() {
		return iFilename;
	}
	public void setiFilename(String iFilename) {
		this.iFilename = iFilename;
	}
	public String getiPath() {
		return iPath;
	}
	public void setiPath(String iPath) {
		this.iPath = iPath;
	}
	public String getiTime() {
		return iTime;
	}
	public void setiTime(String iTime) {
		this.iTime = iTime;
	}
}
