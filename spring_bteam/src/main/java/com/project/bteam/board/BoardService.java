package com.project.bteam.board;

import java.util.HashMap;
import java.util.List;

import com.project.bteam.board.BoardVO;

public interface BoardService {

	List<BoardVO> boardList(int board_category);
	BoardVO board_detail(HashMap<String, Integer> map);
	void board_insert(BoardVO bvo);
	void board_update(BoardVO bvo);
	void board_delete(int board_num, String board_email);
	
}
