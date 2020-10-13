package com.project.bteam.android;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Repository;

import com.project.bteam.board.BoardVO;
import com.project.bteam.user.UserVO;

@Repository
public class AndroidDAO implements AndroidService {

	@Autowired SqlSession sql;
	
	@Override
	public int andSignup(UserVO vo) {
		return sql.insert("android.signup", vo);
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
		return sql.selectList("android.myPost", map);
	}
	
	@Override
	public List<TrafficVO> andPopular() {
		return sql.selectList("android.popular");
	}
	
	@Override
	public void andReadCount(int num) {
		sql.update("android.readCount", num);
	}
	
	@Override
	public int andTrafficModify(TrafficVO vo) {
		return sql.update("android.trafficModify", vo);
	}
	
	@Override
	public int andTrafficDelete(int num) {
		return sql.delete("android.trafficDelete", num);
	}
	
	@Override
	public int andEmailCheck(String email) {
		return sql.selectOne("android.emailCheck", email);
	}
	
	@Override
	public int andVerifyEmail(String email) {
		return sql.update("android.verifyEmail", email);
	}
	
	@Override
	public int andUpdatePassword(Map<String, String> map) {
		return sql.update("android.updatePassword", map);
	}
}
