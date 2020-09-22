package com.project.bteam.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.bteam.user.UserServiceImpl;
import com.project.bteam.user.UserVO;

@Controller
public class AdminController {
	@Autowired private UserServiceImpl user;
	
	//
	
	// 문의관리 페이지 요청
	@RequestMapping("/qnaList")
	public String qnaList() {
		return "admin/userList";
	}
	
	// 주문관리 페이지 요청
	@RequestMapping("/orderList")
	public String orderList() {
		return "admin/userList";
	}
		
	// 회원관리 페이지 요청
	@RequestMapping("/userList")
	public String userList(Model model, HttpSession session) {
		List<UserVO> list = user.userList();
		model.addAttribute("list", list);
		return "admin/userList";
	}
	
	// 관리자페이지 요청
	@RequestMapping("/adminPage")
	public String adminPage() {
		return "admin/adminPage";
	}

}
