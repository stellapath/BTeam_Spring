package com.project.bteam.user;

public interface UserService {

	int userSignup(UserVO vo);					// 회원가입
	int userEmailCheck(String user_email);	// 이메일 중복확인
	UserVO userLogin(UserVO vo);				// 로그인
	UserVO userDetail(String user_email);		// 회원정보 상세보기
	int userImageUpload(UserVO vo);
	boolean userUpdate(UserVO vo);				// 회원정보수정
	boolean userDelete(String user_email); 	// 회원탈퇴
	
}
