<%@ page import="com.project.bteam.user.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
UserVO vo = (UserVO) session.getAttribute("login_info");
pageContext.setAttribute("vo", vo);
%>
<header>
	<div class="menuBar">
		<ul>
			<li><a href="companyPage" ${menu eq 'company' ? 'class="active"' : '' }>회사소개</a></li>
			<li><a href="productPage" ${menu eq 'product' ? 'class="active"' : '' }>제품안내</a></li>
			<li><a href="noticeBoard?board_category=0" ${menu eq 'notice' ? 'class="active"' : '' }>공지사항</a></li>
			<li><a href="reviewBoard?board_category=1" ${menu eq 'review' ? 'class="active"' : '' }>사용후기</a></li>
			<li><a href="qnaBoard" ${menu eq 'qna' ? 'class="active"' : '' }>문의하기</a></li>
		</ul>	
	</div>
	<div class="header_user">
	<c:if test="${!empty login_info }">
		<ul>
			<li style="margin-top:-24px;">
				<img src="profileImgDn?user_email=${login_info.user_email}" style="width:40px; border-radius:40px; " />
				${login_info.user_nickname }님 </li>
			<c:if test="${login_info.user_email eq 'admin'}">
				<li><a href="adminPage" ${menu eq 'admin' ? 'class="active"' : '' }>관리페이지</a></li>
			</c:if>
			<c:if test="${login_info.user_email ne 'admin'}">
				<li><a id="mypage" href="myPage?user_email=${login_info.user_email }" ${menu eq 'mypage' ? 'class="active"' : '' }>마이페이지</a></li>
			</c:if>	
			<li><a class="btn_fill" onclick="go_logout()">로그아웃</a></li>
		</ul>
	</c:if>	
	<c:if test="${empty login_info }">
		<c:if test="${!empty nonMember }">
		<ul>
			<li>${nonMember.order_name }님 (비회원)</li>
			<li><a onclick="nonMemberPage('${nonMember.order_name }', '${nonMember.order_email }')">주문내역</a></li>
			<li><a onclick="nonMemberOut()">비회원 로그아웃</a></li>
		</ul>
		</c:if>
		<c:if test="${empty nonMember }">
		<ul>
			<li><input type="text" id="user_email" placeholder="아이디(이메일)"/>
				<input onkeypress="if( event.keyCode==13){ go_login() }" type="password" id="user_pw" placeholder="비밀번호"/>
			</li>
			<li><a class="btn_fill" onclick="go_login()">로그인</a></li>
			<li><a class="btn_fill" href="signup">회원가입</a></li>
		</ul>
		</c:if>
	</c:if>	
	</div>
</header>
<script type="text/javascript">
function go_login(){
	if($("#user_email").val() == ""){
		location.href="login";
	}else{
		if($("#user_pw").val() == ""){
			alert('비밀번호를 입력하세요.');
			return;
		}
		//정보를 세션에 넣어놓은 후 로그인처리 화면은 전환될 필요가 없음. 
		//통신을 통해서 데이터 여부 파악하여 화면 세션에 넣어 에이잭스를 사용하여 리프레쉬
		$.ajax({
			url: 'loginReq',
			data: { user_email:$("#user_email").val(), user_pw:$("#user_pw").val() },
			success: function(data){
				if(data == "1"){	
	// 				alert("로그인 성공!!!");
					location.reload();
				}else{
					alert("아이디 또는 비밀번호가 일치하지 않습니다!!!");
				}
			},
			error: function(req, text){
				alert(text+':'+req.status);
			}		
		});
	}	
}

function go_logout(){
	$.ajax({
		url: 'logout',
		success: function(){
			location.reload();
		},
		error: function(req, text){
			alert(text+':'+req.status);
		}		
	});	
}
function nonMemberPage( name, email){
	location.href="nonMemberConfirm?name="+name+"&email="+email;
}
function nonMemberOut(){

	$.ajax({
		url: 'nonMemberOut',
		success: function(){
			alert('비회원 로그아웃 처리가 완료되었습니다.');
			location.href="home";
		},
		error: function(req, text){
			alert(text+':'+req.status);
		}	
	});
	
}
</script>