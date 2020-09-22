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
	public boolean boardWrite(BoardVO bvo) {
		return sql.insert("board.write", bvo)>0 ? true : false;
	}

	@Override
	public boolean boardUpdate(BoardVO bvo) {
		return sql.update("board.update", bvo)>0 ? true : false;		
	}

	@Override
	public void boardDelete(int board_num) {
		sql.delete("board.delete", board_num);		
	}

	@Override
	public void boardReadCnt(int board_num) {
		sql.update("board.readcount", board_num);
		
	}

	@Override
	public BoardPage boardList(int board_category, BoardPage page) {
		page.setTotalList((Integer) sql.selectOne("board.total", page));
		page.setList(sql.selectList("board.list", page));
		return page;
	}

	
}
