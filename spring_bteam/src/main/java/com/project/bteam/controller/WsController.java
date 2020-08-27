package com.project.bteam.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.bteam.dao.UserDAO;
import com.project.bteam.vo.UserVO;

@Controller
public class WsController {
	// 메인
	@RequestMapping("/")
	public String index(HttpServletRequest request, Model model) {

		return "main";
	}
	
	// 안드로이드 회원가입
	@RequestMapping("/andSignUp")
	public String androidSignUp(HttpServletRequest request, Model model) {

		UserDAO dao = new UserDAO();
		UserVO vo = new UserVO();
		
		vo.setUser_id(request.getParameter("user_id"));
		vo.setUser_pw(request.getParameter("user_pw"));
		vo.setUser_name(request.getParameter("user_name"));
		vo.setUser_nickname(request.getParameter("user_nickname"));
		vo.setUser_email(request.getParameter("user_email"));
		vo.setUser_phone(request.getParameter("user_phone"));
		vo.setUser_birth(request.getParameter("user_birth"));
		vo.setUser_key(dao.getKey(false, 20));
		
		int succ = dao.userSignUp(vo);
		
		model.addAttribute("succ", succ);
		
		return "app/andSignUp";
	}
	
	// 안드로이드 로그인
	@RequestMapping("/andLogin")
	public String androidLogIn(HttpServletRequest request, Model model) {

		UserDAO dao = new UserDAO();
		
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		
		UserVO dto = dao.userLogIn(user_id, user_pw);
		
		model.addAttribute("dto", dto);
		
		return "app/andLogin";
	}
}
