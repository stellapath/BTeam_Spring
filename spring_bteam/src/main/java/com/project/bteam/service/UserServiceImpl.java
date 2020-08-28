package com.project.bteam.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bteam.dao.UserDAO;
import com.project.bteam.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired 
	private UserDAO dao;

	@Override
	public boolean user_signup(UserVO vo) { return dao.user_signup(vo); }

	@Override
	public boolean user_email_check(String id) { return dao.user_email_check(id);	}

	@Override
	public boolean user_login(String id, String pw) { return dao.user_login(id, pw); }

	@Override
	public UserVO user_detail(String id) { return dao.user_detail(id); }

	@Override
	public boolean user_update(UserVO vo) { return dao.user_update(vo); }

	@Override
	public boolean user_delete(String id) { return dao.user_delete(id); }
	
}
