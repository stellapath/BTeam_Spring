package com.project.bteam.order;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.project.bteam.board.BoardPage;

public interface OrderService {
	
	List<OrderVO> productList();//제품리스트 조회
	
	OrderVO orderInsert(OrderVO vo);
	BoardPage orderList(BoardPage page);
	OrderVO orderDetail(int order_num);
	int orderDelete(int order_num);
	
	//리뷰작성
	List<OrderVO> orderReviewHistory(String order_email);	//리뷰작성 가능한 주문내역 조회
	void orderReviewUpdate(HashMap<String, Integer> map);	//리뷰업로드시 리뷰작성여부 업데이트
	String orderReviewProduct(int board_num);				//리뷰작성시 제품명 조회
	
	//관리자모드
	BoardPage orderAdminList(BoardPage page);				//주문내역 조회
	void productAdd(OrderVO vo);							//판매제품등록
	OrderVO productDetail(String p_num);					//판매제품정보조회
	int productDelete(String p_num);						//판매제품삭제
	int productUpdate(OrderVO vo);							//판매제품수정
	
	//비회원주문내역조회
	List<OrderVO> nonMemberList(HashMap<String, String> map);
}
