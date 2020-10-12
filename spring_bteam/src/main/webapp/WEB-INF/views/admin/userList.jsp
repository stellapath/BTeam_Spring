<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<c:if test="${login_info.user_email ne 'admin'}">
<script>
alert("관리자전용 페이지입니다.");
location.href='login';
</script>
</c:if>
</head>
<body>
<table>
<tr><th>회원번호</th>
	<th>닉네임</th>
	<th>이메일</th>
	<th>생일</th>
	<th>삭제</th>
</tr>
<c:forEach items="${list}" var="vo">	
<tr><td>${vo.user_num }</td>
	<td>${vo.user_nickname }</td>
	<td style="text-align: left;"><a class="left" onclick="sendMail('${vo.user_email }')">${vo.user_email }</a></td>
	<td><fmt:formatDate value="${vo.user_birth }" pattern="yyyy-MM-dd"/></td>
	<td><a class="btn_fill_s" onclick="goodbyeMember('${vo.user_email }')">삭제</a></td>
</tr>
</c:forEach>
</table>

<script type="text/javascript">
function sendMail( user_email ){
	//alert(user_email);
	
}
function goodbyeMember( user_email ){
	//alert(user_key);
//	var result = confirm('회원님을 탈퇴시키겠습니까??');
	if( confirm('회원님을 탈퇴시키겠습니까??') ){
		$.ajax({
			url: 'goodbyeMember',
			data : {user_email: user_email},
			success : function( result ){
				if(result) alert('회원탈퇴처리가 완료되었습니다.');
				else alert('회원탈퇴처리에 실패했습니다. 잠시후 다시 시도해주세요.');
				location.reload();
			},
			error : function(req, text){
				alert(text + " : " + req.status);
				location.reload();
			}
		});
	}else{
		alert('회원탈퇴가 취소되었습니다.');
	}
}
</script>
</body>
</html>