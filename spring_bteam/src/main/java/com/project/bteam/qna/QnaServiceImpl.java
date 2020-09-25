package com.project.bteam.qna;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnaServiceImpl implements QnaService {
	
	@Autowired
	private QnaDAO dao;

	@Override
	public QnaPage qnaList(QnaPage page) {
		return dao.qnaList(page);
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
	public boolean qnaWrite(QnaVO bvo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean qnaUpdate(QnaVO bvo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void qnaDelete(int qna_num) {
		// TODO Auto-generated method stub

	}

}
