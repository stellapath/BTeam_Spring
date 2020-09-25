<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 로고CSS -->
<style type="text/css">
#logo_here{width: 500px; margin: 0 auto; text-align: center;}
img.logo{width: 100px; height: 100px;	}
</style>
<link rel='stylesheet' type='text/css' href='css/common.css?v=1<%= new java.util.Date().getTime()%>'>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- font-awesome 라이브러리 -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/js/all.min.js"></script>
</head>
<body>
<div id="logo_here">
	<a href="home">
		<img alt="임시로고" src="img/pre_logo.png" class="logo">
	</a>
</div>

<tiles:insertAttribute name="content"/>

</body>
</html>