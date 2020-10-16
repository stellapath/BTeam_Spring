<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<!-- css -->
<link rel="stylesheet" href="owlcarousel/owl.carousel.min.css">
<link rel="stylesheet" href="owlcarousel/owl.theme.default.min.css">
<style type="text/css">
#content {padding-bottom: 0;}

/*이미지 슬라이드*/
.sildeImages {  border-top: 8px solid white; border-bottom: 8px solid white; margin: 10px 0; overflow: hidden; min-width: 1000px;}
.slide { width: 600%;}
.slide::after { content: ""; display: block; clear: both; }
.slide > li { float: left; width: calc(100%/6); position: relative; height: 400px; overflow: hidden;}
.slide > li > img { display: block; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width: auto; }
/*하단로고이미지*/
#underLogoBox {width: 750px; margin: 0 auto; display: inline-block;}
#underLogoBox ul {overflow: hidden;}
#underLogoBox ul li {float: left;}

.underLogo {width: 150px; box-sizing: border-box;}
</style>
<!-- js -->
<script src="owlcarousel/owl.carousel.min.js"></script>
<script>
$(function(){
	var $slide = $('.slide');
	var timerId;
	timerId = window.setInterval(slideBanner, 2000);
	$(".sildeImages").hover( function () { window.clearInterval(timerId);}, 
                    		 function () { timerId = window.setInterval(slideBanner, 2000); }
                			);
	function slideBanner() { 
		$slide.css({ "margin-left": "-100%", "transition": "1s" });
        window.setTimeout(function () {  
							$slide.removeAttr("style").children(":first").appendTo($slide); }, 400);
    }
}); 
</script>
</head>
<body>
<div class="pageName">
	<p class="titleName">우산써조</p>
	<div class="titleLine"></div>
</div>
<div id="bannerBox">
	<div id="mainBanner">
		<img alt="우산써조" src="img/web_banner/company.png" id="full_image"/>
	</div>
	<div class="sildeImages">
		<ul class="slide">
			<li><img src="img/web_banner/app001.png" class="banner"></li>
			<li><img src="img/web_banner/app002.png" class="banner"></li>
			<li><img src="img/web_banner/app003.png" class="banner"></li>
			<li><img src="img/web_banner/iot001.png" class="banner"></li>
            <li><img src="img/web_banner/iot002.png" class="banner"></li>
            <li><img src="img/web_banner/iot003.png" class="banner"></li>
		</ul>
	</div>
</div>	
<div id="underLogoBox">
	<ul>
		<li><a href=""><img alt="한울직업전문학교" src="img/main_under/hanul_001.png" class="underLogo"/></a></li>
		<li><a href=""><img alt="한국고용정보원" src="img/main_under/logo_002.jpg" class="underLogo"/></a></li>
		<li><a href=""><img alt="Worknet" src="img/main_under/logo_003.jpg" class="underLogo"/></a></li>
		<li><a href=""><img alt="고용노동부" src="img/main_under/logo_004.jpg" class="underLogo"/></a></li>
		<li><a href=""><img alt="중소기업기술정보진흥원" src="img/main_under/logo_005.jpg" class="underLogo"/></a></li>
	</ul>
</div>
</body>
</html>