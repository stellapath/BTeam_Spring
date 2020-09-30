package com.project.bteam.qna;

import java.util.HashMap;

public interface QnaService {
	QnaPage qnaList(QnaPage page);	//문의 목록 조회
	QnaVO qnaDetail(int id);	//문의 상세조회
	void qnaReadCnt(int qna_num);	//문의 조회수 증가처리
	boolean qnaWrite(QnaVO qvo);	//문의 글쓰기 저장
	boolean qnaUpdate(QnaVO qvo);	//문의 글 변경저장
	void qnaDelete(int qna_num);	//문의 글 삭제처리
}