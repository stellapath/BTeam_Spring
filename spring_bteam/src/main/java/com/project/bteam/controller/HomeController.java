package com.project.bteam.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	// 메인
	@RequestMapping("/home")
	public String index(HttpSession session) {
		session.removeAttribute("menu");
		return "main";
	}
	
	// 회사소개
	@RequestMapping("/companyPage")
	public String company(HttpSession session) {
		session.setAttribute("menu", "company");
		return "page/company";
	}
		
	// 제품소개
	@RequestMapping("/productPage")
	public String product(HttpSession session) {
		session.setAttribute("menu", "product");
		return "page/product";
	}
	
	// 서비스안내
	@RequestMapping("/serviceNotice")
	public String serviceNotice(HttpSession session) {
		session.setAttribute("menu", "");
		return "page/serviceNotice";	
	}
	// 개인정보처리방침
	@RequestMapping("/termsOfUse")
	public String termsOfUse(HttpSession session) {	
		session.setAttribute("menu", "");
		return "page/termsOfUse";	
	}
	// 이용약관
	@RequestMapping("/privacyPolicy")
	public String privacyPolicy(HttpSession session) {
		session.setAttribute("menu", "");
		return "page/privacyPolicy";	
	}
				
}
