package com.project.bteam.board;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO implements BoardService {
	
	@Autowired 
	private SqlSession sql;
	
	@Override
	public List<BoardVO> boardList(int board_category) {
		return sql.selectList("board.list", board_category);
	}

	@Override
	public BoardVO board_detail(HashMap<String, Integer> map) {
		return sql.selectOne("board.view", map);
	}

	@Override
	public void board_insert(BoardVO bvo) {
		sql.insert("board.upload", bvo);
		
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
