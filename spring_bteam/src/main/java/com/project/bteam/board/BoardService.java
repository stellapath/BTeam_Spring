package com.project.bteam.board;

import java.util.HashMap;
import java.util.List;

import com.project.bteam.board.BoardVO;

public interface BoardService {

	List<BoardVO> boardList(int board_category);
	BoardVO boardDetail(HashMap<String, Integer> map);
	int boardWrite(BoardVO bvo);
	void boardUpdate(BoardVO bvo);
	void boardDelete(int board_num);
	
}
