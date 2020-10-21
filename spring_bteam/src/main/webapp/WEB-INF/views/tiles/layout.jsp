<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우산써조</title>
<link rel='stylesheet' type='text/css' href='css/common.css?v=1<%= new java.util.Date().getTime()%>'>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- font-awesome 라이브러리 -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/js/all.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Gugi&family=Noto+Sans+KR:wght@300;500&display=swap" rel="stylesheet">
</head>
<body>
<div id="logoNheader">
<div id="logo_here">
	<a href="home">
		<img alt="로고" src="img/logo/logo_transparent.png" class="logo">
	</a>
</div>	
<tiles:insertAttribute name="header"/>
</div>
<div id="content">
<tiles:insertAttribute name="content"/>
</div>
<tiles:insertAttribute name="footer"/>
</body>
</html>