package com.bteam.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bteam.app.dto.MemberVO;

@Controller
public class JinController {
	
	//회원가입처리 요청(VO)
	@RequestMapping("/joinRequest")
	public String join(MemberVO vo, Model model) {
		model.addAttribute("vo", vo);		//가져온 데이터를 모델에 담기 - 출력화면에서 주소를 찾아야함
		model.addAttribute("method", "데이터객체(VO)");		//가져온 데이터를 모델에 담기
		return "";	
	}
	
	//회원가입화면 요청
	@RequestMapping("/join")
	public String member() {
		return "member/join";
	}
}
