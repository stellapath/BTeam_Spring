package com.project.bteam.android;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.bteam.board.BoardVO;

@Repository
public class AndroidDAO implements AndroidService {

	@Autowired SqlSession sql;
	
	@Override
	public List<BoardVO> noticeList(Map<String, Integer> map) {
		return sql.selectList("android.noticeList", map);
	}

	@Override
	public void trafficInsert(TrafficVO vo) {
		sql.insert("android.trafficInsert");		
	}

	@Override
	public List<TrafficVO> trafficList(Map<String, Integer> map) {
		return sql.selectList("android.trafficList", map);
	}
}
