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
import com.project.bteam.android.CommentVO;
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
	public boolean andSignup(UserVO vo) {
		System.out.println("::andSignup::");
		return service.andSignup(vo) > 0;
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
	
	// 중복확인
	@ResponseBody @RequestMapping("/andEmailCheck") 
	public boolean andEmailCheck(String email) {
		return service.andEmailCheck(email) > 0 ? false : true; 
	}
	
	// 이메일 인증 메일 보내기
	@ResponseBody @RequestMapping("/andSendKey") 
	public void andSendKey(String email, String key, HttpSession session) {
		System.out.println("::andSendKey::");
		common.mailCheck(email, key, session);
	}
	
	// 이메일 인증
	@ResponseBody @RequestMapping("/andVerifyEmail")
	public boolean andVerifyEmail(String email) {
		System.out.println("::andVerifyEmail::");
		return service.andVerifyEmail(email) > 0;
	}
	
	// 비밀번호 재설정
	@ResponseBody @RequestMapping("/andResetPassword")
	public int andResetPassword(String email, HttpSession session) {
		System.out.println("::andResetPassword::");
		if (service.andEmailCheck(email) <= 0) {
			return -1;
		}
		String pw = common.getKey(false, 6);
		Map<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("pw", pw);
		common.mailResetPw(email, pw, session);
		return service.andUpdatePassword(map);
	}
	
	// 정보 변경
	@ResponseBody @RequestMapping("/andUserUpdate")
	public boolean andUserUpdate(UserVO vo) {
		System.out.println("::andUserUpdate::");
		return service.andUserUpdate(vo) > 0;
	}
	
	// 해결
	@ResponseBody @RequestMapping("/andTrafficSolve")
	public boolean andTrafficSolve(int num) {
		return service.andTrafficSolve(num) > 0;
	}
	
	// 좋아요 수 반환
	@ResponseBody @RequestMapping("/andTrafficLikeSu")
	public int andTrafficLikeSu(int num) {
		return service.andTrafficLikeSu(num);
	}
	
	// 좋아요 처리
	@ResponseBody @RequestMapping("/andTrafficLike")
	public int andTrafficLike(String email, int num) {
		Map<String, Object> map = new HashMap<>();
		map.put("email", email);
		map.put("num", num);
		
		// 좋아요 유무 체크
		if (service.andTrafficLikeSelect(map)) {
			// 이미 있으면 없애는 처리
			return service.andTrafficLikeDelete(map);
		} else {
			// 없으면 추가하는 처리
			return service.andTrafficLikeInsert(map);
		}	
	}
	
	// 댓글 목록
	@RequestMapping("/andCommentList")
	public String andCommentList(Model model) {
		model.addAttribute("list", service.andCommentList());
		return "app/andCommentList";
	}
	
	// 댓글 등록
	@ResponseBody @RequestMapping("/andCommentInsert")
	public boolean andCommentInsert(CommentVO vo) {
		return service.andCommentInsert(vo) > 0;
	}
	
	// 댓글 삭제
	@ResponseBody @RequestMapping("/andCommentDelete")
	public boolean andCommentDelete(int num) {
		return service.andCommentDelete(num) > 0;
	}
	
	// 댓글 수정
	@ResponseBody @RequestMapping("/andCommentUpdate")
	public boolean andCommentUpdate(CommentVO vo) {
		return service.andCommentUpdate(vo) > 0;
	}
}
