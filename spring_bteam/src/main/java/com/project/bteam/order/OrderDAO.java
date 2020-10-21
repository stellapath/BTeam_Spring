package com.project.bteam.order;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

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
		Date now = new Date();
		SimpleDateFormat today = new SimpleDateFormat("yyMMdd");
		
		String order_num;
		int count = (Integer)sql.selectOne("order.todayOrder");
		if( count == 0) {		order_num = today.format(now) + String.format("%03d", count+1);		}
		else {		 order_num = Integer.toString((Integer)sql.selectOne("order.todayLostOrder") + 1);}
		vo.setOrder_num(order_num);
		
		sql.insert("order.insert", vo);
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

	@Override
	public String orderReviewProduct(int board_num) {
		return sql.selectOne("order.reviewProduct", board_num);
	}

	@Override
	public OrderVO productDetail(String p_num) {
		return sql.selectOne("order.productDetail", p_num);
	}

	@Override
	public List<OrderVO> nonMemberList(HashMap<String, String> map) {
		return sql.selectList("order.nonMemberList", map);
	}


	
}
