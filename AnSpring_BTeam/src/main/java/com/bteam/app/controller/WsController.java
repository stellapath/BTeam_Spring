package com.bteam.app.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bteam.app.dao.UserDAO;
import com.bteam.app.vo.UserVO;

@Controller
public class WsController {

	// 메인
	@RequestMapping(value = "/")
	public String index(HttpServletRequest request, Model model) {

		return "main";
	}
	
	// 안드로이드 회원가입
	@RequestMapping(value = "/andSignUp", method = RequestMethod.GET)
	public String androidSignUp(HttpServletRequest request, Model model) {

		UserDAO dao = new UserDAO();
		UserVO dto = new UserVO();
		
		dto.setUser_id(request.getParameter("user_id"));
		dto.setUser_pw(request.getParameter("user_pw"));
		dto.setUser_name(request.getParameter("user_name"));
		dto.setUser_nickname(request.getParameter("user_nickname"));
		dto.setUser_email(request.getParameter("user_email"));
		dto.setUser_phone(request.getParameter("user_phone"));
		dto.setUser_birth(request.getParameter("user_birth"));
		dto.setUser_key(dao.getKey(false, 20));
		
		int succ = dao.userSignUp(dto);
		
		model.addAttribute("succ", succ);
		
		return "app/andSignUp";
	}
	
	// 안드로이드 로그인
	@RequestMapping(value = "/andLogin", method = RequestMethod.GET)
	public String androidLogIn(HttpServletRequest request, Model model) {

		UserDAO dao = new UserDAO();
		
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		
		UserVO dto = dao.userLogIn(user_id, user_pw);
		
		model.addAttribute("dto", dto);
		
		return "app/andLogin";
	}
	
}
