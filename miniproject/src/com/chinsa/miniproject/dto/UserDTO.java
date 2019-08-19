package com.chinsa.miniproject.dto;

public class UserDTO {
	private int uNo;
	private String uId;
	private String uPwd;
	private String uName;
	private String uPhone;
	private String uAddress;
	private String uEmail;
	private int uLevel;
	private String uTime;//유저 등록 시간
	public int getuNo() {
		return uNo;
	}
	public void setuNo(int uNo) {
		this.uNo = uNo;
	}
	public String getuId() {
		return uId;
	}
	public String getuTime() {
		return uTime;
	}
	public void setuTime(String uTime) {
		this.uTime = uTime;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getuPwd() {
		return uPwd;
	}
	public void setuPwd(String uPwd) {
		this.uPwd = uPwd;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getuPhone() {
		return uPhone;
	}
	public void setuPhone(String uPhone) {
		this.uPhone = uPhone;
	}
	public String getuAddress() {
		return uAddress;
	}
	public void setuAddress(String uAddress) {
		this.uAddress = uAddress;
	}
	public String getuEmail() {
		return uEmail;
	}
	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}
	public int getuLevel() {
		return uLevel;
	}
	public void setuLevel(int uLevel) {
		this.uLevel = uLevel;
	}
}
