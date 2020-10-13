package com.project.bteam.user;

import java.util.List;

public interface UserService {

	int userSignup(UserVO vo);					// 회원가입
	int userEmailCheck(String user_email);		// 이메일 중복확인
	String userEmailCertification();			// 이메일 인증
	UserVO userLogin(UserVO vo);				// 로그인
	UserVO userPwCheck(UserVO vo);				// 비밀번호 찾기
	UserVO userDetail(String user_email);		// 회원정보 상세보기
	int userImageUpload(UserVO vo);
	boolean userUpdate(UserVO vo);				// 회원정보수정
	int userDelete(String user_email); 			// 회원탈퇴
	List<UserVO> userList();
	
}
