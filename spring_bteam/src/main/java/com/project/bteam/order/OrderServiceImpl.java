package com.project.bteam.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bteam.board.BoardPage;

@Service
public class OrderServiceImpl implements OrderService{
	@Autowired private OrderDAO dao;

	@Override
	public int orderInsert(OrderVO vo) {
		return dao.orderInsert(vo);
	}

	@Override
	public BoardPage orderList(BoardPage page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OrderVO orderDetail(int order_num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int orderDelete(int order_num) {
		// TODO Auto-generated method stub
		return 0;
	}

}
