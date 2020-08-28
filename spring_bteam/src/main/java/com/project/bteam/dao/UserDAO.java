package com.project.bteam.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.bteam.service.UserService;
import com.project.bteam.vo.UserVO;

@Repository
public class UserDAO implements UserService {

	@Autowired private SqlSession sql;

	@Override
	public boolean user_signup(UserVO vo) {
		int succ = sql.insert("user_singup", vo);	
		System.out.println(succ);
		return false;
	}

	@Override
	public boolean user_id_check(String id) {
		return false;
	}

	@Override
	public boolean user_login(String id, String pw) {
		return false;
	}

	@Override
	public UserVO user_detail(String id) {
		return null;
	}

	@Override
	public boolean user_update(UserVO vo) {
		return false;
	}

	@Override
	public boolean user_delete(String id) {
		return false;
	}
	
}
