package com.project.bteam.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	// 이메일 중복 확인
	@RequestMapping("/emailCheck")
	public String emailCheck(String user_email, Model model) {
		int result = service.user_email_check(user_email);
		model.addAttribute("result", result);
		return "user/emailCheck";
	}
	
	// 회원가입 처리 요청
	@RequestMapping("/signupReq")
	public String singupReq(UserVO vo, Model model) {
		int result = service.user_signup(vo);
		model.addAttribute("result", result);
		return "user/signupReq";	// <--------나중에 로그인 화면으로 연결할 것
	}
	
	// 로그인 화면 요청
	@RequestMapping("/login")
	public String login() {
		return "user/login";
	}
	
	// 로그인 처리 요청
	@RequestMapping("/loginReq")
	public String loginReq(UserVO vo, HttpSession session) {
		UserVO result = service.user_login(vo);
		if (result != null) session.setAttribute("login_info", result);
		return "redirect:/";
	}
	
	// 로그아웃 처리 요청
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("login_info");
		return "redirect:/";
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
