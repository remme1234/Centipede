package egovframework.example.util;

public class PageMakerVO extends BoardVO{
	private int totalcount; // 전체 게시물 개수
	private int pagenum; // 현재 페이지 번호
	private int contentnum=9; // 한 페이지에 몇개 표시할지
	private int startPage=1; // 현재 페이지 블록의 시작 페이지
	private int endPage=5;  // 현재 페이지 블록의 마지막 페이지
	private boolean prev=false; // 이전 페이지로 가는 화살표 
	private boolean next; // 다음 페이지로 가는 화살표
	private int currentblock; // 현재 페이지 블록
	private int lastblock; // 마지막 페이지 블록
	
	public void prevnext(int pagenum) {
		if(pagenum>0 && pagenum<6) {
			setPrev(false);
			setNext(true);
		} else if(getLastblock() == getCurrentblock()){ // 해당 조건을 만족한다는 것은 마지막 페이지 블록
			setPrev(true);
			setNext(false);
		} else {
			setPrev(true);
			setNext(true);
		}
	}
	
	public int calcpage(int totalcount, int contentnum) { // 전체 페이지 수를 계산하는 함수
		int totalpage = totalcount / contentnum;
		if (totalcount%contentnum>0) {
			totalpage++;
		}
		return totalpage;
	}
	
	public int getTotalcount() {return totalcount;}
	public void setTotalcount(int totalcount) {this.totalcount = totalcount;}
	
	public int getPagenum() {return pagenum;}
	public void setPagenum(int pagenum) {this.pagenum = pagenum;}
	
	public int getContentnum() {return contentnum;}
	public void setContentnum(int contentnum) {this.contentnum = contentnum;}
	
	public int getStartPage() {return startPage;}
	public void setStartPage(int currentblock) { // 매개변수는 컨트롤러에서 담아줄 예정
		// 한페이지 블록마다 페이지가 5개씩 보이게 설정함, 예를들어 현재 페이지블록이 2라면 2*5 -4로 6페이지가 starPage가 된다.
		this.startPage = (currentblock*5)-4;}
	
	public int getEndPage() {return endPage;}
	public void setEndPage(int getlastblock, int getcurrentblock) {
		if(getlastblock == getcurrentblock){
			this.endPage = calcpage(getTotalcount(), getContentnum());
		} else {
			this.endPage = getStartPage()+4;
		}
	}
	
	public boolean isPrev() {return prev;}
	public void setPrev(boolean prev) {this.prev = prev;}
	
	public boolean isNext() {return next;}
	public void setNext(boolean next) {this.next = next;}
	
	public int getCurrentblock() {return currentblock;}
	public void setCurrentblock(int pagenum) {
		// 페이지 번호를 통해서 현재의 페이지 블록을 구한다.
		this.currentblock = pagenum/5;
		if(pagenum%5>0){
			this.currentblock++;
		}
	}
	
	public int getLastblock() {return lastblock;}
	// 전체 게시글의 개수를 한 페이지에 표시할 개수와 페이지 블록당 페이지번호를 곱한 것으로 나누면 페이지 블록이 몇개까지 되는지 알수 있음
	public void setLastblock(int totalcount) {
		this.lastblock = totalcount / (5*this.contentnum);
		if(totalcount %(5*this.contentnum)>0){
			this.lastblock++;
		}
	} 
}
