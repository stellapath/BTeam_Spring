package com.project.bteam.android;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bteam.board.BoardVO;

@Service
public class AndroidServiceImpl implements AndroidService {

	@Autowired AndroidDAO dao;

	@Override
	public List<BoardVO> andBoardList(Map<String, Integer> map) {
		return dao.andBoardList(map);
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
}
