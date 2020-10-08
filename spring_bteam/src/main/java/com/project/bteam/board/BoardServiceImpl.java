package com.project.bteam.board;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO dao;
	
	@Override
	public List<BoardVO> boardList(int board_category) { 
		return dao.boardList(board_category); 
	}

	@Override
	public BoardVO boardDetail(int board_num) {
		return dao.boardDetail(board_num);
	}

	@Override
	public boolean boardWrite(BoardVO bvo) {
		return dao.boardWrite(bvo);
	}

	@Override
	public boolean boardUpdate(BoardVO bvo) {
		return dao.boardUpdate(bvo);
	}

	@Override
	public void boardDelete(int board_num) {
		dao.boardDelete(board_num);
	}

	@Override
	public void boardReadCnt(int board_num) {
		dao.boardReadCnt(board_num);
		
	}

	@Override
	public BoardPage boardList(int board_category, BoardPage page) {
		return dao.boardList(board_category, page);
	}

}
