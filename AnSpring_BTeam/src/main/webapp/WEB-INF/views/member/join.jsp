<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join/회원가입화면</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#check_pw").keyup(function(){
		if($("#check_pw").val() != $("#pw").val()){
			$("#check_msg").html("비밀번호 불일치").css("color", "red");
			return false;
		}else{
			$("#check_msg").html("비밀번호 일치").css("color", "green");
			
		}
	});
});
</script>
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
</head>
<body>
<div align="center">
<h3>[회원가입]</h3>
<form action="joinRequest" method="post">
<table border= "1">
<tr align="center">
	<td colspan="2">필수 입력사항</td>
</tr>
<tr>
	<th>아이디</th>
	<td><input type="text" name="id" required="required" /></td>
</tr>
<tr>
	<th>비밀번호</th>
	<td><input type="password" name="pw" id="pw" required="required" /></td>
</tr>
<tr>
	<th>비밀번호확인</th>
	<td>
		<input type="password" name="check_pw" id="check_pw" required="required" /><br/>
		<span id="check_msg"></span>
	</td>
</tr>
<tr>
	<th>성명</th>
	<td><input type="text" name="name" required="required"/></td>
</tr>
<tr>
	<th>이메일</th>
	<td><input type="text" name="email" required="required"/></td>
</tr>
<tr align="center">
	<td colspan="2">선택 입력사항</td>
</tr>
<tr>
	<th>전화번호</th>
	<td><input type="text" name="phone"/></td>
	<!-- 전화번호 3개로 나눠서 입력받기!!! -->
</tr>
<tr>
	<th>우편번호</th>
	<td>
		<input type="text" name="post" class="postcodify_postcode5" value="" />
		<button id="postcodify_search_button">검색</button>
	</td>
</tr>
<tr>
	<th>도로명주소</th>
	<td><input type="text" name="address" class="postcodify_address" value="" />
</td>
</tr>
<tr>
	<th>상세주소</th>
	<td><input type="text" name="de_address" class="postcodify_details" value="" /></td>
</tr>
</table><br/>
<input type="submit" value="회원등록"/>
<input type="reset" value="다시작성" />
<br/>
</form>
</div>
</body>
</html>