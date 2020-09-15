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
	public BoardVO boardDetail(HashMap<String, Integer> map) {
		return sql.selectOne("board.view", map);
	}

	@Override
	public int boardWrite(BoardVO bvo) {
		int result = sql.insert("board.write", bvo);
		return result;
	}

	@Override
	public void boardUpdate(BoardVO bvo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void boardDelete(int board_num) {
		sql.delete("board.delete", board_num);		
	}
	
}
