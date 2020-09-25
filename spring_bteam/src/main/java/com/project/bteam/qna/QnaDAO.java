package com.project.bteam.qna;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QnaDAO implements QnaService{
	
	@Autowired 
	private SqlSession sql;

	@Override
	public QnaPage qnaList(QnaPage page) {
		page.setTotalList((Integer)sql.selectOne("qna.mapper.total", page));
		page.setList(sql.selectList("qna.mapper.list", page));
		return page;
	}

	@Override
	public QnaVO qnaDetail(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void qnaReadCnt(int qna_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean qnaWrite(QnaVO qvo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean qnaUpdate(QnaVO qvo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void qnaDelete(int qna_num) {
		// TODO Auto-generated method stub
		
	}
	
}
