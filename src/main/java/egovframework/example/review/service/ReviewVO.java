package egovframework.example.review.service;

public class ReviewVO {

	private int count;
	private String boardUid;
	private String number;
	private String catCd;
	private String catCdNm;
	private String title;
	private String contents;
	private String userId;
	private String visitCnt;
	private String rsgstDt;
	private String fileNo;
	private String useYn;
	
	
	public String getBoardUid() {return boardUid;}
	public void setBoardUid(String boardUid) {this.boardUid = boardUid;}
	
	public String getNumber() {return number;}
	public void setNumber(String number) {this.number = number;}
	
	
	public String getTitle() {return title;}
	public void setTitle(String title) {this.title = title;}
	
	public String getContents() {return contents;}
	public void setContents(String contents) {this.contents = contents;}
	
	public String getUserId() {return userId;}
	public void setUserId(String userId) {this.userId = userId;}
	
	public String getVisitCnt() {return visitCnt;}
	public void setVisitCnt(String visitCnt) {this.visitCnt = visitCnt;}
	
	public String getRsgstDt() {return rsgstDt;}
	public void setRsgstDt(String rsgstDt) {this.rsgstDt = rsgstDt;}
	
	public String getUseYn() {return useYn;}
	public void setUseYn(String useYn) {this.useYn = useYn;}
	
	public int getCount() {return count;}
	public void setCount(int count) {this.count = count;}
	
	public String getCatCd() {return catCd;}
	public void setCatCd(String catCd) {this.catCd = catCd;}
	
	public String getFileNo() {return fileNo;}
	public void setFileNo(String fileNo) {this.fileNo = fileNo;}
	
}
