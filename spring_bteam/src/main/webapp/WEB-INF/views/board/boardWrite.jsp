<%@ page import="com.project.bteam.board.BoardVO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
int board_category = Integer.parseInt(request.getParameter("board_category"));
String name = "";
if (board_category == 0) {
	name = "공지사항";
}

pageContext.setAttribute("name", name);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${name} 글쓰기</title>
<c:if test="${login_info.user_email ne 'admin'}">
<script>
alert("관리자전용 페이지입니다.");
location.href='login';
</script>
</c:if>
</head>
<body>
<div class="pageName">
	<p class="subTitleName">공지사항 작성</p>
	<div class="titleLine"></div>
</div>
<div class="container">
<form action="boardWriteReq" method="post" enctype="multipart/form-data">
	<input type="hidden" name="board_nickname" value="${login_info.user_nickname}" />
	<input type="hidden" name="board_email" value="${login_info.user_email}" />
	<input type="hidden" name="board_category" value="0" />
	<table id="boardTable">
		<tr>
			<th>작성자</th>
			<td>${login_info.user_nickname}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="board_title" required /></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="5" cols="20" name="board_content"></textarea></td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td style="text-align: left;">
			<label>
				<img alt="파일선택" src="img/attach.png" class="file_icon">
				<input type="file" name="file" id="attach-file"/>
			</label>
			<span id="board-filename" ></span>
			<span id="delete-file" style="color : red;">
				<i class="fas fa-times file_icon"></i>
			</span>
			</td>
		</tr>
	</table><br/>
</form>
	<div id="btnSet">
		<a class="btn_fill" onclick="$('form').submit()">등록</a>
		<a class="btn_empty" onclick="javascript:if( confirm('작성글을 취소하시겠습니까?') ){href='noticeBoard?board_category=0'}">취소</a>
	</div>
</div>	
<script type="text/javascript">
$('#attach-file').on('change', function(){
	if( this.files[0] ) $('#board-filename').text( this.files[0].name );
	$('#delete-file').css('display', 'inline');
});

$('#delete-file').on('click', function(){
	$('#board_filename').text('');
	$('#attach-file').val('');
	$('#delete-file').css('display', 'none');
});

</script>
</body>
</html>