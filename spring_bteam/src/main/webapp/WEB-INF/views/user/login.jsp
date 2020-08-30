<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<form action="loginReq" method="post" id="form">
	<table>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="user_email" required /></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="text" name="user_pw" /></td>
		</tr>
	</table>
	<input type="submit" value="로그인" />
	<button type="button" onclick="location.href='signup'">회원가입</button> 
</form>
</body>
</html>