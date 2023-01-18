package kr.co.lookst.post.domain;

public class PageResolver_prdtList {

	private SearchItem_prdtList sc;
	
	private int totalCnt;				//게시물 총 개수
	//private int pageSize = 10;		//한 페이지당 게시물 개수
	private final int NAV_SIZE = 5;		//page navigation size
	private int totalPage;				//전체 페이지 갯수
	//private int page;					//현재 페이지
	private int beginPage;				//화면에 보여줄 첫 페이지
	private int endPage;				//화면에 보여줄 마지막 페이지
	private boolean showNext = false;	//이후를 보여줄 지 여부(endPage==totalPage 이면 showNext는 false)
	private boolean showPrev = false;	//이전을 보여줄 지 여부(beginPage==1이 아니면 showPrev는 true)
	
	public PageResolver_prdtList(int totalCnt, Integer page) {
		this(totalCnt, new SearchItem_prdtList(page, 5));
	}
	
	public PageResolver_prdtList(int totalCnt, Integer page, Integer pageSize) {
		this(totalCnt, new SearchItem_prdtList(page, pageSize));

	}
	
	public PageResolver_prdtList(int totalCnt, SearchItem_prdtList sc) {
		this.totalCnt = totalCnt;
		this.sc = sc;
		
		doPaging(totalCnt, sc);
	}
	/* 페이지네이션 구현 */
	public void doPaging(int totalCnt, SearchItem_prdtList sc) {
		this.totalPage = totalCnt / sc.getPageSize() + (totalCnt % sc.getPageSize() == 0 ? 0 : 1);		//전체 페이지 갯수 (36 / 6 + (36 % 6)
		this.sc.setPage(Math.min(sc.getPage(), totalPage));												// page가 totalPage보다 크지 않음
		this.beginPage = (this.sc.getPage()-1) / NAV_SIZE * NAV_SIZE + 1;								//첫 페이지 숫자 11->11, 10->1, 15->11
		this.endPage = Math.min(this.beginPage + this.NAV_SIZE - 1, totalPage);							//둘 중에 작은게 endPage
		this.showPrev = beginPage != 1;
		this.showNext = endPage != totalPage;
	}
	
	public void print() {
		System.out.println("page = " + sc.getPage());
		System.out.print(showPrev ? "PREV " : "");
		
		for (int i = beginPage; i < endPage; i++) {
			System.out.print(i + " ");
		}
		System.out.print(showNext ? " NEXT" : " ");
		System.out.println();
	}
	
	@Override
	public String toString() {
		return "PageResolver [sc=" + sc + ", totalCnt=" + totalCnt + ", totalPage=" + totalPage + ", beginPage="
				+ beginPage + ", endPage=" + endPage + ", showNext=" + showNext + ", showPrev=" + showPrev + "]";
	}

	public SearchItem_prdtList getSc() {
		return sc;
	}

	public void setSc(SearchItem_prdtList sc) {
		this.sc = sc;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isShowNext() {
		return showNext;
	}

	public void setShowNext(boolean showNext) {
		this.showNext = showNext;
	}

	public boolean isShowPrev() {
		return showPrev;
	}

	public void setShowPrev(boolean showPrev) {
		this.showPrev = showPrev;
	}

	public int getNAV_SIZE() {
		return NAV_SIZE;
	}
	
}
