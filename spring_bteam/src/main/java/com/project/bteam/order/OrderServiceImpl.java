package com.project.bteam.order;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bteam.board.BoardPage;

@Service
public class OrderServiceImpl implements OrderService{
	@Autowired private OrderDAO dao;

	@Override
	public OrderVO orderInsert(OrderVO vo) {
		return dao.orderInsert(vo);
	}

	@Override
	public BoardPage orderList(BoardPage page) {
		return dao.orderList(page);
	}
		
	@Override
	public OrderVO orderDetail(int order_num) {
		return dao.orderDetail(order_num);
	}

	@Override
	public int orderDelete(int order_num) {
		return 0;
	}

	//리뷰미작성 주문내역 조회
	@Override
	public List<OrderVO> orderReviewHistory(String order_email) {
		return dao.orderReviewHistory(order_email);
	}

	@Override
	public void orderReviewUpdate(int order_num) {
		dao.orderReviewUpdate(order_num);
	}

}
