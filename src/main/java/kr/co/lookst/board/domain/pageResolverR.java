package kr.co.lookst.board.domain;

public class pageResolverR {
	
	private SearchItem sc;

	private int totalCntR; // 게시물 총 개수 
	public final int NAV_SIZE = 10; // page navigation size 
	
	private int totalPage; // 전체 페이지 개수 
	
	private int beginPage; // 화면에 보여줄 첫 페이지 
	private int endPage; // 화면에 보여줄 마지막 페이지 
	private boolean showNext = false; // 이후를 보여줄지 여부 (endPage == totalPage 이면 showNext는 false)
	private boolean showPrev = false; // 이전을 보여줄지 여부 (beginPage == 1이 아니면 showPrev는 true)
	
	public pageResolverR(int totalCntR, Integer page) {
		this(totalCntR, new SearchItem(page, 10));
	}
	
	public pageResolverR(int totalCntR, Integer page, Integer pageSize) {
		this(totalCntR, new SearchItem(page, pageSize));
	}
	
	public pageResolverR(int totalCntR, SearchItem sc) {
		this.totalCntR = totalCntR;
		this.sc = sc;
		
		doPaging(totalCntR, sc);
	}
	
	public void doPaging(int totalCntR, SearchItem sc) {
		this.totalPage = totalCntR / sc.getPageSize() + (totalCntR % sc.getPageSize() == 0 ? 0 : 1); // 전체 페이지 개수
		this.sc.setPage(Math.min(sc.getPage(), totalPage)); // page가 totalPage보다 크지 않음
		this.beginPage = (this.sc.getPage()-1) / NAV_SIZE * NAV_SIZE + 1; // 첫 페이지 숫자 11 -> 11, 10 -> 1, 15 -> 11 
		this.endPage = Math.min(this.beginPage + this.NAV_SIZE - 1, totalPage);
		this.showPrev = beginPage != 1;
		this.showNext = endPage != totalPage;
	}
	
	public void print() {
		System.out.println("page = " + sc.getPage());
		System.out.print(showPrev ? "PREV " : "");
		
		for(int i=beginPage; i<=endPage; i++) {
			System.out.print(i + " ");
		}
		
		System.out.println(showNext ? " NEXT" : "");
	}

	@Override
	public String toString() {
		return "PageResolverR [sc=" + sc + ", totalCntR=" + totalCntR + ", totalPage=" + totalPage + ", beginPage="
				+ beginPage + ", endPage=" + endPage + ", showNext=" + showNext + ", showPrev=" + showPrev + "]";
	}

	public SearchItem getSc() {
		return sc;
	}

	public void setSc(SearchItem sc) {
		this.sc = sc;
	}

	public int gettotalCntR() {
		return totalCntR;
	}

	public void settotalCntR(int totalCntR) {
		this.totalCntR = totalCntR;
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