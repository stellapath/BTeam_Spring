package com.project.bteam.common;

import java.io.File;
import java.io.FileInputStream;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
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
			public void mailAnswer(QnaVO qvo, HttpSession session) {
			send_qnaAnswer(qvo, session);
		}
			
		//문의글 메일전송
		private void send_qnaAnswer(QnaVO qvo, HttpSession session) {
			HtmlEmail mail = new HtmlEmail();
			mail.setHostName("smtp.gmail.com");
			mail.setCharset("utf-8");
			mail.setDebug(true);
			mail.setAuthentication("bteamproject0420", "bteam0420");
			mail.setSSLOnConnect(true);
			try {
				mail.setFrom("bteamproject0420@gmail.com", "관리자");		//송신자 정보
				mail.addTo(qvo.getQna_email());							//수신자 정보
				//메일작성
				mail.setSubject(qvo.getQna_nickname() + "님 문의글 답변안내 이메일입니다.");
				StringBuffer msg = new StringBuffer();
				msg.append("<html>");
				msg.append("<body>");
				msg.append("<div style='width:700px; text-align: center;'>");
				msg.append("<img src='http://192.168.0.72:8282/bteam/img/logo/logo_transparent.png' style='background-color: #232F34; width: 150px; height: 150px; margin: 0 auto;'/>");
				msg.append("<h3>${vo.user_nickname }님 문의해주셔서 감사합니다.</h3>");
				msg.append("<table style='border: 1px solid #666; width: 100%; margin: 0 auto;'>"
							+ "<tr><td colspan='2' style='padding: 20px; text-align: center; font-size: 15px; background-color: #ededed;'>문의정보</td></tr>" 
							+ "<tr><th style='width: 100px;'>등록일</th><td>"+ qvo.getQna_writedate() +"</td></tr>"
							+ "<tr><th>구분</th><td>"+ qvo.getQna_category() +"</td></tr>"
							+ "<tr><th>질문</th><td>"+ qvo.getQna_question() +"</td></tr>"
							+ "<tr><th>문의내용</th><td>"+ qvo.getQna_content() +"</td></tr>"
							+ "<tr><td colspan='2' style='padding: 20px; text-align: center; font-size: 15px; background-color: #ededed;'>답변정보</th></tr>"
							+ "<tr><th>답변일</th><td>"+ qvo.getQna_answerdate() +"</td></tr>"
							+ "<tr><th>답변내용</th><td>"+ qvo.getQna_answer() +"</td></tr>" 
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
	
	//주문취소안내 메일발송요청
		public void mailOrderCancel(OrderVO vo, String cancelReason) {
			//Html형식의 내용을 갖는 메일:파일첨부가능
			send_orderCancel(vo, cancelReason);
		}
		//주문서 메일전송
		private void send_orderCancel(OrderVO vo, String cancelReason) {
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
				mail.setSubject(vo.getOrder_name() + "님의 주문이 취소되었습니다.");
				StringBuffer msg = new StringBuffer();
				msg.append("<html>");
				msg.append("<body>");
				msg.append("<div style='width:700px; text-align: center;'>");
				msg.append("<img src='http://192.168.0.72:8282/bteam/img/logo/logo_transparent.png' style='background-color: #232F34; width: 150px; height: 150px; margin: 0 auto;'/>");
				msg.append("<h3>"+vo.getOrder_name()+"님의 주문이 취소되었습니다.</h3>"
							+ "<h4>주문취소사유는 다음과 같습니다.</h4>");
				msg.append("<div style='border: 1px solid #666; width: 100%; max-width:600px; margin: 0 auto; margin-bottom: 50px;'>"
							+ "<p style='color: red; font-weight: bold;'>주문취소사유 : "+cancelReason+"</p>"
							+ "<p>환불에는 영업일기준 약 3~5일이 소요됩니다.</p>"
							+ "</div>");
				msg.append("<h4>나의 주문내역</h4>"
							+ "<table style='border: 1px solid #666; width: 100%; max-width:600px; margin: 0 auto;'>"
							+ "<tr><td colspan='2' style='padding: 20px; text-align: center; font-size: 15px; background-color: #ededed;'>주문정보</td></tr>" 
							+ "<tr><th style='width: 100px;'>주문번호</th><td>"+ vo.getOrder_num() +"</td></tr>"
							+ "<tr><th>제품명</th><td>"+vo.getOrder_product()+"</td></tr>"
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
			msg.append("<img src='http://112.164.58.7:8282/bteam/img/logo/logo_transparent.png' style='background-color: #232F34; width: 150px; height: 150px; margin: 0 auto;'/>");
			msg.append("<h3>주문해주셔서 감사합니다.</h3>");
			msg.append("<table style='border: 1px solid #666; width: 100%; max-width:600px; margin: 0 auto;'>"
						+ "<tr><td colspan='2' style='padding: 20px; text-align: center; font-size: 15px; background-color: #ededed;'>주문정보</td></tr>" 
						+ "<tr><th style='width: 100px;'>주문번호</th><td>"+ vo.getOrder_num() +"</td></tr>"
						+ "<tr><th>제품명</th><td>"+vo.getOrder_product()+"</td></tr>"
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
		File logofile = new File(session.getServletContext().getRealPath("resources")+"/img/logo/logo_transparent.png");
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
			msg.append("<body style='text-align:center;'>");
			msg.append("<img src='http://112.164.58.7:8282/bteam/img/logo/logo_transparent.png' style='background-color: #232F34; width: 150px; height: 150px; margin: 0 auto;'/>");
			msg.append("<hr>");
			msg.append("인증키 : "+key);
			msg.append("<h3>발급된 인증번호를 입력해주시면 이메일 인증이 완료됩니다.</h3>");
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
	
	/**
	 * 비밀번호 재설정 이메일 발송 메소드
	 * @param email 이메일
	 * @param pw   "재설정된" 비밀번호
	 */
	public void mailResetPw(String email, String pw, HttpSession session) {
		//Html형식의 내용을 갖는 메일:파일첨부가능
		send_resetPw(email, pw, session);
	}	
	//비밀번호 재설정 뒤 이메일 발송
	private void send_resetPw(String email, String pw, HttpSession session) {
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
			mail.setSubject("비밀번호 재설정 이메일입니다.");
			StringBuffer msg = new StringBuffer();
			msg.append("<html>");
			msg.append("<body style='text-align:center;'>");
			msg.append("<img src='http://112.164.58.7:8282/bteam/img/logo/logo_transparent.png' style='background-color: #232F34; width: 150px; height: 150px; margin: 0 auto;'/>");
			msg.append("<hr>");
			msg.append("임시 비밀번호 : " + pw);
			msg.append("<h3>위의 비밀번호로 로그인 하신 뒤 비밀번호를 변경해주세요.</h3>");
			msg.append("</body>");
			msg.append("</html>");
			mail.setHtmlMsg(msg.toString());
			mail.send();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
		
	/**
	 * 난수 생성 메소드
	 * 사용법 getKey(lowerCheck, size)
	 * @param lowerCheck 소문자로만 난수 출력할 것인지 (boolean)
	 * @param size 난수의 길이 (int)
	 */
	private boolean lowerCheck;
	private int size;
	private String randomKey() {
		Random random = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;
		do {
			num = random.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}
		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}
	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return randomKey();
	}
}
