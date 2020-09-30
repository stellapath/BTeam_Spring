package com.project.bteam.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.bteam.board.BoardVO;
import com.project.bteam.common.CommonService;
import com.project.bteam.qna.QnaPage;
import com.project.bteam.qna.QnaServiceImpl;
import com.project.bteam.qna.QnaVO;
import com.project.bteam.user.UserVO;

@Controller
public class QnaController {
	
	@Autowired private QnaServiceImpl service;
	@Autowired private CommonService common;
	@Autowired private QnaPage page;
	
	// 신규문의글 저장처리 요청
	@RequestMapping(value="/qnaWriteReq", produces="text/html; charset=utf-8")
	public String qnaList(QnaVO qvo, MultipartFile file, HttpSession session, HttpServletRequest request) {
		// 화면에서 입력한 공지글정보를 DB에 저장한 후
		UserVO user = (UserVO)session.getAttribute("login_info");

		// 첨부파일이 있는 경우 파일정보를 데이터객체에 담는다
		if (!file.isEmpty()) {
			qvo.setQna_filename(file.getOriginalFilename());
			qvo.setQna_filepath(common.upload("qna", file, session));
		}
		service.qnaWrite(qvo);
		
		// 목록화면으로 연결
		return "redirect:/qnaBoard";
	}
	
	// 나의 문의내역 화면 요청
	@RequestMapping("/myQna")
	public String myQna() {
		return "qna/myQna";
	}
	
	// 일대일 문의글 화면 요청
	@RequestMapping("/qnaWrite")
	public String qnaWrite() {
		return "qna/qnaWrite";
	}
			
	// 문의하기 화면 요청
	@RequestMapping("/qnaBoard")
	public String qnaList(Model model, HttpSession session,
						@RequestParam(defaultValue = "1") int curPage) {
		session.setAttribute("menu", "qna");
		page.setCurPage(curPage);
		
		model.addAttribute("page", service.qnaList(page));
		
		return "qna/qnaBoard";
	}
	
//	//첨부파일 다운로드
//	@RequestMapping("/download")
//	public void download(int qna_num, HttpSession session, HttpServletResponse response) {
//		HashMap<String, Integer> map = new HashMap<String, Integer>();
//		map.put("board_num", qna_num);
//		QnaVO qvo = service.qnaDetail(map);
//		common.download(qvo.getQna_filename(), qvo.getQna_filepath(), session, response);
//	}
	
}


