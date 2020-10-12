package com.project.bteam.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class UserServiceImpl implements UserService {

	@Autowired 
	private UserDAO dao;

	@Override
	public int userSignup(UserVO vo) { return dao.userSignup(vo); }

	@Override
	public int userEmailCheck(String user_email) { return dao.userEmailCheck(user_email);	}

	@Override
	public UserVO userLogin(UserVO vo) { return dao.userLogin(vo); }

	@Override
	public UserVO userDetail(String user_email) { return dao.userDetail(user_email); }

	@Override
	public int userImageUpload(UserVO vo) { return dao.userImageUpload(vo); }
	
	@Override
	public boolean userUpdate(UserVO vo) { return dao.userUpdate(vo); }

	@Override
	public int userDelete(String user_email) { return dao.userDelete(user_email); }

	@Override
	public List<UserVO> userList() { return dao.userList();	}

	@Override
	public String userEmailCertification() { return dao.userEmailCertification(); }
		
}
