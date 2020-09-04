<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 이미지 변경</title>
<c:if test="${login_info eq null}">
<script>
	alert("로그인이 필요한 페이지 입니다.");
	self.close();
</script>
</c:if>
<script>
window.onload = () => {
	document.querySelector("#form").onsubmit = () => {
		if (!document.querySelector("#user_image").value) {
			alert("이미지를 선택해주세요.");
			return false;
		}
	};
};
</script>
</head>
<body>
<!-- 창 크기 400 x 300 입니다. -->
<form action="profileImgUpReq" method="post" enctype="multipart/form-data" id="form">
	<input type="file" name="file" accept="image/*" id="user_image" />
	<input type="submit" value="이미지 변경" />
</form>
</body>
</html>