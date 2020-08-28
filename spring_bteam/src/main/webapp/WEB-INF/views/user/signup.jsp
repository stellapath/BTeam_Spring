<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<form action="signupReq">
	<table>
		<tr>
			<th>이메일</th>
			<td>
				<input type="text" name="user_email" required />
				<button type="button" onclick="email_check">이메일 중복 확인</button>
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="text" name="user_pw" required /></td>
		</tr>
		<tr>
			<th>별명</th>
			<td><input type="text" name="user_nickname" required /></td>
		</tr>
		<tr>
			<th>연락처</th>
			<td><input type="tel" name="user_phone" /></td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td><input type="number" name="user_zipcode" maxlength="5" /></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="user_address" /></td>
		</tr>
		<tr>
			<th>상세주소</th>
			<td><input type="text" name="detail_address" /></td>
		</tr>
		<tr>
			<th>생일</th>
			<td><input type="date" name="user_birth" /></td>
		</tr>
	</table>
	<input type="submit" value="회원가입" />
</form>
</body>
</html>