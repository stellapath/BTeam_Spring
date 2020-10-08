package com.project.bteam.common;

import java.io.File;
import java.io.FileInputStream;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.EmailAttachment;
import org.apache.commons.mail.HtmlEmail;
import org.apache.commons.mail.MultiPartEmail;
import org.apache.commons.mail.SimpleEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.project.bteam.order.OrderVO;
import com.project.bteam.qna.QnaVO;

@Service
public class CommonService {
	@Autowired private CommonService common;

	// 파일 업로드
	public String upload(String category, MultipartFile file, HttpSession session) {
		String resources = session.getServletContext().getRealPath("resources");
		String upload = resources + "/upload";
		String folder = upload + "/" + category + "/" + new SimpleDateFormat("yyyy/MM/dd").format(new Date());
		File f = new File(folder);
		if (!f.exists()) f.mkdirs();
		String uuid = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
		try {
			file.transferTo(new File(folder, uuid));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return folder.substring(resources.length()) + "/" + uuid;
	}
	
	// 파일 다운로드
	public File download(String board_filename, String board_filepath, HttpSession session, HttpServletResponse response) {
		File file = new File(session.getServletContext().getRealPath("resources") + board_filepath);
		String mime = session.getServletContext().getMimeType(board_filename);
		response.setContentType(mime);
		try {
			board_filename = URLEncoder.encode(board_filename, "utf-8").replaceAll("\\+", "%20");
			response.setHeader("content-disposition", "attachment; filename=" + board_filename);
			ServletOutputStream out = response.getOutputStream();
			FileCopyUtils.copy(new FileInputStream(file), out);
			out.flush();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return file;
	}	
	
	//문의글 답변 발송요청
	@RequestMapping("/mailAnswer")
	public String mailAnswer(String email, String key, HttpSession session, QnaVO vo) {
		common.send_qnaAnswer(vo, session);
		return "";
	}
		
	//문의글 메일전송
	private void send_qnaAnswer(QnaVO vo, HttpSession session) {
		HtmlEmail mail = new HtmlEmail();
		mail.setHostName("smtp.gmail.com");
		mail.setCharset("utf-8");
		mail.setDebug(true);
		mail.setAuthentication("bteamproject0420", "bteam0420");
		mail.setSSLOnConnect(true);
		try {
			mail.setFrom("bteamproject0420@gmail.com", "관리자");
			mail.addTo(vo.getQna_email());
			//메일작성
			mail.setSubject(vo.getQna_nickname() + "님 문의글 답변안내 이메일입니다.");
			StringBuffer msg = new StringBuffer();
			
			/*
			 *		메일내용을 작성하세요
			 */
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	
	//주문서 발송요청
	public void mailOrder(OrderVO vo, HttpSession session) {
		//Html형식의 내용을 갖는 메일:파일첨부가능
		send_ordersheet(vo, session);
	}
	//주문서 메일전송
	private void send_ordersheet(OrderVO vo, HttpSession session) {
		HtmlEmail mail = new HtmlEmail();
		mail.setHostName("smtp.gmail.com");
		mail.setCharset("utf-8");
		mail.setDebug(true);
		mail.setAuthentication("bteamproject0420", "bteam0420");
		mail.setSSLOnConnect(true);
		try {
			mail.setFrom("bteamproject0420@gmail.com", "관리자");					//송신자 정보
			mail.addTo(vo.getOrder_email());										//수신자 정보
			//메일작성
			mail.setSubject(vo.getOrder_name() + "님 주문안내 이메일입니다.");
			StringBuffer msg = new StringBuffer();
			msg.append("<html>");
			msg.append("<body>");
			msg.append("<div style='width:700px; text-align: center;'>");
			msg.append("<img src='http://192.168.0.72:8282/bteam/img/pre_logo.png' style='width: 150px; height: 150px; margin: 0 auto;'/>");
			msg.append("<h3>주문해주셔서 감사합니다.</h3>");
			msg.append("<table style='border: 1px solid #666; width: 100%; margin: 0 auto;'>"
						+ "<tr><td colspan='2' style='padding: 20px; text-align: center; font-size: 15px; background-color: #ededed;'>주문정보</td></tr>" 
						+ "<tr><th style='width: 100px;'>주문번호</th><td>"+ vo.getOrder_num() +"</td></tr>"
						+ "<tr><th>제품명</th><td>★☆분실방지-스마트우산☆★</td></tr>"
						+ "<tr><th>구매수량</th><td>"+ vo.getOrder_count() +"</td></tr>"
						+ "<tr><th>구매금액</th><td>"+ vo.getOrder_amount() +"</td></tr>"
						+ "<tr><th>결제방법</th><td>"+ vo.getOrder_pay() +"</td></tr>"
						+ "<tr><td colspan='2' style='padding: 20px; text-align: center; font-size: 15px; background-color: #ededed;'>주문자정보</th></tr>"
						+ "<tr><th>이름</th><td>"+ vo.getOrder_name() +"</td></tr>"
						+ "<tr><th>전화번호</th><td>"+ vo.getOrder_phone() +"</td></tr>" 
						+ "<tr><th>이메일</th><td>"+ vo.getOrder_email() +"</td></tr>" 
						+ "<tr><td colspan='2' style='padding: 20px; text-align: center; font-size: 15px; background-color: #ededed;'>배송정보</th></tr>"
						+ "<tr><th>이름</th><td>"+ vo.getDeliv_name() +"</td></tr>"
						+ "<tr><th>전화번호</th><td>"+ vo.getDeliv_phone() +"</td></tr>"
						+ "<tr><th>주소</th><td>( "+ vo.getDeliv_zipcode() +" ) "+ vo.getDeliv_address() +" "+ vo.getDeliv_detailaddress() +"</td></tr>"
						+ "<tr><th>배송메모</th><td>"+ vo.getDeliv_memo() +"</td></tr>"
						+ "</table>"				
					);
			msg.append("</div>");
			msg.append("</body>");
			msg.append("</html>");
			mail.setHtmlMsg(msg.toString());
			
			mail.send();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
			
	
	//이메일 인증요청
	public void mailCheck(String email, String key, HttpSession session) {
		//Html형식의 내용을 갖는 메일:파일첨부가능
		send_emailcheck(email, key, session);
	}	
	//이메일 인증번호발송
	private void send_emailcheck(String email, String key, HttpSession session) {
		HtmlEmail mail = new HtmlEmail();
		//메일을 작성할 서버를 지정
		mail.setHostName("smtp.gmail.com");
		mail.setCharset("utf-8");
		mail.setDebug(true);				//콘솔확인
		//로그인하기 위한 아이디/비번
		mail.setAuthentication("bteamproject0420", "bteam0420");
		//메일 연결
		mail.setSSLOnConnect(true);
		try {
			mail.setFrom("bteamproject0420@gmail.com", "관리자");		//송신자 정보
			mail.addTo(email);										//수신자 정보
			//메일작성
			mail.setSubject("회원가입 인증 이메일입니다.");
			StringBuffer msg = new StringBuffer();
			msg.append("<html>");
			msg.append("<body>");
			msg.append("<img src='img/pre_logo.png' style='width: 300px; height: 300px; margin: 0 auto;'/>");
			msg.append("<hr>");
			msg.append(key);
			msg.append("<h3>받으신 인증번호를 입력해주시면 이메일 인증이 완료됩니다.</h3>");
			msg.append("</body>");
			msg.append("</html>");
			mail.setHtmlMsg(msg.toString());
			
//			EmailAttachment file = new EmailAttachment();
//			file.setPath(session.getServletContext().getRealPath("resources")+"/image/다운로드.jpg");
//			mail.attach(file);
			mail.send();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
