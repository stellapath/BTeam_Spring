<%@page import="com.project.bteam.user.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
	<h1>HEADER</h1>
	<a href="noticeBoard?board_category=0">공지사항</a>
	
	<c:if test="${login_info eq null}">
	<a href="login">로그인</a>
	<a href="signup">회원가입</a>
	</c:if>
	<c:if test="${login_info ne null}">
	<img src="profileImgDn?user_email=${login_info.user_email}" 
	style="width:40px; border-radius:40px; border:1px solid black;" />
	${login_info.user_nickname}님
	<a href="myPage">마이페이지</a>
	<a href="logout">로그아웃</a>
	</c:if>
</header>