package com.project.bteam.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.bteam.board.BoardServiceImpl;
import com.project.bteam.board.BoardVO;
import com.project.bteam.common.CommonService;

@Controller
public class BoardController {

	@Autowired private BoardServiceImpl service;
	@Autowired private CommonService common;
	
	// 공지사항 화면 요청
	@RequestMapping("/noticeBoard")
	public String boardList(Model model) {
		// 카테고리 : 0 => 공지사항
		List<BoardVO> list = service.boardList(0);
		model.addAttribute("boardList", list);
		return "board/noticeBoard";
	}
	
	// 글 작성 화면 요청
	@RequestMapping("/boardWrite")
	public String boardWrite(int category, Model model) {
		model.addAttribute("category", category);
		return "board/boardWrite";
	}
	
	// 글 작성 처리 요청
	@RequestMapping("/boardWriteReq")
	public String boardWriteReq(BoardVO vo) {
		return "";
	}
	
}
