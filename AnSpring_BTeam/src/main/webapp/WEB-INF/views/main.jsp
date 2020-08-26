<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script>
$(document).ready(function() {
	$(".slider").bxSlider();
});
</script>
</head>
<body>
<%@ include file="include/header.html" %>
<div class="slider">
	<div><img src="https://c4.wallpaperflare.com/wallpaper/246/739/689/digital-digital-art-artwork-illustration-abstract-hd-wallpaper-preview.jpg" /></div>
	<div><img src="https://p4.wallpaperbetter.com/wallpaper/828/579/667/artistic-neon-huawei-light-purple-hd-wallpaper-preview.jpg" /></div>
</div>
</body>
</html>