package com.project.bteam.review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.bteam.board.BoardPage;
import com.project.bteam.board.BoardVO;

@Service
public class ReviewServiceImpl implements ReviewService{
@Autowired private ReviewDAO dao;
	
	@Override
	public int reviewInsert(BoardVO vo) {
		return dao.reviewInsert(vo);
	}

	@Override
	public BoardPage reviewList(BoardPage page) {
		return dao.reviewList(page);
	}

	@Override
	public BoardVO reviewDetail(int board_num) {
		return dao.reviewDetail(board_num);
	}

	@Override
	public int reviewLike(int board_num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int reviewUpdate(BoardVO vo) {
		return dao.reviewUpdate(vo);
	}

	@Override
	public int reviewDelete(int board_num) {
		return dao.reviewDelete(board_num);
	}

}
