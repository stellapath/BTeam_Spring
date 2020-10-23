package com.project.bteam.controller;

import java.util.HashMap;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.project.bteam.board.BoardPage;
import com.project.bteam.common.CommonService;
import com.project.bteam.order.OrderServiceImpl;
import com.project.bteam.order.OrderVO;
import com.project.bteam.user.UserServiceImpl;
import com.project.bteam.user.UserVO;

@Controller
public class UserController {
	
	@Autowired private OrderServiceImpl order;
	@Autowired private UserServiceImpl service;
	@Autowired private CommonService common;
	@Autowired private BoardPage page; 
	
	
	/*
	 *  비회원전용페이지
	 */
	
	
	// 비회원 로그아웃
	@ResponseBody @RequestMapping("/nonMemberOut")
	public void nonMemberOut(HttpSession session) {
		session.removeAttribute("nonMember");
	}
	
	// 비회원 구매내역요청
	@RequestMapping("/nonMemberConfirm")
	public String nonMemberConfirm(String email, String name, Model model, HttpSession session) {	
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("order_email", email);
		map.put("order_name", name);
		if(session.getAttribute("nonMember") == null) {
			session.setAttribute("nonMember", map);
		}	
		model.addAttribute("order", order.nonMemberList(map));
		return "nonMember/orderList";
	}
	
	// 비회원 주문내역조회
	@ResponseBody @RequestMapping("/nonMemberIn")
	public String nonMemberIn(String email, String name, HttpSession session) {
		session.setAttribute("menu", "");
		HashMap<String, String> map = new HashMap<String, String>();		
		map.put("order_email", email);
		map.put("order_name", name);		
		List<OrderVO> list = order.nonMemberList(map);
		return list.size()>0 ? "1" : "0";
	}
	
	// 비회원 전용 로그인 페이지 전환
	@RequestMapping("/nonMemberPage")
	public String nonMemberPage() {
		return "nonMember/nonMemberPage";
	}
	
	
	/*
	 *  회원전용페이지
	 */
	
	
	// 회원탈퇴 처리요청
	@ResponseBody @RequestMapping("/goodbyeMember")
	public boolean userDelete(String user_email) {
		return service.userDelete(user_email) > 0 ? true : false;
	}
	
	// 주문취소 처리요청
	@ResponseBody @RequestMapping("/orderCancel")
	public boolean orderCancel(String cancelReason, int order_num) {
		//해당 주문조회
		OrderVO vo = order.orderDetail(order_num);
		
		if(order.orderDelete(order_num) > 0){
			common.mailOrderCancel(vo, cancelReason);
			return true;
		}else {
			return false;			//주문취소 실패(DB)
		}
	}
	
	// 내 주문내역 상세보기
	@RequestMapping("/myOrderView")
	public String myOrderView(String order_num, Model model) {
		int orderNum = Integer.parseInt(order_num);
		OrderVO vo = order.orderDetail(orderNum);
		model.addAttribute("vo", vo);
		return "order/orderResult";
	}
	
	// 내 주문내역조회
	@RequestMapping("/myOrder")
	public String myOrderList(String user_email, Model model, HttpSession session,
								@RequestParam(defaultValue="10") int pageList,
								@RequestParam(defaultValue="1") int curPage) {
		session.setAttribute("mypage", "order");
		page.setCurPage(curPage);
		page.setPageList(pageList);
		page.setKeyword(user_email);
		model.addAttribute("page", order.orderList(page));
		return "user/myOrder";
	}
	
	// 주문서작성 업로드 요청
	@RequestMapping("/orderReq")
	public String orderUpload(OrderVO vo, Model model, HttpSession session) {
//		if( session.getAttribute("login_info") == null) {
//			return "redirect:login";
//		}else {
			OrderVO result = order.orderInsert(vo);
			model.addAttribute("vo", result);
			common.mailOrder(result, session);
			return "order/orderResult";
//		}
	}
	
	// 주문서작성 화면 요청2
	@RequestMapping("/orderFixed")
	public String orderFixed(Model model, String p_num) {
		model.addAttribute("vo", order.productDetail(p_num));
		return "order/orderFixedForm";
	}
	
	// 주문서작성 화면 요청
	@RequestMapping("/order")
	public String order(Model model) {
		model.addAttribute("product", order.productList());
		return "order/orderForm";
	}
	
	// 비밀번호찾기 화면 요청
	@RequestMapping("/pwcheck")
	public String pwcheck() {
		return "user/pwcheck";
	}

	// 비밀번호 찾기 처리 요청
	@ResponseBody @RequestMapping("/pwcheckReq")
	public String pwcheckReq(UserVO vo, HttpSession session, Model model) {
		UserVO result = service.userPwCheck(vo);
		if (result != null) session.setAttribute("pwcheck_info", result);
		return result != null ? result.getUser_pw() : "";
		
	}
	
	// 회원정보수정
	@RequestMapping("/update")
	public String update(UserVO vo, HttpSession session) {
		service.userUpdate(vo);
		session.setAttribute("login_info", vo);
		return "redirect:myPage?user_email=" + vo.getUser_email();
	}

	// 마이페이지 화면 요청
	@RequestMapping("/myPage")
	public String myPage(Model model, String user_email, HttpSession session) {
		session.setAttribute("menu", "mypage");
		session.setAttribute("mypage", "info");
		model.addAttribute("vo", service.userDetail(user_email));
		return "user/myPage";
	}
	
	// 회원가입 화면 요청
	@RequestMapping("/signup")
	public String signup() {
		return "user/signup";
	}
	
	// 이메일 중복 확인
	@ResponseBody @RequestMapping("/emailCheck")
	public String emailCheck(String user_email) {
		int result = service.userEmailCheck(user_email);
		return Integer.toString(result);
	}
	
	// 인증번호 이메일 발송
	@ResponseBody @RequestMapping("/email_certification")
	public void sendEmailCertify(String email, HttpSession session, Model model) {
		String key = service.userEmailCertification();
		session.setAttribute("key", key);
		common.mailCheck(email, key, session);
	}
	
	// 이메일 인증 확인
	@ResponseBody @RequestMapping("/emailConfirm")
	public Boolean emailConfirm(String input_key, String key, HttpSession session, Model model) {
		key = (String) session.getAttribute("key");
		return input_key.equals(key);
	}

	// 회원가입 처리 요청
	@RequestMapping("/signupReq")
	public String singupReq(UserVO vo, Model model) {
		int result = service.userSignup(vo);
		model.addAttribute("result", result);
		return "user/signupReq";	// <--------나중에 로그인 화면으로 연결할 것
	}
	
	// 로그인 화면 요청
	@RequestMapping("/login")
	public String login() {
		return "user/login";
	}
	
	// 로그인 처리 요청
	@ResponseBody @RequestMapping("/loginReq")
	public String loginReq(UserVO vo, HttpSession session) {
		UserVO result = service.userLogin(vo);
		if (result != null) session.setAttribute("login_info", result);
		return result != null ? "1" : "0";
	}

	// 로그아웃 처리 요청
	@ResponseBody @RequestMapping("/logout")
	public void logout(HttpSession session) {
		session.removeAttribute("login_info");
	}
		
	// 프로필 이미지 변경 화면 요청
	@RequestMapping("/profileImgUp")
	public String profileImgUp() {
		return "user/profileImgUp";
	}
	
	// 프로필 이미지 변경 처리 요청
	@RequestMapping("/profileImgUpReq")
	public String profileImgUpReq(MultipartFile file, HttpSession session, Model model) {
		UserVO vo = (UserVO) session.getAttribute("login_info");
		if (!file.isEmpty()) {
			vo.setUser_image(file.getOriginalFilename());
			String imagepath = common.upload("profile", file, session);
			vo.setUser_imagepath(imagepath);
		}
		int result = service.userImageUpload(vo);
		model.addAttribute("result", result);
		return "user/profileImgUpReq";
	}
	
	// 프로필 이미지 다운로드 처리 요청
	@ResponseBody @RequestMapping("/profileImgDn")
	public void profileImgDn(String user_email, HttpSession session, HttpServletResponse response) {
		UserVO vo = service.userDetail(user_email);
		common.download(vo.getUser_image(), vo.getUser_imagepath(), session, response);
	}

}
