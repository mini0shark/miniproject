package com.chinsa.miniproject.dto;

public class BuyListDTO {
	private int bNo; //고유번 호 (key)
	private String bName;//'상품 이름',
	private int bPno; //상품 번호
	private String bImg;	//대표 이미지
	private String bSeller;//판매자
	private String bBuyer;
	private String bState;//상품 상태( 진행중, 거래중..)
	private String bCategory;//상품 분류
	private String bTime;//상품 등록 시간
	private int bPrice;//
	public int getbNo() {
		return bNo;
	}
	public void setbNo(int bNo) {
		this.bNo = bNo;
	}
	public String getbName() {
		return bName;
	}
	public void setbName(String bName) {
		this.bName = bName;
	}
	public int getbPno() {
		return bPno;
	}
	public void setbPno(int bPno) {
		this.bPno = bPno;
	}
	public String getbImg() {
		return bImg;
	}
	public void setbImg(String bImg) {
		this.bImg = bImg;
	}
	public String getbSeller() {
		return bSeller;
	}
	public void setbSeller(String bSeller) {
		this.bSeller = bSeller;
	}
	
	public String getbBuyer() {
		return bBuyer;
	}
	public void setbBuyer(String bBuyer) {
		this.bBuyer = bBuyer;
	}
	public String getbState() {
		return bState;
	}
	public void setbState(String bState) {
		this.bState = bState;
	}
	public String getbCategory() {
		return bCategory;
	}
	public void setbCategory(String bCategory) {
		this.bCategory = bCategory;
	}
	public String getbTime() {
		return bTime;
	}
	public void setbTime(String bTime) {
		this.bTime = bTime;
	}
	public int getbPrice() {
		return bPrice;
	}
	public void setbPrice(int bPrice) {
		this.bPrice = bPrice;
	}
}
