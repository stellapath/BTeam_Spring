package com.project.bteam.board;

import java.util.HashMap;
import java.util.List;

import com.project.bteam.board.BoardVO;

public interface BoardService {

	List<BoardVO> boardList(int board_category);
	BoardPage boardList(int board_category, BoardPage page);
	BoardVO boardDetail(int board_num);
	boolean boardWrite(BoardVO bvo);
	void boardReadCnt(int board_num);
	boolean boardUpdate(BoardVO bvo);
	void boardDelete(int board_num);
	
}
