package egovframework.example.review.service;

// 사이즈 리뷰 select box에서 쓰일 VO
public class ReviewVO {

	private String catCd;
	private String brndNm;
	private String sortNo;
	private String gdCd;
	private String gdNm;
	private String rplNo;
	private String number;
	private String pastLength;
	private String newLength;
	private String size;
	private String rsgstDt;
	private String rsgstrId;
	
	public String getRplNo() {return rplNo;}
	public void setRplNo(String rplNo) {this.rplNo = rplNo;}
	
	public String getNumber() {return number;}
	public void setNumber(String number) {this.number = number;}
	
	public String getPastLength() {return pastLength;}
	public void setPastLength(String pastLength) {this.pastLength = pastLength;}
	
	public String getNewLength() {return newLength;}
	public void setNewLength(String newtLength) {this.newLength = newtLength;}
	
	public String getSize() {return size;}
	public void setSize(String size) {this.size = size;}
	
	public String getCatCd() {return catCd;}
	public void setCatCd(String catCd) {this.catCd = catCd;}
	
	public String getBrndNm() {return brndNm;}
	public void setBrndNm(String brndNm) {this.brndNm = brndNm;}
	
	public String getSortNo() {return sortNo;}
	public void setSortNo(String sortNo) {this.sortNo = sortNo;}
	
	public String getGdCd() {return gdCd;}
	public void setGdCd(String gdCd) {this.gdCd = gdCd;}
	
	public String getGdNm() {return gdNm;}
	public void setGdNm(String gdNm) {this.gdNm = gdNm;}
	
	public String getRsgstDt() {return rsgstDt;}
	public void setRsgstDt(String rsgstDt) {this.rsgstDt = rsgstDt;}
	
	public String getRsgstrId() {return rsgstrId;}
	public void setRsgstrId(String rsgstrId) {this.rsgstrId = rsgstrId;}
	
}
