<%@ page import="com.project.bteam.board.BoardVO" %>
<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
BoardVO bvo = (BoardVO) session.getAttribute("boardList");
pageContext.setAttribute("bvo", bvo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style type="text/css">
#btnWrite{ float: right; margin-right: 20px; margin-bottom: 20px;}
[name=search] {height: 35px; width: 80px;}
</style>
</head>
<body>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" /> 
<div class="pageName">
	<p class="titleName">공지사항</p>
	<div class="titleLine"></div>
</div>
<form action="noticeBoard?board_category=0" method="post">
<div id="btnWrite">
	<c:if test="${login_info.user_email eq 'admin'}">
	<a class="btn_fill" href="boardWrite?board_category=0">글작성</a>
	</c:if>
</div>
</form>	
<table id="boardTable">
	<tr><th class="w-px100">번호</th>
		<th>제목</th>
		<th class="w-px100">작성일</th>
		<th class="w-px100">작성자</th>
		<th class="w-px100">조회수</th>
	</tr>
	<c:forEach items="${page.list}" var="bvo">
	<tr><td>${bvo.board_no }</td>
		<td name="board_title">
<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="todays" scope="request"/> 
<fmt:parseNumber value="${bvo.board_date.time / (1000*60*60*24)}" integerOnly="true" var="dates" scope="request"/>
			<c:if test="${todays - dates <= 8}">
			<img alt="새글안내" src="img/new_icon.gif" width="20px;">
			</c:if>
			<a href="boardView?board_num=${bvo.board_num }&board_category=0">${bvo.board_title}</a>
			<c:if test="${!empty bvo.board_filename}">
				<img alt="첨부파일" src="img/attach.png" class="file_icon">
			</c:if>
		</td>
		<td>${bvo.board_date}</td>
		<td>${bvo.board_nickname}</td>
		<td>${bvo.board_readcnt}</td>
	</tr>
	</c:forEach>
</table><br/>
<div class="buttons">
<jsp:include page="/WEB-INF/views/include/page.jsp"/>
</div>
<form action="noticeBoard?board_category=0" method="post" >
<input type="hidden" name="curPage" value='1'/>
<div id='searchTap'>
	<ul>
		<li>
			<select name="search" class="w-80px">
			<option value="all" ${page.search eq 'all' ? 'selected' : '' }>전체</option>
			<option value="board_title" ${page.search eq 'board_title' ? 'selected' : '' }>제목</option>
			<option value="board_content" ${page.search eq 'board_content' ? 'selected' : '' }>내용</option>
			<option value="board_nickname" ${page.search eq 'board_nickname' ? 'selected' : '' }>작성자</option>
			</select>
		</li>
		<li><input type="text" name="keyword" class="w-px300" value="${page.keyword }"/></li>
		<li><a class="btn_fill" onclick="$('form').submit()">검색</a></li>
	</ul>
</div>		
</form>
</body>
</html>