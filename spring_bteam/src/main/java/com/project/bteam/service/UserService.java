package com.project.bteam.service;

import com.project.bteam.vo.UserVO;

public interface UserService {

	boolean user_signup(UserVO vo);				// 회원가입
	boolean user_email_check(String id);			// 이메일 중복확인
	boolean user_login(String id, String pw);	// 로그인
	UserVO user_detail(String id);				// 회원정보 상세보기
	boolean user_update(UserVO vo);				// 회원정보수정
	boolean user_delete(String id); 			// 회원탈퇴
	
}
