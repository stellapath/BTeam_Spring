package com.project.bteam.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.bteam.board.BoardServiceImpl;
import com.project.bteam.board.BoardVO;
import com.project.bteam.common.CommonService;

@Controller
public class BoardController {

	@Autowired private BoardServiceImpl service;
	@Autowired private CommonService common;
	
	// 공지사항 화면 요청
	@RequestMapping("/noticeBoard")
	public String boardList(Model model, int board_category, HttpSession session) {
		// 카테고리 : 0 => 공지사항
		List<BoardVO> list = service.boardList(board_category);
		session.setAttribute("list", list);
		model.addAttribute("boardList", list);
		return "board/noticeBoard";
	}
	
	// 공지글 상세보기 화면 요청
	@RequestMapping("/boardView")
	public String boardView(Model model, int board_num, int board_category, HttpSession session) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("board_num", board_num);
		map.put("board_category", board_category);
		service.boardDetail(map);
		BoardVO bvo = service.boardDetail(map);
		session.setAttribute("boardList", bvo);
		model.addAttribute("bvo", service.boardDetail(map));
		return "board/boardView";
	}
	
	// 글 작성 화면 요청
	@RequestMapping("/boardWrite")
	public String boardWrite(int board_category, Model model) {
		model.addAttribute("board_category", board_category);
		return "board/boardWrite";
	}
	
	// 글 작성 처리 요청
	@RequestMapping("/boardWriteReq")
	public String boardWriteReq(BoardVO bvo, Model model) {
		int result = service.boardWrite(bvo);
		model.addAttribute("result", result);
		return "board/boardWriteReq";
	}
	
	// 글 수정 화면 요청
	@RequestMapping("/boardModify")
	public String boardModify(Model model, int board_num, int board_category) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("board_num", board_num);
		map.put("board_category", board_category);
		model.addAttribute("bvo", service.boardDetail(map));
		return "board/boardModify";
	}
	
	// 글 삭제 처리 요청
	@RequestMapping("/boardDelete")
	public String boardDelete(int board_num) {
		service.boardDelete(board_num);
		return "redirect:noticeBoard?board_category=0";
	}
}
