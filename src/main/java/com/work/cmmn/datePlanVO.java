package com.work.cmmn;

public class datePlanVO {
	private int page 			= 1;	// 현재 페이지
	private int rows 			= 5;	// 한 페이지 row 수 
	private int scale 			= 5;	
	private int scaleStartPage	= 1;	// scale 시작 페이지
	private int scaleEndPage	= 1;	// scale 끝 페이지
	private int prevPage		= 0;	// 이전 페이지
	private int nextPage		= 0;	// 다음 페이지
	private int totPage			= 1;	// 전체 페이지
	private int totCnt			= 0;	// 전체 게시글 갯수
	
	@Override
	public String toString() {
		return "datePlanVO [page=" + page + ", rows=" + rows + ", scale=" + scale + ", scaleStartPage=" + scaleStartPage
				+ ", scaleEndPage=" + scaleEndPage + ", prevPage=" + prevPage + ", nextPage=" + nextPage + ", totPage="
				+ totPage + ", totCnt=" + totCnt + "]";
	}
	
	public int getTotPage() {
		return totPage;
	}
	public void setTotPage(int totPage) {
		this.totPage = totPage;
	}
	public int getTotCnt() {
		return totCnt;
	}
	public void setTotCnt(int totCnt) {
		this.totCnt = totCnt;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public int getScale() {
		return scale;
	}
	public void setScale(int scale) {
		this.scale = scale;
	}
	public int getScaleStartPage() {
		return scaleStartPage;
	}
	public void setScaleStartPage(int scaleStartPage) {
		this.scaleStartPage = scaleStartPage;
	}
	public int getScaleEndPage() {
		return scaleEndPage;
	}

	public void setScaleEndPage(int scaleEndPage) {
		this.scaleEndPage = scaleEndPage;
	}

	public int getPrevPage() {
		return prevPage;
	}
	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	
	public void setDatePlanInfo(datePlanVO datePlanVO) {
		int totPage		= datePlanVO.getTotPage();		// 총 페이지 수
			
		int nowScale 	= (this.page - 1) / this.scale + 1,		// 현재 위치한 스케일
			startPage	= (nowScale - 1) * this.scale + 1,	// 스케일 시작 페이지
			endPage		= startPage + this.scale - 1;		// 스케일 끝 페이지
			
			endPage			= (endPage > totPage) ? totPage : endPage;
			
		int prevPage	= startPage - 1,	// 이전 페이지
			nextPage	= endPage + 1;		// 다음 페이지
			
		this.scaleStartPage = startPage;
		this.scaleEndPage 	= endPage;
		this.prevPage	    = prevPage;
		this.nextPage 		= nextPage;
		this.totCnt 		= datePlanVO.getTotCnt();
		this.totPage 		= totPage;
	}
}
