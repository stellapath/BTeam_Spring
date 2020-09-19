package com.project.bteam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	// 메인
	@RequestMapping("/home")
	public String index() {
		return "main";
	}
	
	// 회사소개
	@RequestMapping("/companyPage")
	public String company() {
		return "page/company";
	}
		
	// 제품소개
	@RequestMapping("/productPage")
	public String product() {
		return "page/product";
	}
	
	// 주문페이지
	@RequestMapping("/orderPage")
	public String order() {
		return "page/order";
	}
	
}
