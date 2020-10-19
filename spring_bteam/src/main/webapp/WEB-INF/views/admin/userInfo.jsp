<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
<div class="pageName">
	<p class="subTitleName">${vo.user_nickname}님의 회원정보</p>
	<div class="titleLine"></div>
</div>
<div>
	<table id="boardTable">	
		<tr>
			<th class="w-px120">프로필 사진</th>
			<td style="text-align: left;">
				<img src="profileImgDn?user_email=${vo.user_email}" style="width:100px;" />
			</td>
		</tr>
		<tr><th>이메일</th>
			<td style="text-align: left;">${vo.user_email}</td>
		</tr>
		<tr><th>비밀번호</th>
			<td style="text-align: left;">${vo.user_pw}</td>
		</tr>		
		<tr>
			<th>닉네임</th>
			<td style="text-align: left;">${vo.user_nickname}</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td style="text-align: left;">${vo.user_phone}</td>
		</tr>
		<tr>
			<th>주소</th>
			<td style="text-align: left;">
			<c:if test="${!empty vo.user_address }">
				(${vo.user_zipcode})<br/>${vo.user_address} ${vo.detail_address}
			</c:if>
			<c:if test="${empty vo.user_address }">-</c:if>
			</td>
		</tr>
		<tr>
			<th>생일</th>
			<td style="text-align: left;">
			<c:if test="${!empty vo.user_birth }">${vo.user_birth}</c:if>
			<c:if test="${empty vo.user_birth }">-</c:if>
			</td>
		</tr>
	</table>
</div>
</body>
</html>