package com.project.bteam.common;

public class PageVO {
	
	private int pageList = 10;		//한 페이지당 표시되는 글의 수 10개
	private int blockPage= 10;		//하단에 표시되는 페이지 수 10개
	private int totalList; 			//총 목록의 수 : DB에서 읽기
	
	private int totalPage;			//총 페이지수
	private int totalBlock;			//총 블럭의 수
	
	private int curPage;			//현재페이지
	private int beginList, endList;  //현재 페이지에 보여질 목록의 시작과 끝
	private int curBlock, beginPage, endPage;  //현재 블럭에 보여질 페이지의 시작과 끝
	
	private int board_category;
	
	//검색조건, 검색어
	private String search, keyword;
	
	private String viewType="list";		//리뷰글 형식
	private String recommend="all";//추천여부
			
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getViewType() {
		return viewType;
	}
	public void setViewType(String viewType) {
		this.viewType = viewType;
	}
	public String getRecommend() {
		return recommend;
	}
	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}
	public int getBoard_category() {
		return board_category;
	}
	public void setBoard_category(int board_category) {
		this.board_category = board_category;
	}
	public int getPageList() {
		return pageList;
	}
	public void setPageList(int pageList) {
		this.pageList = pageList;
	}
	public int getBlockPage() {
		return blockPage;
	}
	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}
	public int getTotalList() {
		return totalList;
	}
	public void setTotalList(int totalList) {
		this.totalList = totalList;
		//DB에서 조회하여 총 목록수(totalList)에 따라 총 페이지수(totalPage)가 결정
		totalPage = totalList / pageList;
		if( totalList % pageList > 0 ) ++totalPage;
		
		//총 페이지수(totalPage)에 따라 총 블럭수(totalBlock)가 결정
		totalBlock = totalPage / blockPage;
		if( totalPage % blockPage > 0 ) ++totalBlock;
		
		//현재 페이지에 따라 보여질 목록의 번호가 결정됨
		endList = totalList - pageList * (curPage - 1);
		beginList = endList - (pageList - 1);
		
		//현재 블럭에 따라 보여질 페이지 번호가 결정됨
		curBlock = curPage / blockPage;
		if(curPage % blockPage > 0 ) ++curBlock;
		
		endPage = blockPage * curBlock;
		beginPage = endPage - (blockPage - 1);
		
		//endPage는 총 페이지수보다 클 수 없다
		if(endPage > totalPage) endPage = totalPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalBlock() {
		return totalBlock;
	}
	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}
	public int getCurPage() {
		return curPage;
	}
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	public int getBeginList() {
		return beginList;
	}
	public void setBeginList(int beginList) {
		this.beginList = beginList;
	}
	public int getEndList() {
		return endList;
	}
	public void setEndList(int endList) {
		this.endList = endList;
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
	public int getCurBlock() {
		return curBlock;
	}
	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}
	
}
