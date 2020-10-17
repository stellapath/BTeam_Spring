# 유저 (멤버)
<pre>
<code>
create table bUser (
	user_email	 varchar2(30)	 primary key,
	user_pw		 varchar2(30)	 not null,
	user_nickname	 varchar2(30)	 not null,
	user_phone	 varchar2(15),
	user_zipcode	 number,
	user_address	 varchar2(1024),
	detail_address	 varchar2(1024),
	user_birth	 date,
	user_key	 varchar2(30),
	user_image	 varchar2(300),
	user_imagepath	 varchar2(300)
);

-- 컬럼 추가됨 (user_image)
alter table bUser add user_image varchar2(300) default 'default_profile.png';
alter table bUser add user_imagepath varchar2(200) default '';
</code>
</pre>

# 게시판
<pre>
<code>
create table bBoard (
	board_num	number	primary key,
	board_category	number	not null,
	board_email	varchar2(30),
	board_nickname	varchar2(30),
	board_date	date,
	board_title	varchar2(1024),
	board_content	varchar2(2048) 		default '글 내용이 없습니다.',
	board_file	varchar2(1024),
	board_recommend	varchar2(30),
	constraint email
	foreign key (board_email)
	references bUser (user_email)
);

-- 카테고리 => 공지사항:0 / 사용후기:1

-- 글 번호 시퀀스 생성
create sequence board_seq increment by 1;

-- 파일컬럼 변경 및 조회수 컬럼추가
alter table bBoard add	board_readcnt number default 0;
alter table bBoard add	board_filename varchar2(1024);
alter table bBoard add	board_filepath varchar2(1024);
</pre>
</code>

# 주문
<pre>
<code>
create table bOrder (
	order_num		number			primary key,
	order_email		varchar2(30) 	    	not null,
	order_nickname	  	varchar2(30),
	order_phone 	 	varchar2(50) 	    	not null,
	order_date		date              	not null,
	order_option		varchar2(50),
	order_color		varchar2(30),
  	order_count     	number,
 	order_amount    	number,
 	order_pay       	varchar2(30),
 	deliv_name      	varchar2(30)      	not null,
 	deliv_phone     	varchar2(50) 	    	not null,
	deliv_zipcode	  	number 			not null,
	deliv_address    	varchar2(1024) 	  	not null,
	deliv_detailaddress 	varchar2(1024) 		not null,
  	deliv_memo		varchar2(1024)	

);
</pre>
</code>

# 문의
<pre>
<code>
create table bQna (
	qna_num			number			primary key,
	qna_email		varchar2(30) 	not null,
	qna_nickname		varchar2(30),
	qna_category		varchar2(30),
	qna_content		varchar2(1024) 	not null,
);
</pre>
</code>

# 판매제품 테이블
<pre>
<code>
create table tmerchandise (
	M_NUM		VARCHAR2(50)		constraint m_num_pk primary key,
	M_NAME		VARCHAR2(50),
	M_PRICE		NUMBER				not null,
	M_DATE		DATE
);
</pre>
</code>
