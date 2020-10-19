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
	
	@Override
	public int andUserUpdate(UserVO vo) {
		return sql.update("android.updateUser", vo);
	}
	
	@Override
	public int andTrafficSolve(int num) {
		return sql.update("android.trafficSolve", num);
	}
	
	@Override
	public int andTrafficLikeInsert(Map<String, Object> map) {
		return sql.insert("android.trafficLikeInsert", map);
	}
	
	@Override
	public boolean andTrafficLikeSelect(Map<String, Object> map) {
		return (Integer) sql.selectOne("android.trafficLikeSelect", map) > 0;
	}
	
	@Override
	public int andTrafficLikeSu(int num) {
		return sql.selectOne("android.trafficLikeSu", num);
	}
	
	@Override
	public int andTrafficLikeDelete(Map<String, Object> map) {
		return sql.delete("android.trafficLikeDelete", map);
	}

	@Override
	public List<CommentVO> andCommentList() {
		return sql.selectList("android.commentList");
	}

	@Override
	public int andCommentInsert(CommentVO vo) {
		return sql.insert("android.commentInsert", vo);
	}

	@Override
	public int andCommentDelete(int num) {
		return sql.delete("android.commentDelete", num);
	}

	@Override
	public int andCommentUpdate(CommentVO vo) {
		return sql.update("android.commentUpdate", vo);
	}
}
