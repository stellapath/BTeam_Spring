package com.project.bteam.order;

import com.project.bteam.board.BoardPage;

public interface OrderService {
	OrderVO orderInsert(OrderVO vo);
	BoardPage orderList(BoardPage page);
	OrderVO orderDetail(int order_num);
	int orderDelete(int order_num);
}
