package com.project.bteam.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AndroidController {
	
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
