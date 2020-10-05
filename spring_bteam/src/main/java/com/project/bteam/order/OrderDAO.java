package com.project.bteam.order;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.bteam.board.BoardPage;

@Repository
public class OrderDAO implements OrderService{
	@Autowired private SqlSession sql;

	@Override
	public OrderVO orderInsert(OrderVO vo) {
		sql.insert("order.insert", vo);
		int order_num = sql.selectOne("order.returnOrderNum", vo);
		return sql.selectOne("order.detail", order_num);
	}

	@Override
	public BoardPage orderList(BoardPage page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OrderVO orderDetail(int order_num) {
		return sql.selectOne("order.detail", order_num);
	}

	@Override
	public int orderDelete(int order_num) {
		// TODO Auto-generated method stub
		return 0;
	}

	
}
