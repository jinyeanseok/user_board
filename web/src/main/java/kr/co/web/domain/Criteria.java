package kr.co.web.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class Criteria {
	private int page;
	private int perPageNum;
	private String searchType;
	private String keyword;
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
		this.searchType = null;
		this.keyword = null;
	}
    
	// boardMapper.xml listPage의 pageStart를 반환
	public int getPageStart() {
		return (this.page - 1)*perPageNum;
	}

	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
		}else {
			this.page = page;
		}
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		if(perPageNum <=0 || perPageNum > 100) {
			this.perPageNum = 10;
		}else {
			this.perPageNum = perPageNum;
		}
	}
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
	
//	public String makeQuery() {
//		UriComponents uriComponents = UriComponentsBuilder.newInstance()
//				.queryParam("page", page)
//				.queryParam("perPageNum", this.getPerPageNum())
//				.build()
//				.encode();
//				
//		return uriComponents.toString();
//	}
	
	
//	public String makeQuery() {
//		UriComponentsBuilder  uriComponentsBuilder  = UriComponentsBuilder.newInstance()
//				.queryParam("page", page)
//				.queryParam("perPageNum", this.perPageNum);
//		
//		if(searchType!=null) {
//			uriComponentsBuilder
//				.queryParam("searchType", this.searchType)
//				.queryParam("keyword", this.keyword);
//		}
//			
//		return uriComponentsBuilder.build().encode().toString();
//	}
	
	
	public String makeQuery() {
		UriComponentsBuilder uriComponentsBuilder = UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", this.perPageNum);
				
		if (searchType!=null) {
			uriComponentsBuilder
					.queryParam("searchType", this.searchType)
					.queryParam("keyword", this.keyword);
		}
		return uriComponentsBuilder.build().encode().toString();
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
}