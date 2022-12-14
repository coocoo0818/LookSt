package kr.co.lookst.post.domain;

import org.springframework.web.util.UriComponentsBuilder;
import static java.util.Objects.requireNonNullElse;
import static java.lang.Math.*;
public class SearchItem_prdtList {

	public static final int DEFAULT_PAGE_SIZE = 6;
	public static final int MIN_DEFAULT_PAGE_SIZE = 1;
	public static final int MAX_DEFAULT_PAGE_SIZE = 30;
	
	private Integer page = 1;							//현재 페이지
	private	Integer pageSize = DEFAULT_PAGE_SIZE;		//한 페이지당 게시물 갯수
	private String option = "";							//검색 옵션
	private String keyword = "";						//검색어
	private String kind = "";							//상품종류
	private Integer offset;								//페이지 시작
	
	public SearchItem_prdtList() {

	}
	
	public SearchItem_prdtList(Integer page, Integer pageSize) {
		this(page, pageSize, "", "", "");
	}
	
	public SearchItem_prdtList(Integer page, Integer pageSize, String option, String keyword,String kind) {
		//super();
		this.page = page;
		this.pageSize = pageSize;
		this.option = option;
		this.keyword = keyword;
		this.kind = kind;
	}
	
	public String getQueryString() {
		return getQueryString(page);
	}
	
	// ?page=10&pageSize=10&option=A&keyword=title
	public String getQueryString(Integer page) {
		return UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("pageSize", pageSize)
				.queryParam("option", option)
				.queryParam("keyword", keyword)
				.queryParam("kind", kind)
				.build().toString();
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = requireNonNullElse(pageSize, DEFAULT_PAGE_SIZE);
		
		// MIN_DEFAULT_PAGE_SIZE <= pageSize <= MAX_DEFAULT_PAGE_SIZE
		this.pageSize = max(MIN_DEFAULT_PAGE_SIZE, min((this.pageSize), MAX_DEFAULT_PAGE_SIZE));
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Integer getOffset() {
		int result = (page - 1) * pageSize;
		if (result <= 0) result = 0;
		return result;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	@Override
	public String toString() {
		return "SearchItem_prdtList [page=" + page + ", pageSize=" + pageSize + ", option=" + option + ", keyword="
				+ keyword + ", kind=" + kind + ", offset=" + offset + "]";
	}

	
	
}
