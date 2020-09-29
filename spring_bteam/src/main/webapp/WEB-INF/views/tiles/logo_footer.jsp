<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 로고CSS -->
<style type="text/css">
html, body{margin: 0; padding:0; height: 100%; }
body{position: relative; min-height: 100%; display: flex; flex-direction: column;}
#content, header {width: 80%; margin: 0 auto;}
#content {margin: 0 auto; padding-bottom: 100px; padding: 50px 0px; text-align: center;}
#logo_here{width: 500px; margin: 0 auto; text-align: center;}
img.logo{width: 100px; height: 100px;	}
footer{ padding:30px; background-color: #000; opacity: 0.6; width:100%; height: 100px; margin:0; bottom: 0; margin-top: auto; z-index: 9999;} 
footer *{ color: white; text-align: center; font-weight: normal; font-size: 15px;}
footer p{ margin: 0; }
</style>
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
<tiles:insertAttribute name="footer"/>
</body>
</html>