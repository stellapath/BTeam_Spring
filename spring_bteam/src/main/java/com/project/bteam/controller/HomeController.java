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
	
}
