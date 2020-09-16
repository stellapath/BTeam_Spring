<%@ page import="com.project.bteam.board.BoardVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
BoardVO bvo = (BoardVO) session.getAttribute("boardList");
pageContext.setAttribute("bvo", bvo);

pageContext.setAttribute("enter", "\n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/header.jsp"/>
<div class="container" align="center">
	<table border="1px solid #ccc">
		<tr>
			<th>제목</th>
			<td>${bvo.board_title }</td>
			<th>작성자</th>
			<td>${bvo.board_nickname }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${bvo.board_date }</td>
			<th>좋아요</th>
			<td align="center">${bvo.board_like }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="3" width="500">
				${fn:replace(bvo.board_content, enter, "<br/>") }
			</td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td colspan="3">
				<c:if test="${empty bvo.board_file }">
					첨부된 파일이 없습니다.
				</c:if>
				<c:if test="${not empty bvo.board_file }">
					<a href="">${bvo.board_file }</a>
				</c:if>
			</td>
		</tr>
	</table>
	<div id="buttons">
			<c:if test="${login_info.user_email eq 'admin'}">
			<a onclick="javascript:if( confirm('게시글을 수정하시겠습니까?') ){ href='boardUpdate?board_num=${bvo.board_num}&board_category=${bvo.board_category}'}">수정</a>
			<a onclick="javascript:if( confirm('게시글을 삭제하시겠습니까?') ){ href='boardDelete?board_num=${bvo.board_num}&board_category=${bvo.board_category}'}">삭제</a>
			<a href="boardWrite?board_category=${bvo.board_category}">글쓰기</a>
			</c:if>
			<a href="noticeBoard?board_category=0">목록</a>
	</div>
</div>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>