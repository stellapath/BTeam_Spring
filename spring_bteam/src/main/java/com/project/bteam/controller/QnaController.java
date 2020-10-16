package com.project.bteam.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	
	// 내 문의내역조회
	@RequestMapping("/myQna")
	public String myQna(String user_email, Model model, HttpSession session,
			@RequestParam(defaultValue="10") int pageList,
			@RequestParam(defaultValue="1") int curPage) {
		session.setAttribute("mypage", "qna");
		page.setCurPage(curPage);
		page.setPageList(pageList);
		page.setKeyword(user_email);
		
		model.addAttribute("crlf", "\r\n" );
		model.addAttribute("lf", "\n" );
		model.addAttribute("page", service.myqnaList(page));
		return "user/myQna";
	}
	
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
		
		model.addAttribute("crlf", "\r\n" );
		model.addAttribute("lf", "\n" );
		model.addAttribute("page", service.qnaList(page));
		
		return "qna/qnaBoard";
	}
	
	// 문의관리 페이지 요청
	@RequestMapping("/qnaList")
	public String qnaList1(Model model, HttpSession session,
						@RequestParam(defaultValue = "1") int curPage) {
	session.setAttribute("mypage", "qnaList");
	page.setCurPage(curPage);
	
	model.addAttribute("crlf", "\r\n" );
	model.addAttribute("lf", "\n" );
	model.addAttribute("page", service.qnaList(page));
	
	return "admin/qnaList";
	}
	
	//첨부파일 다운로드
	@RequestMapping("/download.qo")
	public void download(int qna_num, HttpSession session, HttpServletResponse response) {
		QnaVO qvo = service.qnaDetail(qna_num);
		common.download(qvo.getQna_filename(), qvo.getQna_filepath(), session, response);
	}
	
	// 이메일 답변 작성 화면 요청
	@RequestMapping("/emailReply")
	public String emailReply(int qna_num, Model model, HttpSession session) {
		session.setAttribute("menu", "qna");
		
		model.addAttribute("crlf", "\r\n");
		model.addAttribute("lf", "\n");
		model.addAttribute("qvo", service.qnaDetail(qna_num));
		return "qna/emailReply";
	}
	
	// 이메일 답변 전송
	@RequestMapping("/mailAnswer")
	public String sendEmailCertify(QnaVO qvo, HttpSession session, Model model) {
		service.qnaUpdate(qvo);
		QnaVO info = service.qnaDetail(qvo.getQna_num());
		
		common.mailAnswer(info, session);
		return "redirect:qnaList";
	}
	
}


