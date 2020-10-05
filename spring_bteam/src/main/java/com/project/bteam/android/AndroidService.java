package com.project.bteam.android;

import java.util.List;
import java.util.Map;

import com.project.bteam.board.BoardVO;

public interface AndroidService {
	List<BoardVO> noticeList(Map<String, Integer> map);
	void commentInsert(AndCommentVO vo);
}
