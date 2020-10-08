package com.project.bteam.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.bteam.android.AndroidServiceImpl;
import com.project.bteam.android.TrafficVO;
import com.project.bteam.board.BoardServiceImpl;
import com.project.bteam.common.CommonService;
import com.project.bteam.user.UserServiceImpl;
import com.project.bteam.user.UserVO;

@Controller
public class AndroidController {
	
	@Autowired private UserServiceImpl user;
	@Autowired private BoardServiceImpl board;
	@Autowired private AndroidServiceImpl service;
	@Autowired private CommonService common;
	
	// 안드로이드 회원가입
	@ResponseBody @RequestMapping("/andSignup")
	public int andSignup(UserVO vo) {
		System.out.println("::andSignUp::");
		int result = user.userSignup(vo); 
		return result;
	}
	
	// 회원가입 주소 검색창 요청
	@RequestMapping("/andAddress")
	public String andAddress() {
		return "app/andAddress";
	}
	
	// 안드로이드 로그인
	@RequestMapping("/andLogin")
	public String andLogin(UserVO vo, Model model) {
		System.out.println("::andLogin::");
		System.out.println(vo.getUser_email());
		System.out.println(vo.getUser_pw());
		UserVO login_info = user.userLogin(vo);
		model.addAttribute("login_info", login_info);
		return "app/andLogin";
	}
	
	// 안드로이드 게시글 자세히
	@RequestMapping("/andBoardView")
	public String andBoardView(int board_num, Model model) {
		System.out.println("::andBoardView::");
		model.addAttribute("vo", board.boardDetail(board_num));
		return "app/andBoardView";
	}
	
	// 공지사항 불러오기
	@RequestMapping("/andNotice")
	public String andNotice(@RequestParam(defaultValue="1") int begin,
						    @RequestParam(defaultValue="10") int end, Model model) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		model.addAttribute("notice", service.noticeList(map));
		return "app/andNotice";
	}

	// 프로필 이미지 변경 처리
	@ResponseBody @RequestMapping("/andImageUpload")
	public int andImageUpload(String email, MultipartFile file, HttpSession session) {
		System.out.println("::andImageUpload::");
		UserVO vo = user.userDetail(email);
		if (!file.isEmpty()) {
			vo.setUser_image(file.getOriginalFilename());
			vo.setUser_imagepath(common.upload("android", file, session));
		}
		return user.userImageUpload(vo);
	}
	
	// 교통 게시판 리스트
	@RequestMapping("/andTraffic")
	public String andTraffic(@RequestParam(defaultValue="1") int begin, 
							 @RequestParam(defaultValue="10") int end, Model model) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		model.addAttribute("list", service.trafficList(map));
		return "app/traffic";
	}
	
	// 교통 게시판 삽입
	@ResponseBody @RequestMapping("/andTrafficInsert")
	public int andTrafficInsert(TrafficVO vo, MultipartFile file, HttpSession session) {
		if (!file.isEmpty()) {
			vo.setTra_imageURL(common.upload("traffic", file, session));
		}
		return service.trafficInsert(vo);
	}
}
