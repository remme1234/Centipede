package egovframework.example.releaseInfo.service;

public class ReleaseInfoVO {
	
	private int count;
	private String boardUid;
	private String number;
	private String title;
	private String contents;
	private String userId;
	private int visitCnt;
	private String rsgstDt;
	private String useYn;
	private String fileNo;
	private String savedFileNm;
	private String relDt;
	
	public String getFileNo() {return fileNo;}
	public void setFileNo(String fileNo) {this.fileNo = fileNo;}
	
	public int getCount() {return count;}
	public void setCount(int count) {this.count = count;}
	
	public String getBoardUid() {return boardUid;}
	public void setBoardUid(String boardUid) {this.boardUid = boardUid;}
	
	public String getNumber() {return number;}
	public void setNumber(String number) {this.number = number;}
	
	public String getTitle() {return title;}
	public void setTitle(String title) {this.title = title;}
	
	public String getUserId() {return userId;}
	public void setUserId(String userId) {this.userId = userId;}
	
	public String getContents() {return contents;}
	public void setContents(String contents) {this.contents = contents;}
	
	public int getVisitCnt() {return visitCnt;}
	public void setVisitCnt(int visitCnt) {this.visitCnt = visitCnt;}
	
	public String getRsgstDt() {return rsgstDt;}
	public void setRsgstDt(String rsgstDt) {this.rsgstDt = rsgstDt;}
	
	public String getUseYn() {return useYn;}
	public void setUseYn(String useYn) {this.useYn = useYn;}
	
	public String getSavedFileNm() {return savedFileNm;}
	public void setSavedFileNm(String savedFileNm) {this.savedFileNm = savedFileNm;}
	
	public String getRelDt() {return relDt;}
	public void setRelDt(String relDt) {this.relDt = relDt;}
}
