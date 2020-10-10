package com.project.bteam.order;

import java.util.HashMap;
import java.util.List;

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
		page.setTotalList((Integer)sql.selectOne("order.total", page));
		page.setList(sql.selectList("order.list", page));
		return page;
	}

	@Override
	public OrderVO orderDetail(int order_num) {
		return sql.selectOne("order.detail", order_num);
	}

	@Override
	public int orderDelete(int order_num) {
		return sql.delete("order.delete", order_num);
	}

	@Override
	public List<OrderVO> orderReviewHistory(String order_email) {
		return sql.selectList("order.review_history", order_email);
	}

	@Override
	public void orderReviewUpdate(HashMap<String, Integer> map) {
		sql.update("order.review_update", map);
	}

	@Override
	public BoardPage orderAdminList(BoardPage page) {
		page.setTotalList((Integer)sql.selectOne("order.adminTotal", page));
		page.setList(sql.selectList("order.adminList", page));
		return page;
	}

	@Override
	public List<OrderVO> productList() {
		return sql.selectList("order.productList");
	}

	@Override
	public void productAdd(OrderVO vo) {
		sql.insert("order.productAdd", vo);
	}

	@Override
	public int productDelete(String p_num) {
		return sql.delete("order.productDelete", p_num);
	}

	@Override
	public int productUpdate(OrderVO vo) {
		return sql.update("order.productUpdate", vo);
	}

	
}
