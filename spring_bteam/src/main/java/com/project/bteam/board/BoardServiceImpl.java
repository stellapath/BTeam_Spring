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
	public BoardVO board_detail(HashMap<String, Integer> map) {
		return dao.board_detail(map);
	}

	@Override
	public void board_insert(BoardVO bvo) {
		dao.board_insert(bvo);		
	}

	@Override
	public void board_update(BoardVO bvo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void board_delete(int board_num, String board_email) {
		// TODO Auto-generated method stub
		
	}

}
