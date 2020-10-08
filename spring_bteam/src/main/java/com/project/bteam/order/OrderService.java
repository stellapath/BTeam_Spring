package com.project.bteam.order;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.project.bteam.board.BoardPage;

public interface OrderService {
	OrderVO orderInsert(OrderVO vo);
	BoardPage orderList(BoardPage page);
	OrderVO orderDetail(int order_num);
	int orderDelete(int order_num);
	
	//리뷰작성 가능한 주문내역 조회
	List<OrderVO> orderReviewHistory(String order_email);
	//리뷰업로드시 리뷰작성여부 업데이트
	void orderReviewUpdate(int order_num);

}
