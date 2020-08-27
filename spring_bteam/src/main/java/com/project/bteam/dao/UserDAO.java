package com.project.bteam.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.project.bteam.vo.UserVO;

public class UserDAO {

	private DataSource dataSource;
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:/comp/env/bteam");
		} catch (NamingException e) {
			e.getMessage();
			System.out.println("UserDAO() Exception");
		}
	}
	
	// 회원가입
	public int userSignUp(UserVO vo) {
		int succ = 0;
		try {
			conn = dataSource.getConnection();
			String sql = "INSERT INTO bUser VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getUser_id());
			ps.setString(2, vo.getUser_pw());
			ps.setString(3, vo.getUser_name());
			ps.setString(4, vo.getUser_nickname());
			ps.setString(5, vo.getUser_email());
			ps.setString(6, vo.getUser_phone());
			ps.setString(7, vo.getUser_birth());
			ps.setString(8, vo.getUser_key());
			succ = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("userSignUp() Exception");
		}
		
		return succ;
	}

	// 로그인
	public UserVO userLogIn(String user_id, String user_pw) {
		UserVO vo = null;
		try {
			conn = dataSource.getConnection();
			String sql = "SELECT * FROM bUser WHERE user_id = ? AND user_pw = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, user_id);
			ps.setString(2, user_pw);
			rs = ps.executeQuery();
			if (rs.next()) {
				vo = new UserVO();
				vo.setUser_id(rs.getString("user_id"));
				vo.setUser_pw(rs.getString("user_pw"));
				vo.setUser_name(rs.getString("user_name"));
				vo.setUser_nickname(rs.getString("user_nickname"));
				vo.setUser_email(rs.getString("user_email"));
				vo.setUser_phone(rs.getString("user_phone"));
				vo.setUser_birth(rs.getString("user_birth"));
				vo.setUser_key(rs.getString("user_key"));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("userLogIn() Exception");
		}
		
		return vo;
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
