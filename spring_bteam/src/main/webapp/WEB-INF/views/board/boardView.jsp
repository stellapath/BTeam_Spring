<%@ page import="com.project.bteam.board.BoardVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%-- <% --%>
<!-- // BoardVO bvo = (BoardVO) session.getAttribute("boardList"); -->
<!-- // pageContext.setAttribute("bvo", bvo); -->

<!-- // pageContext.setAttribute("enter", "\n"); -->
<%-- %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>
<div class="pageName">
	<p class="subTitleName">공지사항 상세화면</p>
	<div class="titleLine"></div>
</div>
<div class="container" align="center">
	<table>
		<tr>
			<th class="w-px120">제목</th>
			<td>${bvo.board_title }</td>
			<th class="w-px120">작성자</th>
			<td>${bvo.board_nickname }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${bvo.board_date }</td>
			<th>조회수</th>
			<td>${bvo.board_readcnt }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="3" width="500" name="board_content">
				${fn:replace(bvo.board_content, crlf, '<br/>')}
			</td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td colspan="3" name="board_file" style="text-align: left;">
				<c:if test="${empty bvo.board_filename }">
					첨부된 파일이 없습니다.
				</c:if>
				<c:if test="${!empty bvo.board_filename }">
					<label>
						<img alt="첨부파일" src="img/attach.png" class="file_icon">
						<a href="download?board_num=${bvo.board_num }&board_category=0">${bvo.board_filename }</a>
					</label>
				</c:if>
			</td>
		</tr>
	</table><br/>
	<div id="btnSet">
			<c:if test="${login_info.user_email eq 'admin'}">
			<a class="btn_fill" onclick="javascript:if( confirm('게시글을 수정하시겠습니까?') ){ href='boardUpdate?board_num=${bvo.board_num}&board_category=${bvo.board_category}'}">수정</a>
			<a class="btn_fill" onclick="javascript:if( confirm('게시글을 삭제하시겠습니까?') ){ href='boardDelete?board_num=${bvo.board_num}&board_category=${bvo.board_category}'}">삭제</a>
			<a class="btn_fill" href="boardWrite?board_category=${bvo.board_category}">글쓰기</a>
			</c:if>
			<a class="btn_empty" href="noticeBoard?board_category=0">목록</a>
	</div>
</div>
</body>
</html>