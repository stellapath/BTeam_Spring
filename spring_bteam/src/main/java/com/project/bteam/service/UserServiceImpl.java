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
	public int user_signup(UserVO vo) { return dao.user_signup(vo); }

	@Override
	public int user_email_check(String user_email) { return dao.user_email_check(user_email);	}

	@Override
	public UserVO user_login(UserVO vo) { return dao.user_login(vo); }

	@Override
	public UserVO user_detail(String user_email) { return dao.user_detail(user_email); }

	@Override
	public boolean user_update(UserVO vo) { return dao.user_update(vo); }

	@Override
	public boolean user_delete(String user_email) { return dao.user_delete(user_email); }
	
}
