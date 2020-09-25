package com.project.bteam.qna;

import java.sql.Date;

public class QnaVO {
	
	private String qna_category, qna_question, qna_nickname, qna_email;
	private Date qna_writedate;
	private int qna_num, qna_readcnt, qna_no;
	
	public String getQna_email() {
		return qna_email;
	}
	public void setQna_email(String qna_email) {
		this.qna_email = qna_email;
	}
	public String getQna_category() {
		return qna_category;
	}
	public void setQna_category(String qna_category) {
		this.qna_category = qna_category;
	}
	public String getQna_question() {
		return qna_question;
	}
	public void setQna_question(String qna_question) {
		this.qna_question = qna_question;
	}
	public String getQna_nickname() {
		return qna_nickname;
	}
	public void setQna_nickname(String qna_nickname) {
		this.qna_nickname = qna_nickname;
	}
	public Date getQna_writedate() {
		return qna_writedate;
	}
	public void setQna_writedate(Date qna_writedate) {
		this.qna_writedate = qna_writedate;
	}
	public int getQna_num() {
		return qna_num;
	}
	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}
	public int getQna_readcnt() {
		return qna_readcnt;
	}
	public void setQna_readcnt(int qna_readcnt) {
		this.qna_readcnt = qna_readcnt;
	}
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	
}
