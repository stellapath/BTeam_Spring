<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/header.css">

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>header</title>

</head>
<body>
	<div class="navbar">
		<div class="navbar__logo">
			<a href=""> <i class="ri-ruler-line"></i> &nbsp;&nbsp;Title
			</a>
		</div>
		<ul class="navbar__menu">
			<li><a href="">menu</a></li>
			<li><a href="">menu</a></li>
			<li><a href="">menu</a></li>
			<li><a href="">menu</a></li>
			<li><a href="">menu</a></li>
		</ul>
		<ul class="navbar__profile">
			<li><a href=""><i class="ri-account-circle-fill ri-2x"></i></a></li>
		</ul>
		<a href="#" class="navbar__toggleBtn"> <i
			class="ri-menu-line ri-2x"></i>
		</a>
	</div>

	<script>
  	const toggleBtn = document.querySelector(".navbar__toggleBtn");
  	const menu = document.querySelector(".navbar__menu");
  	const profile = document.querySelector(".navbar__profile");
  	toggleBtn.addEventListener("click", () => {
	  menu.classList.toggle("active");
	  profile.classList.toggle("active");
  });
  </script>
</body>
</html>