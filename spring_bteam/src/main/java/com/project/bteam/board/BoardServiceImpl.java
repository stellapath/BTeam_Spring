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
	public BoardVO boardDetail(HashMap<String, Integer> map) {
		return dao.boardDetail(map);
	}

	@Override
	public int boardWrite(BoardVO bvo) {
		return dao.boardWrite(bvo);
	}

	@Override
	public void boardUpdate(BoardVO bvo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void boardDelete(int board_num) {
		dao.boardDelete(board_num);
		
	}

	

}
