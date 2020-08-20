package com.bteam.app.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.bteam.app.dto.UserDTO;

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
	public int userSignUp(UserDTO dto) {
		int succ = 0;
		try {
			conn = dataSource.getConnection();
			String sql = "INSERT INTO bUser VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getUser_id());
			ps.setString(2, dto.getUser_pw());
			ps.setString(3, dto.getUser_name());
			ps.setString(4, dto.getUser_nickname());
			ps.setString(5, dto.getUser_email());
			ps.setString(6, dto.getUser_phone());
			ps.setString(7, dto.getUser_birth());
			ps.setString(8, dto.getUser_key());
			succ = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("userSignUp() Exception");
		}
		
		return succ;
	}

	// 로그인
	public UserDTO userLogIn(String user_id, String user_pw) {
		UserDTO dto = null;
		try {
			conn = dataSource.getConnection();
			String sql = "SELECT * FROM bUser WHERE user_id = ? AND user_pw = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, user_id);
			ps.setString(2, user_pw);
			rs = ps.executeQuery();
			if (rs.next()) {
				dto = new UserDTO();
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_pw(rs.getString("user_pw"));
				dto.setUser_name(rs.getString("user_name"));
				dto.setUser_nickname(rs.getString("user_nickname"));
				dto.setUser_email(rs.getString("user_email"));
				dto.setUser_phone(rs.getString("user_phone"));
				dto.setUser_birth(rs.getString("user_birth"));
				dto.setUser_key(rs.getString("user_key"));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("userLogIn() Exception");
		}
		
		return dto;
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
