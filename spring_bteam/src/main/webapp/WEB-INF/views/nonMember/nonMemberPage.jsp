<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#nonMemberLogin { margin-top: 50px;}
.button { margin-top: 30px; }
</style>
</head>
<body>
<div class="pageName">
	<p class="subTitleName">비회원 전용페이지</p>
	<div class="titleLine"></div>
</div>
<div>
	<div id="nonMemberLogin">
	<form action="nonMemberConfirm" method="post">
		<p>주문자 이메일&nbsp;<input type="text" name="email"/></p>
		<p>주문자 이름&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="name" onkeypress="if( event.keyCode==13){ nonMember_in() }"/></p>
		<div class="button">
			<a class="btn_fill" onclick="nonMember_in()">비회원로그인</a>
			<a class="btn_empty" >취소</a>
		</div>
	</form>	
	</div>
</div>
<script type="text/javascript">
function nonMember_in(){
	var getEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	if($('[name=email]').val() == ''){ 
		alert('이메일을 입력하세요');  
		$('[name=email]').focus(); 
		return;
	}else {
		if (!getEmail.test($('[name=email]').val())) {
			alert('이메일을 형식을 확인하세요');  
			$('[name=email]').focus(); 
			return;
		}	
		if($('[name=name]').val() == ''){ 
			alert('이름을 입력하세요');  
			$('[name=name]').focus();
			return; 
		}else { 
			$.ajax({
				url: 'nonMemberIn',
				data: {email: $('[name=email]').val(),
					   name: $('[name=name]').val()
				},
				success: function(data){
					if(data == 0){ alert('주문정보가 없습니다.'); return; }
					if(data == 1){
						alert('로그인');
						$('form').submit(); 
					}
				},	
				error: function(text, req){
					alert(text + " : " + req.status);
				}
			});
			
		}
	}
	
}
</script>
</body>
</html>