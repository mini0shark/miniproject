package com.chinsa.miniproject.dto;

public class ProductDTO {
	private int pNo; //고유번 호 (key)
	private String pName;//'상품 이름',
	private int pPrice;
	private String pInfo; //정보
	private String pLoc; // 판매위치(직거래 일때
	private String pImg;	//대표 이미지
	private String pSeller;//판매자
	private String pState;//상품 상태( 진행중, 거래중..)
	private String pCategory;//상품 분류
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public int getpPrice() {
		return pPrice;
	}
	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}
	public String getpInfo() {
		return pInfo;
	}
	public void setpInfo(String pInfo) {
		this.pInfo = pInfo;
	}
	public String getpLoc() {
		return pLoc;
	}
	public void setpLoc(String pLoc) {
		this.pLoc = pLoc;
	}
	public String getpImg() {
		return pImg;
	}
	public void setpImg(String pImg) {
		this.pImg = pImg;
	}
	public String getpSeller() {
		return pSeller;
	}
	public void setpSeller(String pSeller) {
		this.pSeller = pSeller;
	}
	public String getpState() {
		return pState;
	}
	public void setpState(String pState) {
		this.pState = pState;
	}
	public String getpCategory() {
		return pCategory;
	}
	public void setpCategory(String pCategory) {
		this.pCategory = pCategory;
	}
	
	
}
