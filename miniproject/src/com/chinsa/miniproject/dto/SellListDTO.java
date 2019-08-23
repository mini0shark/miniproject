package com.chinsa.miniproject.dto;

public class SellListDTO {
	private int sNo; //고유번 호 (key)
	private String sName;//'상품 이름',
	private int sPno; //상품 번호
	private String sImg;	//대표 이미지
	private String sSeller;
	private String sBuyer;//구매자
	private String sState;//상품 상태( 진행중, 거래중..)
	private String sCategory;//상품 분류
	private String sTime;//상품 등록 시간
	private int sPrice;//
	public int getsNo() {
		return sNo;
	}
	public void setsNo(int sNo) {
		this.sNo = sNo;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public int getsPno() {
		return sPno;
	}
	public void setsPno(int sPno) {
		this.sPno = sPno;
	}
	public String getsImg() {
		return sImg;
	}
	public void setsImg(String sImg) {
		this.sImg = sImg;
	}
	public void setsSeller(String sSeller) {
		this.sSeller = sSeller;
	}
	public String getsSeller() {
		return sSeller;
	}
	public String getsBuyer() {
		return sBuyer;
	}
	public void setsBuyer(String sBuyer) {
		this.sBuyer = sBuyer;
	}
	public String getsState() {
		return sState;
	}
	public void setsState(String sState) {
		this.sState = sState;
	}
	public String getsCategory() {
		return sCategory;
	}
	public void setsCategory(String sCategory) {
		this.sCategory = sCategory;
	}
	public String getsTime() {
		return sTime;
	}
	public void setsTime(String sTime) {
		this.sTime = sTime;
	}
	public int getsPrice() {
		return sPrice;
	}
	public void setsPrice(int sPrice) {
		this.sPrice = sPrice;
	}
	@Override
	public String toString() {
		return "SellListDTO [sNo=" + sNo + ", sName=" + sName + ", sPno=" + sPno + ", sImg=" + sImg + ", sSeller="
				+ sSeller + ", sBuyer=" + sBuyer + ", sState=" + sState + ", sCategory=" + sCategory + ", sTime="
				+ sTime + ", sPrice=" + sPrice + "]";
	}
	
}
