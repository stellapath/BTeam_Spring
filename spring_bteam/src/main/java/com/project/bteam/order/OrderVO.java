package com.project.bteam.order;

import java.sql.Date;

public class OrderVO {
	
	//BORDER 테이블
	private int order_count, order_amount, deliv_zipcode;
	private String order_num, order_email, order_name, order_phone, order_product, order_color, order_pay, order_date,
					deliv_name, deliv_phone, deliv_address, deliv_detailaddress, deliv_memo, order_review;
	

	//BMERCHANDISE 테이블(판매제품 등록관리)
	private String p_name, p_num;
	private int p_price;
	private Date p_date;
	
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_num() {
		return p_num;
	}
	public void setP_num(String p_num) {
		this.p_num = p_num;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public Date getP_date() {
		return p_date;
	}
	public void setP_date(Date p_date) {
		this.p_date = p_date;
	}
	
	public String getOrder_review() {
		return order_review;
	}
	public void setOrder_review(String order_review) {
		this.order_review = order_review;
	}
	public String getOrder_num() {
		return order_num;
	}
	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}
	public int getOrder_count() {
		return order_count;
	}
	public void setOrder_count(int order_count) {
		this.order_count = order_count;
	}
	public int getOrder_amount() {
		return order_amount;
	}
	public void setOrder_amount(int order_amount) {
		this.order_amount = order_amount;
	}
	public int getDeliv_zipcode() {
		return deliv_zipcode;
	}
	public void setDeliv_zipcode(int deliv_zipcode) {
		this.deliv_zipcode = deliv_zipcode;
	}
	public String getOrder_email() {
		return order_email;
	}
	public void setOrder_email(String order_email) {
		this.order_email = order_email;
	}
	public String getOrder_name() {
		return order_name;
	}
	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}
	public String getOrder_phone() {
		return order_phone;
	}
	public void setOrder_phone(String order_phone) {
		this.order_phone = order_phone;
	}
	public String getOrder_product() {
		return order_product;
	}
	public void setOrder_product(String order_product) {
		this.order_product = order_product;
	}
	public String getOrder_color() {
		return order_color;
	}
	public void setOrder_color(String order_color) {
		this.order_color = order_color;
	}
	public String getOrder_pay() {
		return order_pay;
	}
	public void setOrder_pay(String order_pay) {
		this.order_pay = order_pay;
	}
	public String getDeliv_name() {
		return deliv_name;
	}
	public void setDeliv_name(String deliv_name) {
		this.deliv_name = deliv_name;
	}
	public String getDeliv_phone() {
		return deliv_phone;
	}
	public void setDeliv_phone(String deliv_phone) {
		this.deliv_phone = deliv_phone;
	}
	public String getDeliv_address() {
		return deliv_address;
	}
	public void setDeliv_address(String deliv_address) {
		this.deliv_address = deliv_address;
	}
	public String getDeliv_detailaddress() {
		return deliv_detailaddress;
	}
	public void setDeliv_detailaddress(String deliv_detailaddress) {
		this.deliv_detailaddress = deliv_detailaddress;
	}
	public String getDeliv_memo() {
		return deliv_memo;
	}
	public void setDeliv_memo(String deliv_memo) {
		this.deliv_memo = deliv_memo;
	}
	public String getOrder_date() {
		return order_date;
	}
	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}
	

}
