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
	public QnaVO qnaDetail(int qna_num) {
		return dao.qnaDetail(qna_num);
	}

	@Override
	public void qnaReadCnt(int qna_num) {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean qnaWrite(QnaVO qvo) {
		return dao.qnaWrite(qvo);
	}

	public QnaDAO getDao() {
		return dao;
	}

	public void setDao(QnaDAO dao) {
		this.dao = dao;
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

	@Override
	public String userEmailReply() {
		return dao.userEmailReply();
	}
	
}
