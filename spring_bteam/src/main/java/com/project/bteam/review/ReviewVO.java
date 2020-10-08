package com.project.bteam.review;

import java.sql.Date;

public class ReviewVO {

	private String review_email, review_nickname, review_title, review_content, review_recommend, review_filename, review_filepath;
	private Date review_date;
	private int review_num, review_no, review_ordernum;
	
	
	public String getReview_email() {
		return review_email;
	}
	public void setReview_email(String review_email) {
		this.review_email = review_email;
	}
	public String getReview_nickname() {
		return review_nickname;
	}
	public void setReview_nickname(String review_nickname) {
		this.review_nickname = review_nickname;
	}
	public String getReview_title() {
		return review_title;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_recommend() {
		return review_recommend;
	}
	public void setReview_recommend(String review_recommend) {
		this.review_recommend = review_recommend;
	}
	public String getReview_filename() {
		return review_filename;
	}
	public void setReview_filename(String review_filename) {
		this.review_filename = review_filename;
	}
	public String getReview_filepath() {
		return review_filepath;
	}
	public void setReview_filepath(String review_filepath) {
		this.review_filepath = review_filepath;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public int getReview_ordernum() {
		return review_ordernum;
	}
	public void setReview_ordernum(int review_ordernum) {
		this.review_ordernum = review_ordernum;
	}


}
