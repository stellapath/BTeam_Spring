package com.project.bteam.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.bteam.order.OrderServiceImpl;

@Controller
public class HomeController {
	@Autowired private OrderServiceImpl order;
	
	// 메인
	@RequestMapping(value={"/home", "/"})
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
	
	// 제품상세소개
	@RequestMapping("/productDetail")
	public String productDetail(Model model, HttpSession session) {
		session.setAttribute("menu", "product");
		model.addAttribute("product", order.productList());
		return "page/productDetail";
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
