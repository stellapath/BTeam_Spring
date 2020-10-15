package com.project.bteam.android;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bteam.board.BoardVO;
import com.project.bteam.user.UserVO;

@Service
public class AndroidServiceImpl implements AndroidService {

	@Autowired AndroidDAO dao;
	
	@Override
	public int andSignup(UserVO vo) {
		return dao.andSignup(vo);
	}

	@Override
	public List<TrafficVO> andTrafficList(Map<String, Integer> map) {
		return dao.andTrafficList(map);
	}
	
	@Override
	public TrafficVO andTrafficView(int num) {
		return dao.andTrafficView(num);
	}
	
	@Override
	public int andTrafficInsert(TrafficVO vo) {
		return dao.andTrafficInsert(vo);
	}
	
	@Override
	public String andGetImage(String email) {
		return dao.andGetImage(email);
	}
	
	@Override
	public List<TrafficVO> andMyPost(Map<String, String> map) {
		return dao.andMyPost(map);
	}
	
	@Override
	public List<TrafficVO> andPopular() {
		return dao.andPopular();
	}
	
	@Override
	public void andReadCount(int num) {
		dao.andReadCount(num);
	}
	
	@Override
	public int andTrafficModify(TrafficVO vo) {
		return dao.andTrafficModify(vo);
	}
	
	@Override
	public int andTrafficDelete(int num) {
		return dao.andTrafficDelete(num);
	}
	
	@Override
	public int andEmailCheck(String email) {
		return dao.andEmailCheck(email);
	}
	
	@Override
	public int andVerifyEmail(String email) {
		return dao.andVerifyEmail(email);
	}
	
	@Override
	public int andUpdatePassword(Map<String, String> map) {
		return dao.andUpdatePassword(map);
	}
	
	@Override
	public int andUserUpdate(UserVO vo) {
		return dao.andUserUpdate(vo);
	}
	
	@Override
	public int andTrafficSolve(int num) {
		return dao.andTrafficSolve(num);
	}
	
	@Override
	public int andTrafficLikeInsert(Map<String, Object> map) {
		return dao.andTrafficLikeInsert(map);
	}
	
	@Override
	public boolean andTrafficLikeSelect(Map<String, Object> map) {
		return dao.andTrafficLikeSelect(map);
	}
	
	@Override
	public int andTrafficLikeSu(int num) {
		return dao.andTrafficLikeSu(num);
	}
	
	@Override
	public int andTrafficLikeDelete(Map<String, Object> map) {
		return dao.andTrafficLikeDelete(map);
	}
}
