package com.project.bteam.review;

import com.project.bteam.board.BoardPage;
import com.project.bteam.board.BoardVO;

public interface ReviewService {
	
	int reviewInsert(BoardVO vo);
	BoardPage reviewList(BoardPage page);
	BoardVO reviewDetail(int board_num);
	int reviewLike(int board_num);
	int reviewUpdate(BoardVO vo);
	int reviewDelete(int board_num);
}
