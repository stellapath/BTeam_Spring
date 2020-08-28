package com.project.bteam.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.bteam.service.UserServiceImpl;
import com.project.bteam.vo.UserVO;

@Controller
public class WsController {
	
	@Autowired 
	private UserServiceImpl service;
	
	// 메인
	@RequestMapping("/")
	public String index() {
		return "main";
	}
	
	// 회원가입 화면 요청
	@RequestMapping("/signup")
	public String signup() {
		return "user/signup";
	}
	
	// 회원가입 처리 요청
	@RequestMapping("/signupReq")
	public String singupReq(UserVO vo, Model model) {
		boolean isSignup = service.user_signup(vo);
		if (isSignup) model.addAttribute("signup", "회원가입성공");
		else model.addAttribute("signup", "회원가입실패");
		return "user/signupReq";
	}
	
	// 안드로이드 회원가입
	@RequestMapping("/andSignup")
	public String androidSignup(HttpServletRequest request, Model model) {
		return "app/andSignup";
	}
	
	// 안드로이드 로그인
	@RequestMapping("/andLogin")
	public String androidLogIn(HttpServletRequest request, Model model) {
		return "app/andLogin";
	}
}
