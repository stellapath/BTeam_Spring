package com.project.bteam.qna;

import java.util.Random;

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
		return false;
	}

	@Override
	public void qnaDelete(int qna_num) {
		
	}
	
	// 난수 생성
		private boolean lowerCheck;
		private int size;
		private String randomKey() {
			Random random = new Random();
			StringBuffer sb = new StringBuffer();
			int num = 0;
			
			do {
				num = random.nextInt(75) + 48;
				if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
					sb.append((char) num);
				} else {
					continue;
				}

			} while (sb.length() < size);
			if (lowerCheck) {
				return sb.toString().toLowerCase();
			}
			return sb.toString();
		}
	
	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return randomKey();
	}

	@Override
	public String userEmailReply() {
		String key = getKey(false, 6);
		return key;
	}
}
