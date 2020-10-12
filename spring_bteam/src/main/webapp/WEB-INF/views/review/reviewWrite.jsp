<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용후기작성</title>
<c:if test="${empty login_info }">
<script type="text/javascript">
alert('로그인 후 작성가능합니다.');
location.href="login";
</script>
</c:if>
</head>
<body>
<h3>사용후기 작성화면</h3>
<div class="container">
<form action="reviewWriteReq" method="post" enctype="multipart/form-data">
	<input type="hidden" name="board_nickname" value="${login_info.user_nickname}" />
	<input type="hidden" name="board_email" value="${login_info.user_email}" />
	<input type="hidden" name="board_category" value="1" />
	<input type="hidden" name="order_num" value="${vo.order_num }" />
	<table id="boardTable">
		<tr>
			<th>구매상품</th>
			<td>${vo.order_product }</td>
		</tr>
		<tr><th>추천여부</th>
			<td>
				<label style="margin-right: 100px;"><input type="radio" name="board_recommend" value="RECOMMEND"/>추천<i class="far fa-thumbs-up"></i></label>
				<label><input type="radio" name="board_recommend" value="DERECOMMEND"/>비추천<i class="far fa-thumbs-down"></i></label>
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="board_title" class="need" title="제목"/></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="5" cols="20" name="board_content" class="need" title="내용"></textarea></td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td style="text-align: left;">
			<label class="fileUpload">
				<img alt="파일선택" src="img/attach.png" class="file_icon">
				<input type="file" name="file" id="attach-file" accept="image/*"/>
			</label>
			<span id="preview"></span>
			<span id="board-filename"></span>
			<span id="delete-file" style="color : red;"><i class="fas fa-times file_icon"></i></span>
			</td>
		</tr>
	</table><br/>
</form>
	<div id="btnSet">
		<a class="btn_fill" onclick="if(necessary()){$('form').submit()}">등록</a>
		<a class="btn_empty" href="reviewBoard?board_category=1">취소</a>
	</div>
</div>	
<script type="text/javascript">
$(document).on('change', '#select_orderNum', function(){
	var orderNum = $('#select_orderNum').val();
//	alert(orderNum);	
}).on('click', '#testBtn', function(){
	var orderNum = $('#select_orderNum').val();
	alert(orderNum);	
});

$('input[name=board_title], input[name=board_content]').on('keydown', function(){
//	alert($('input:radio[name=board_recommend]').is(':checked'));
	var need = true;
	if($('input:radio[name=board_recommend]:checked').length < 1){
 		alert('추천여부를 선택하세요!!');
 		need = false;
 		return need;
	}
	return need;
});
</script>	
<script type="text/javascript" src="js/image_preview.js"></script>
<script type="text/javascript" src="js/need_check.js"></script>
<script type="text/javascript" src="js/file_attach.js"></script>
</body>
</html>