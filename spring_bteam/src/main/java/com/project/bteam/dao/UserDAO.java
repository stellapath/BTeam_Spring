package com.project.bteam.dao;

import java.util.Random;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.bteam.service.UserService;
import com.project.bteam.vo.UserVO;

@Repository
public class UserDAO implements UserService {

	@Autowired 
	private SqlSession sql;

	// 회원가입
	@Override
	public int user_signup(UserVO vo) {
		vo.setUser_key(getKey(false, 10));
		int result = sql.insert("user.signup", vo);	
		return result;
	}

	// 이메일 중복체크
	@Override
	public int user_email_check(String user_email) {
		int result = sql.selectOne("user.email_check", user_email);
		return result;
	}

	// 로그인
	@Override
	public UserVO user_login(UserVO vo) {
		UserVO result = sql.selectOne("user.login", vo);
		return result;
	}

	@Override
	public UserVO user_detail(String user_email) {
		return null;
	}

	@Override
	public boolean user_update(UserVO vo) {
		return false;
	}

	@Override
	public boolean user_delete(String user_email) {
		return false;
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
	
}
