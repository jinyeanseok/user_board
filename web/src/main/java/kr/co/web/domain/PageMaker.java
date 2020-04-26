package kr.co.web.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	
	private int displayPageCnt = 10; // 화면에 보여질 페이지 번호 수
	private int totalDataCount; // 실제 게시물 수
	private int startPage; // 현재 페이지 기준 시작 페이지 번호 
	private int endPage; // 현재 페이지 기준 끝 페이지 번호
	private boolean prev; // 이전 버튼 활성화 여부
	private boolean next; // 다음 버튼 활성화 여부
	private Criteria cri; //page(현재 페이지), perPageNum(페이지 당 보여질 게시물의 수)
	private int finalPage; // 맨끝
	private int firstPage; // 맨처음
	
	
	public PageMaker(Criteria cri) {
		this.cri = cri;
	}
	
	public void setTotalCount(int totalDataCount) {
		this.totalDataCount = totalDataCount;
		calcData();
	}
	
	public void calcData() {
		int page = cri.getPage();
		int perPageNum = cri.getPerPageNum();
		
		this.endPage = (int)(Math.ceil(page / (double)displayPageCnt) * displayPageCnt);
		this.startPage = (this.endPage - displayPageCnt) + 1;
		
		// 맨끝
		// +1하는 이유는 저렇게 계산하면 맨끝에서 2번째 페이지가 출력되기때문.
		this.finalPage = (int)(Math.ceil(totalDataCount / perPageNum)+1);
				
		// 맨처음
		this.firstPage = 1;
		
		int tempEndPage = (int)(Math.ceil(totalDataCount / (double) perPageNum));
		
		if(this.endPage >= tempEndPage) {
			this.endPage = tempEndPage;
		}
		
		
		this.prev = startPage == 1? false : true;
		this.next = (endPage * perPageNum) <= totalDataCount ? true : false;
	}
	
	
	public String makeQuery(int page) {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", this.cri.getPerPageNum())
				.build()
				.encode();
				
		return uriComponents.toString();
	}

	public int getDisplayPageCnt() {
		return displayPageCnt;
	}

	public void setDisplayPageCnt(int displayPageCnt) {
		this.displayPageCnt = displayPageCnt;
	}

	public int getTotalDataCount() {
		return totalDataCount;
	}

	public void setTotalDataCount(int totalDataCount) {
		this.totalDataCount = totalDataCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	public int getFinalPage() {
		return finalPage;
	}

	public void setFinalPage(int finalPage) {
		this.finalPage = finalPage;
	}

	public int getFirstPage() {
		return firstPage;
	}

	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}

	
}










