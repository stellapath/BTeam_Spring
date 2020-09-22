package com.project.bteam.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.bteam.common.CommonService;
import com.project.bteam.user.UserServiceImpl;
import com.project.bteam.user.UserVO;

@Controller
public class UserController {
	
	@Autowired private UserServiceImpl service;
	@Autowired private CommonService common;
	
	// 회원정보수정
	@RequestMapping("/update")
	public String update(UserVO vo) {
		service.userUpdate(vo);
		return "redirect:myPage";
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
	
	// 마이페이지 화면 요청
	@RequestMapping("/myPage")
	public String myPage() {
		return "user/myPage";
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
