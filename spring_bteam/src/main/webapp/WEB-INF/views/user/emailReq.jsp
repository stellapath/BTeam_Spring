<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#popupForm {
	margin: 50px auto;
	padding: 50px;
	width: 500px; 
	border: 1px solid #ccc;
}
</style>

</head>
<body>
<body>
<!-- 창 크기 400 x 300 입니다. -->
<form action="emailCertificationReq" method="post" id="popupForm">
	<input type="text" name="emailKey" />
	<input type="submit" value="인증확인" />
</form>
</body>
</html>