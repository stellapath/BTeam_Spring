package com.project.bteam.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.bteam.board.BoardPage;
import com.project.bteam.board.BoardServiceImpl;
import com.project.bteam.board.BoardVO;
import com.project.bteam.common.CommonService;
import com.project.bteam.user.UserServiceImpl;
import com.project.bteam.user.UserVO;

@Controller
public class BoardController {

	@Autowired private BoardServiceImpl service;
	@Autowired private CommonService common;
	@Autowired private BoardPage page;
	
	// 문의하기 화면 요청
	@RequestMapping("/qnaBoard")
	public String qnaList(int board_category, Model model, HttpSession session) {
		List<BoardVO> list = service.boardList(board_category);
		session.setAttribute("list", list);
		model.addAttribute("board_category", board_category);
		return "board/qnaBoard";
	}
			
	// 공지사항 화면 요청
	@RequestMapping("/noticeBoard")
	public String boardList(Model model, int board_category, HttpSession session,
							@RequestParam(defaultValue="1") int curPage) {	
		// 카테고리 : 0 => 공지사항
		List<BoardVO> list = service.boardList(board_category);
		session.setAttribute("list", list);
		
		page.setBoard_category(board_category);
		
		page.setCurPage(curPage);
		model.addAttribute("page", service.boardList(board_category, page));
		return "board/noticeBoard";
	}
	
	// 공지글 상세보기 화면 요청
	@RequestMapping("/boardView")
	public String boardView(Model model, int board_num, int board_category, HttpSession session) {
		//조회수 증가
		service.boardReadCnt(board_num);
		//해당 공지글 상세보기
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("board_num", board_num);
		map.put("board_category", board_category);
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
	public String boardWriteReq(BoardVO bvo, MultipartFile file, 
								HttpSession session, HttpServletRequest request) {
		UserVO user = (UserVO)session.getAttribute("login_info");
		bvo.setBoard_email(user.getUser_email());
		if(!file.isEmpty()) {
			bvo.setBoard_filename(file.getOriginalFilename());
			bvo.setBoard_filepath(common.upload("board", file, session));
		}
		String msg = "<script type='text/javascript'>";
		if(service.boardWrite(bvo)) {
			msg += "alert('글이 등록되었습니다.'); ";
			msg	+= "location='" + request.getContextPath() + "/noticeBoard?board_category=0'";
		}else {
			msg += "alert('글 등록에 실패했습니다.');";
		}	
		msg += "</script>";
		return msg;
	}
	
	//첨부파일 다운로드
	@RequestMapping("/download")
	public void download(int board_num, int board_category, 
						HttpSession session, HttpServletResponse response) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("board_num", board_num);
		map.put("board_category", board_category);
		BoardVO bvo = service.boardDetail(map);
		common.download(bvo.getBoard_filename(), bvo.getBoard_filepath(), session, response);
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
	@ResponseBody @RequestMapping(value="/boardUpdateReq", produces="text/html; charset=utf-8")
	public String boardUpdate(BoardVO bvo, HttpServletRequest request) {
		String msg = "<script type='text/javascript'>";
		if(service.boardUpdate(bvo)) {
			msg += "alert('글이 수정되었습니다.'); ";
			msg	+= "location='" + request.getContextPath() + "/noticeBoard?board_category=0'";
		}else {
			msg += "alert('글 수정에 실패했습니다.');";
		}	
		msg += "</script>";
		return msg;
	}
	
	// 글 삭제 처리 요청
	@RequestMapping("/boardDelete")
	public String boardDelete(int board_num) {
		service.boardDelete(board_num);
		return "redirect:noticeBoard?board_category=0";
	}
}
