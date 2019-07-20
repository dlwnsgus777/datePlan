package com.work.cmmn;

public class datePlanVO {
	private int page 			= 1;	// 현재 페이지
	private int rows 			= 10;	// 한 페이지 row 수 
	private int scale 			= 5;	
	private int scaleStartPage	= 1;	// scale 시작 페이지
	private int scateEndPage	= 1;	// scale 끝 페이지
	private int prevPage		= 0;	// 이전 페이지
	private int nextPage		= 0;	// 다음 페이지
	
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
	public int getScateEndPage() {
		return scateEndPage;
	}
	public void setScateEndPage(int scateEndPage) {
		this.scateEndPage = scateEndPage;
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
}
