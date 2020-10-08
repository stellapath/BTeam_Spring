package com.project.bteam.controller;

import java.io.File;
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
				
	// 공지사항 화면 요청
	@RequestMapping("/noticeBoard")
	public String boardList(int board_category, String search, String keyword,
							HttpSession session, Model model, 
							@RequestParam(defaultValue="1") int curPage) {
		session.setAttribute("menu", "notice");
		
		// 카테고리 : 0 => 공지사항
		
		page.setCurPage(curPage);
		page.setBoard_category(board_category);
		page.setSearch(search);
		page.setKeyword(keyword);
		model.addAttribute("page", service.boardList(board_category, page));
		return "board/noticeBoard";
	}
	
	// 공지글 상세보기 화면 요청
	@RequestMapping("/boardView")
	public String boardView(Model model, int board_num) {
		//조회수 증가
		service.boardReadCnt(board_num);
		//해당 공지글 상세보기
		model.addAttribute("crlf", "\r\n");
		model.addAttribute("lf", "\n");
		model.addAttribute("bvo", service.boardDetail(board_num));
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
	public void download(int board_num, HttpSession session, HttpServletResponse response) {
		BoardVO bvo = service.boardDetail(board_num);
		common.download(bvo.getBoard_filename(), bvo.getBoard_filepath(), session, response);
	}
	
	// 글 수정 화면 요청
	@RequestMapping("/boardUpdate")
	public String boardUpdate(Model model, int board_num) {
		model.addAttribute("bvo", service.boardDetail(board_num));
		return "board/boardUpdate";
	}
	
	// 글 수정 업로드 요청
	@RequestMapping("/boardUpdateReq")
	public String boardUpdate(BoardVO bvo, String attach, Model model,
								MultipartFile file, HttpSession session) {
		BoardVO board = service.boardDetail(bvo.getBoard_num());
		String uuid = session.getServletContext().getRealPath("resources") + board.getBoard_filepath();
		if(!file.isEmpty()) {
			//▼새로운 파일을 업로드 하는 경우
			//기존파일 없음 >> 추가 
			//기존파일 있음 >> 변경
			
			//새로운 파일 업로드
			bvo.setBoard_filename(file.getOriginalFilename());
			bvo.setBoard_filepath(common.upload("board", file, session));
			//기존파일 삭제
			if(board.getBoard_filename() != null) {
				File f = new File(uuid);
				if(f.exists()) f.delete();
			}
		}else {
			//▼새로운 파일을 업로드를 하지 않는 경우
			//기존파일 없음
			//기존파일 있음 >> 삭제
			//기존파일 유지
			if(attach.isEmpty()) {
				if(board.getBoard_filename() != null) {
					//기존파일 삭제
					File f = new File(uuid);
					if(f.exists()) f.delete();
				}	
			}else {
				//기존파일 유지
				bvo.setBoard_filename(board.getBoard_filename());
				bvo.setBoard_filepath(board.getBoard_filepath());
			}	
		}

		service.boardUpdate(bvo);
		return "redirect:reviewBoard?board_category=1";
	}
	
	// 글 삭제 처리 요청
	@RequestMapping("/boardDelete")
	public String boardDelete(int board_num) {
		service.boardDelete(board_num);
		return "redirect:noticeBoard?board_category=0";
	}
}
