package com.project.bteam.user;

import java.util.List;
import java.util.Random;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO implements UserService {

	@Autowired 
	private SqlSession sql;

	// 회원가입
	@Override
	public int userSignup(UserVO vo) {
		vo.setUser_key(getKey(false, 10));
		int result = sql.insert("user.signup", vo);	
		return result;
	}

	// 이메일 중복체크
	@Override
	public int userEmailCheck(String user_email) {
		int result = sql.selectOne("user.email_check", user_email);
		return result;
	}

	// 로그인
	@Override
	public UserVO userLogin(UserVO vo) {
		UserVO result = sql.selectOne("user.login", vo);
		return result;
	}

	// 회원 정보 가져오기
	@Override
	public UserVO userDetail(String user_email) {
		return sql.selectOne("user.detail", user_email);
	}
	
	@Override
	public List<UserVO> userList() {
		return sql.selectList("user.list");
	}
	
	// 프로필 이미지 업로드
	@Override
	public int userImageUpload(UserVO vo) {
		return sql.update("user.imageUpload", vo);
	}

	@Override
	public boolean userUpdate(UserVO vo) {
		return sql.update("user.update", vo)>0 ? true : false;
	}

	@Override
	public int userDelete(String user_email) {
		return sql.delete("user.delete", user_email);
	}
	
	// 난수 생성
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

	@Override
	public String userEmailCertification() {
		String key = getKey(false, 6);

		return key;
	}

	// 비밀번호 찾기
	@Override
	public UserVO userPwCheck(UserVO vo) {
		UserVO result = sql.selectOne("user.pwcheck", vo);
		return result;
	}

	
}
