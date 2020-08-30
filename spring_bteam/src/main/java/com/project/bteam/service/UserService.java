package com.project.bteam.service;

import com.project.bteam.vo.UserVO;

public interface UserService {

	int user_signup(UserVO vo);					// 회원가입
	int user_email_check(String user_email);			// 이메일 중복확인
	UserVO user_login(UserVO vo);	// 로그인
	UserVO user_detail(String user_email);				// 회원정보 상세보기
	boolean user_update(UserVO vo);					// 회원정보수정
	boolean user_delete(String user_email); 				// 회원탈퇴
	
}
