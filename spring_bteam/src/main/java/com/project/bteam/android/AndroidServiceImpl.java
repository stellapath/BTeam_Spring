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
	public List<BoardVO> noticeList(Map<String, Integer> map) {
		return dao.noticeList(map);
	}

	@Override
	public void trafficInsert(TrafficVO vo) {
		dao.trafficInsert(vo);
	}

	@Override
	public List<TrafficVO> trafficList(Map<String, Integer> map) {
		return dao.trafficList(map);
	}
}
