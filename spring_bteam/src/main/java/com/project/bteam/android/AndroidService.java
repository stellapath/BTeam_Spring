package com.project.bteam.android;

import java.util.List;
import java.util.Map;

import com.project.bteam.board.BoardVO;

public interface AndroidService {
	List<TrafficVO> andTrafficList(Map<String, Integer> map);
	TrafficVO andTrafficView(int num);
	int andTrafficInsert(TrafficVO vo);
	String andGetImage(String email);
	List<TrafficVO> andMyPost(Map<String, String> map);
	List<TrafficVO> andPopular();
	void andReadCount(int num);
	int andTrafficModify(TrafficVO vo);
	int andTrafficDelete(int num);
}
