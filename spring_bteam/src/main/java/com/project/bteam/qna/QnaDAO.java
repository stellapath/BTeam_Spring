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
	public QnaPage myqnaList(QnaPage page) {
		page.setTotalList((Integer)sql.selectOne("qna.mapper.mytotal", page));
		page.setList(sql.selectList("qna.mapper.mylist", page));
		return page;
	}

	@Override
	public QnaVO qnaDetail(int qna_num) {
		return sql.selectOne("qna.mapper.view", qna_num);
	}

	@Override
	public void qnaReadCnt(int qna_num) {
		
	}

	@Override
	public boolean qnaWrite(QnaVO qvo) {
		return sql.insert("qna.mapper.write", qvo)>0 ? true : false;
	}

	@Override
	public boolean qnaUpdate(QnaVO qvo) {
		return sql.update("qna.mapper.update", qvo)>0 ? true : false;
	}

	@Override
	public void qnaDelete(int qna_num) {
		
	}
	
}
