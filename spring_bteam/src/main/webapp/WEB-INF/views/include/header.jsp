<%@page import="com.project.bteam.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
UserVO vo = (UserVO) session.getAttribute("login_info");
pageContext.setAttribute("vo", vo);
%>
<header>
	<h1>HEADER</h1>
	<a href="#">게시판</a>
	
	<c:if test="${vo eq null}">
	<a href="login">로그인</a>
	<a href="signup">회원가입</a>
	</c:if>
	<c:if test="${vo ne null}">
	${vo.user_nickname}님
	<a href="#">마이페이지</a>
	<a href="logout">로그아웃</a>
	</c:if>
</header>