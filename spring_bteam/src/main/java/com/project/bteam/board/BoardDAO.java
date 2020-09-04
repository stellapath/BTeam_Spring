package com.project.bteam.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO implements BoardService {
	
	@Autowired 
	private SqlSession sql;
	
	@Override
	public List<BoardVO> boardList(int category) {
		return sql.selectList("list", category);
	}
	
}
