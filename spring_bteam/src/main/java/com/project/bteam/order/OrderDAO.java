package com.project.bteam.order;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.bteam.board.BoardPage;

@Repository
public class OrderDAO implements OrderService{
	@Autowired private SqlSession sql;

	@Override
	public int orderInsert(OrderVO vo) {
		return sql.insert("order.insert", vo);
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
