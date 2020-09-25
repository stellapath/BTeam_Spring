package com.project.bteam.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.bteam.common.CommonService;
import com.project.bteam.qna.QnaPage;
import com.project.bteam.qna.QnaServiceImpl;

@Controller
public class QnaController {
	
	@Autowired private QnaServiceImpl service;
	@Autowired private CommonService common;
	@Autowired private QnaPage page;
	
	// 문의하기 화면 요청
	@RequestMapping("/qnaBoard")
	public String qnaList(Model model, HttpSession session,
						@RequestParam(defaultValue = "1") int curPage) {
		page.setCurPage(curPage);
		model.addAttribute("page", service.qnaList(page));
		
		return "qna/qnaBoard";
	}
}
