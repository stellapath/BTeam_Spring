package com.project.bteam.order;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bteam.board.BoardPage;
import com.project.bteam.order.OrderVO;

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
		return dao.orderDelete(order_num);
	}

	//리뷰미작성 주문내역 조회
	@Override
	public List<OrderVO> orderReviewHistory(String order_email) {
		return dao.orderReviewHistory(order_email);
	}

	@Override
	public void orderReviewUpdate(HashMap<String, Integer> map) {
		dao.orderReviewUpdate(map);
	}

	@Override
	public List<OrderVO> productList() {
		return dao.productList();
	}
	
	@Override
	public BoardPage orderAdminList(BoardPage page) {
		return dao.orderAdminList(page);
	}

	@Override
	public void productAdd(OrderVO vo) {
		dao.productAdd(vo);
	}

	@Override
	public int productDelete(String p_num) {
		return dao.productDelete(p_num);
	}

	@Override
	public int productUpdate(OrderVO vo) {
		return dao.productUpdate(vo);
	}

}
