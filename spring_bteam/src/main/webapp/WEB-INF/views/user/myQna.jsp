<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>${vo.user_nickname}님의 마이페이지</h3>
<div class="myMenuBar">
<ul>
	<li><a href="myPage?user_email=${login_info.user_email }" ${mypage eq 'info' ? 'class="active"' : '' }>개인정보수정</a></li>
	<li><a href="myOrder" ${mypage eq 'order' ? 'class="active"' : '' }>나의 주문내역</a></li>
	<li><a href="myQna" ${mypage eq 'qna' ? 'class="active"' : '' }>나의 문의내역</a></li>
</ul>
</div>
<table>
</table>
</body>
</html>