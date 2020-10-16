package com.project.bteam.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.bteam.board.BoardPage;
import com.project.bteam.order.OrderServiceImpl;
import com.project.bteam.order.OrderVO;
import com.project.bteam.user.UserServiceImpl;
import com.project.bteam.user.UserVO;

@Controller
public class AdminController {
	@Autowired private UserServiceImpl user;
	@Autowired private BoardPage page; 
	@Autowired private OrderServiceImpl order;
	
	// 등록제품 수정처리 요청
	@RequestMapping("/productUpdate")
	public String productUpdate(OrderVO vo) {
		order.productUpdate(vo);
		return "redirect:productList";
	}
		
	// 등록제품 삭제처리 요청
	@ResponseBody @RequestMapping("/productDelete")
	public void productDelete(String p_num) {
		order.productDelete(p_num);
	}
	
	// 판매제품 등록처리 요청
	@RequestMapping("/productAdd")
	public String productAdd(OrderVO vo) {
		order.productAdd(vo);
		return "redirect:productList";
	}
	
	// 판매제품관리 페이지 요청
	@RequestMapping("/productList")
	public String productList(Model model, HttpSession session) {
		session.setAttribute("mypage", "productList");
		model.addAttribute("product", order.productList());
		return "admin/productList";
	}
	
	// 주문취소 처리요청
	
	// 주문관리 페이지 요청
	@RequestMapping("/orderList")
	public String orderList(Model model, HttpSession session,
							@RequestParam(defaultValue="all") String orderStatus,
							String keyword,
							@RequestParam(defaultValue="10") int pageList,
							@RequestParam(defaultValue="1") int curPage) {
		session.setAttribute("mypage", "orderList");
		page.setOrderStatus(orderStatus);
		page.setKeyword(keyword);
		page.setCurPage(curPage);
		page.setPageList(pageList);
		model.addAttribute("page", order.orderAdminList(page));
		return "admin/orderList";
	}
		
	// 회원관리 페이지 요청
	@RequestMapping("/userList")
	public String userList(Model model, HttpSession session) {
		session.setAttribute("mypage", "userList");
		List<UserVO> list = user.userList();
		model.addAttribute("list", list);
		return "admin/userList";
	}
	
	// 관리자페이지 요청
	@RequestMapping("/adminPage")
	public String adminPage(HttpSession session) {
		session.setAttribute("menu", "admin");
		return "admin/adminPage";
	}

}
