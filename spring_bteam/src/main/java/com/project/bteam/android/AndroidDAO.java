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
	public List<BoardVO> andBoardList(Map<String, Integer> map) {
		return sql.selectList("android.boardList", map);
	}
	
	@Override
	public List<TrafficVO> andTrafficList(Map<String, Integer> map) {
		return sql.selectList("android.trafficList", map);
	}
	
	@Override
	public TrafficVO andTrafficView(int num) {
		return sql.selectOne("android.trafficView", num);
	}
	
	@Override
	public int andTrafficInsert(TrafficVO vo) {
		return sql.insert("android.trafficInsert", vo);
	}
	
	@Override
	public String andGetImage(String email) {
		return sql.selectOne("android.getImage", email);
	}
	
	@Override
	public List<TrafficVO> andMyPost(Map<String, String> map) {
		return sql.selectList("myPost", map);
	}
	
	@Override
	public List<TrafficVO> andPopular() {
		return sql.selectList("popular");
	}
	
	@Override
	public void andReadCount(int num) {
		sql.update("readCount", num);
	}
}
