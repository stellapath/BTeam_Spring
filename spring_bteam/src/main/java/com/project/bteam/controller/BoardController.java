package com.project.bteam.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
	
	// 글 작성 업로드 요청
	@ResponseBody @RequestMapping(value="/boardWriteReq", produces="text/html; charset=utf-8")
	public String boardWriteReq(BoardVO bvo, HttpServletRequest request) {
		String msg = "<script type='text/javascript'>";
		if(service.boardWrite(bvo)) {
			msg += "alert('글이 등록되었습니다.'); location='" + request.getContextPath() + "/home'";
		}else {
			msg += "alert('글 등록에 실패했습니다.');";
		}	
		msg += "</script>";
		return msg;
	}
	
	// 글 수정 화면 요청
	@RequestMapping("/boardUpdate")
	public String boardUpdate(Model model, int board_num, int board_category) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("board_num", board_num);
		map.put("board_category", board_category);
		model.addAttribute("bvo", service.boardDetail(map));
		return "board/boardUpdate";
	}
	
	// 글 수정 업로드 요청
	@RequestMapping("/boardUpdateReq")
	public String boardUpdate(BoardVO bvo) {
		service.boardUpdate(bvo);
		return "";
	}
	
	// 글 삭제 처리 요청
	@RequestMapping("/boardDelete")
	public String boardDelete(int board_num) {
		service.boardDelete(board_num);
		return "redirect:noticeBoard?board_category=0";
	}
}
