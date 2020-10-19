package com.project.bteam.android;

import java.util.List;
import java.util.Map;

import com.project.bteam.board.BoardVO;
import com.project.bteam.user.UserVO;

public interface AndroidService {
	int andSignup(UserVO vo);
	List<TrafficVO> andTrafficList(Map<String, Integer> map);
	TrafficVO andTrafficView(int num);
	int andTrafficInsert(TrafficVO vo);
	String andGetImage(String email);
	List<TrafficVO> andMyPost(Map<String, String> map);
	List<TrafficVO> andPopular();
	void andReadCount(int num);
	int andTrafficModify(TrafficVO vo);
	int andTrafficDelete(int num);
	int andEmailCheck(String email);
	int andVerifyEmail(String email);
	int andUpdatePassword(Map<String, String> map);
	int andUserUpdate(UserVO vo);
	int andTrafficSolve(int num);
	int andTrafficLikeInsert(Map<String, Object> map);
	int andTrafficLikeDelete(Map<String, Object> map);
	boolean andTrafficLikeSelect(Map<String, Object> map);
	int andTrafficLikeSu(int num);
	List<CommentVO> andCommentList();
	int andCommentInsert(CommentVO vo);
	int andCommentDelete(int num);
	int andCommentUpdate(CommentVO vo);
}
