<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<c:if test="${login_info eq null}">
<script>
	alert("로그인이 필요한 페이지 입니다.");
	location.href = "login";
</script>
</c:if>

<script>
function imageUpload() {
	window.open("profileImgUp", "프로필 이미지 변경", 
		"width=400, height=300, scrollbars=0, status=0, toolbar=0"
	);
}
</script>
</head>
<body>
<table>	
	<tr>
		<th>프로필 사진</th>
		<td>
			<img src="profileImgDn?user_email=${login_info.user_email}" style="width:40px;" /><br />
			<button type="button" onclick="imageUpload()" >이미지 변경</button>
		</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>${login_info.user_email}</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td>${login_info.user_pw}</td>
	</tr>

	<tr>
		<th>닉네임</th>
		<td>${login_info.user_nickname}</td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td>${login_info.user_phone}</td>
	</tr>
	<tr>
		<th>주소</th>
		<td>
			${login_info.user_zipcode}<br />
			${login_info.user_address}<br />
			${login_info.detail_address}
		</td>
	</tr>
	<tr>
		<th>생일</th>
		<td>${login_info.user_birth}</td>
	</tr>
</table>
</body>
</html>