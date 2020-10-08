<%@ page import="com.project.bteam.board.BoardVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
BoardVO bvo = (BoardVO) session.getAttribute("boardList");
pageContext.setAttribute("bvo", bvo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
<form action="noticeBoard?board_category=0" method="post">
<div class="btnSet">
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