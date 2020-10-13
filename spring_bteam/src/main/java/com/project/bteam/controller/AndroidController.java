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
	
	// 안드로이드 교통 게시판
	@RequestMapping("/andTraffic")
	public String andTraffic(@RequestParam(defaultValue="1") int begin,
							 @RequestParam(defaultValue="10") int end, 
							 Model model) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		model.addAttribute("list", service.andTrafficList(map));
		return "app/andTraffic";
	}

	// 안드로이드 교통 게시판 자세히
	@RequestMapping("/andTrafficView")
	public String andTrafficView(int num, Model model) {
		service.andReadCount(num);
		model.addAttribute("vo", service.andTrafficView(num));
		return "app/andTrafficView";
	}
	
	// 안드로이드 교통 게시판 글쓰기
	@ResponseBody @RequestMapping("andTrafficInsert")
	public int andTrafficInsert(TrafficVO vo, MultipartFile file, 
			HttpSession session) {
		System.out.println("::andTrafficInsert::");
		if (file != null && !file.isEmpty()) {
			vo.setTra_content_image(common.upload("traffic", file, session));
		}
		return service.andTrafficInsert(vo);
	}

	// 프로필 이미지 변경 처리
	@ResponseBody @RequestMapping("/andImageUpload")
	public int andImageUpload(String email, MultipartFile file, 
			HttpSession session) {
		System.out.println("::andImageUpload::");
		UserVO vo = user.userDetail(email);
		if (!file.isEmpty()) {
			vo.setUser_image(file.getOriginalFilename());
			vo.setUser_imagepath(common.upload("android", file, session));
		}
		return user.userImageUpload(vo);
	}
	
	// 프로필 이미지만 가져오기
	@RequestMapping("/andGetImage")
	public String andGetImage(String email, Model model) {
		model.addAttribute("image", service.andGetImage(email));
		return "app/andGetImage";
	}
	
	// 내가 쓴 글 가져오기
	@RequestMapping("/andMyPost")
	public String andMyPost(@RequestParam(defaultValue="1") int begin,
			  				@RequestParam(defaultValue="10") int end, 
			  				String email, Model model) {
		Map<String, String> map = new HashMap<>();
		map.put("begin", begin + "");
		map.put("end", end + "");
		map.put("email", email);
		model.addAttribute("list", service.andMyPost(map));
		return "app/andMyPost";
	}
	
	// 인기글 가져오기
	@RequestMapping("/andPopular")
	public String andPopular(Model model) {
		model.addAttribute("list", service.andPopular());
		return "app/andPopular";
	}
	
	// 게시글 수정 처리
	@ResponseBody @RequestMapping("/andTrafficModify")
	public int andTrafficModify(TrafficVO vo, MultipartFile file,
			HttpSession session) {
		if (file != null && !file.isEmpty()) {
			vo.setTra_content_image(common.upload("traffic", file, session));
		}
		return service.andTrafficModify(vo);
	}
	
	// 게시글 삭제 처리
	@ResponseBody @RequestMapping("/andTrafficDelete")
	public int andTrafficDelete(int num) {
		return service.andTrafficDelete(num);
	}
}
