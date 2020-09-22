<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용후기작성</title>
<c:if test="${login_info.user_email eq null}">
<script>
alert("사용후기는 구매자만 작성가능합니다.");
location.href="login";
</script>
</c:if>
</head>
<body>
<div class="container">
<form action="reviewWriteReq" method="post" enctype="multipart/form-data">
	<input type="hidden" name="board_nickname" value="${login_info.user_nickname}" />
	<input type="hidden" name="board_email" value="${login_info.user_email}" />
	<input type="hidden" name="board_category" value="1" />
	<table>
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
				<input type="file" name="file" id="attach_file" accept="image/*"/>
			</label>
			<span id="board_filename" ></span>
			<span id="delete_file" style="color : red;">
				<i class="fas fa-times file_icon"></i>
			</span>
			</td>
		</tr>
	</table><br/>
</form>
	<div id="btnSet">
		<a class="btn_fill" onclick="$('form').submit()">등록</a>
		<a class="btn_empty" onclick="javascript:if( confirm('작성을 취소하시겠습니까?') ){href='noticeBoard?board_category=0'}">취소</a>
	</div>
</div>	
<script type="text/javascript">
$('#attach_file').on('change', function(){
	if( this.files[0] ) $('#board_filename').text( this.files[0].name );
	$('#delete_file').css('display', 'inline');
});

$('#delete_file').on('click', function(){
	$('#board_filename').text('');
	$('#attach_file').val('');
	$('#delete_file').css('display', 'none');
});
</script>
<script type="text/javascript">
var imageFile = $('#attach_file').val();
var imgType = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;
var maxSize = 5 * 1024 * 1024;
var imgSize;

if(imageFile != "" && imageFile != null) {
	imgSize = document.getElementById("attach_file").files[0].size;
    
    if(!imageFile.match(imgType)) {
    	alert("이미지 파일만 업로드 가능");
        return;
    } else if(imgSize = maxSize) {
    	alert("파일 사이즈는 5MB까지 가능");
        return;
    }
}
</script>
</body>
</html>