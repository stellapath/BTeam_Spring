<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BTeam Project</title>
<!-- 로고CSS -->
<style type="text/css">
html, body{margin: 0; padding:0; height: 100%; background-color: #344955}
body{position: relative; min-height: 100%; display: flex; flex-direction: column;}
#content, header {width: 80%; margin: 0 auto;}
#content {margin: 0 auto; padding-bottom: 100px; padding: 50px 0px; text-align: center;}
#logo_here{width: 500px; margin: 0 auto; text-align: center;}
img.logo{width: 100px; height: 100px;	margin-top: 20px;}
a {text-decoration: none; color: black;}
a:hover{ margin-top:-1px; cursor: pointer;}
ul{list-style: none; padding: 0;}
ul li{float: left;}

/*로그인, 비번찾기, 회원가입 입력폼*/
#wrap { background-color: #ffffff; border-radius: 20px; width: 550px;}
.button {background-color: #F8AA34;}

/*푸터*/
footer { padding:25px 0px; background-color: #dddedf; width:auto; height: 200px; margin:0; bottom: 0; margin-top: auto; z-index: 9999;} 
#footerZone { width: 80%; margin: 0 auto;    height: max-content;  box-sizing: border-box; min-width: max-content;}
#footerLeft { float: left;}
#footerRight { float: right; margin-right: 50px;}
#footerZone p{ margin: 0; font-size: 15px; font-size: 15px; text-align: left;}
#footerZone h4{ margin: 5px 0px;}
#snsIcon svg {margin-right: 10px;}
#snsIcon svg:last-child {margin-right: 0px;}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- font-awesome 라이브러리 -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/js/all.min.js"></script>
</head>
<body>
<div id="logoNheader">
<div id="logo_here">
	<a href="home">
		<img alt="로고" src="img/logo/logo_transparent.png" class="logo">
	</a>
</div>	
</div>
<tiles:insertAttribute name="content"/>
<tiles:insertAttribute name="footer"/>
</body>
</html>