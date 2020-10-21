<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품소개</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">
.descriptionBox {margin-top: 50px; width: 100%; display: inline-block;}
.descriptionBar 
.descriptionBar {display: inline-block; width: 100%; margin: 0 auto;}
.descriptionBar ul{display: inline-block; width: max-content; margin:0 auto; text-align: center;}
.descriptionBar ul li {	margin: 0;	display: inline; float: left; padding: 0px; margin-right:20px;  width: max-content;}
.descriptionBar ul li:last-child {margin-right: 0;}
a.descriptionTitle { width: 150px; height:50px; line-height:50px; border:2px solid #F8AA34; display: inline-block;}
a.descriptionTitle:hover, .clicked { background-color: #F8AA34; 	color : white; font-weight: bold; margin: 0;}
.d_title p{   color: #2c2c2c;    font-size: 20px;    font-weight: 500;    font-family: 'Noto Sans KR',sans-serif;    text-align: center;    padding-bottom: 20px;		margin-bottom: 0;}
.d_text p{text-align: left; margin: 5px 0;}
p.miniTitle{ margin-top: 20px;}
.go_background { width: 100%; height: 100%; opacity: 0.6}

/*이미지 슬라이드*/
.sildeImages {  border-top: 8px solid white; border-bottom: 8px solid white; margin: 10px 0; overflow: hidden; min-width: 1000px;}
.slide { width: 500%;}
.slide::after { content: ""; display: block; clear: both; }
.slide > li { float: left; width: 20%; position: relative; height: 400px; overflow: hidden;}
.slide > li > img { display: block; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width: auto; }

.sildeImages01 {  border-top: 8px solid white; border-bottom: 8px solid white; margin: 10px 0; overflow: hidden; min-width: 1000px; }
.slide01 { width: 500%; }
.slide01::after { content: ""; display: block; clear: both; }
.slide01 > li { float: left;  width: 20%; position: relative; height: 400px; overflow: hidden; }
.slide01 > li > img { display: block; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width: auto;}
</style>
</head>
<body>
<div class="pageName">
	<p class="titleName">제품안내</p>
	<div class="titleLine"></div>
</div>
<div id="boxZone">
	<div id="overBox">
		<div class="boxSet overBox leftBox">
			<div class="textBox">
			<h3><i class="fas fa-mobile-alt"></i> 출근특보</h3>
			<hr>
			당신의 완벽한 하루의 시작을 돕는<br/> 
			알람어플리케이션입니다.
			</div>
		</div>
		<div class="boxSet overBox rightBox" style="background-color: #ededed;">
			<a class="lineBox" onclick="alert('어플리케이션 설치페이지 준비중');"><i class="fas fa-angle-double-right"></i> 어플리케이션 설치 바로가기</a>
		</div>	
	</div>
	<div id="underBox">
		<div class="boxSet underBox leftBox" style="background-color: #ededed;">
			<a class="lineBox" href="productDetail" style="margin-top: 100px;"><i class="fas fa-angle-double-right"></i> 스마트우산   상세정보보기</a><br/>
			<a class="lineBox" onclick="go_order()" style="margin-top: 20px;"><i class="fas fa-angle-double-right"></i> 스마트우산 구매 바로가기</a>
		</div>
		<div class="boxSet underBox rightBox">
			<div class="textBox">
			<h3><i class="fas fa-umbrella"></i> 스마트우산</h3>
			<hr>
			우산을 자주 잃어버리는 당신을 위한<br/>
			어플리케이션 연동 스마트 우산
			</div>
		</div>
	</div>
</div>
<div class="descriptionBox">
	<div class="descriptionBar">
	<ul>
		<li style="margin-right: -2px;"><a id="app" class="descriptionTitle">APP</a></li>
		<li><a id="iot" class="descriptionTitle">IOT</a></li>
	</ul>
	</div>
	<div id="appBox" style="display: none;">
		<div class="pageName">
			<p class="subTitleName">출근특보</p>
			<div class="titleLine"></div>
			<div>JAVA기반 안드로이드 앱</div>
		</div>
		<div class="sildeImages">
			<ul class="slide" style="height: 400px;">
                <li><img src="img/web_banner/app001.png" class="banner"></li>
                <li><img src="img/web_banner/app002.png" class="banner"></li>
                <li><img src="img/web_banner/app003.png" class="banner"></li>
            </ul>
		</div>
		<div class="d_Content">
			<div class="d_title">
				<p>주요기능안내</p>
				<div class="titleLine"></div>
			</div>
			<div class="d_text">
				<p class="miniTitle">[알람]</p>
				<hr>
				<p>- 기상알람 / 출근알람 / 메모내용을 읽어주는 보이스 알람</p>
				<p class="miniTitle">[날씨정보]</p>
				<hr>
				<p>- 공공API를 이용한 내 지역 날씨정보확인</p>
				<p class="miniTitle">[교통정보]</p>
				<hr>
				<p>- 게시판을 이용한 유저간의 교통정보 실시간 공유</p>
			</div>
		</div>
	</div>
	<div id="iotBox" style="display: none;">
		<div class="pageName">
			<p class="subTitleName">스마트우산</p>
			<div class="titleLine"></div>
			<div>Arduino를 이용한 IOT</div>
		</div>
		<div class="sildeImages01">
			<ul class="slide01">
                <li><img src="img/web_banner/iot001.png" class="banner"></li>
                <li><img src="img/web_banner/iot002.png" class="banner"></li>
                <li><img src="img/web_banner/iot003.png" class="banner"></li>
            </ul>
		</div>
		<div class="d_Content">
			<div class="d_title">
				<p>주요기능안내</p>
				<div class="titleLine"></div>
			</div>
			<div class="d_text">
				<p class="miniTitle">[분실방지]</p>
				<hr>
				<p>- 핸드폰과의 블루투스 연결이 끊기면 앱을 통한 알림발생</p>
				<p class="miniTitle">[배터리 확인]</p>
				<hr>
				<p>- 연동된 안드로이드 앱을 통해 iot의 배터리 잔량 확인</p>
				<p class="miniTitle">[led조절]</p>
				<hr>
				<p>- 사용자가 선호하는 색상으로 led색상변경</p>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
	$('#app').addClass('clicked');
	$('#appBox').show();
});
$(document).on('click', '#app', function(){
	$('#app').addClass('clicked');
	$('#iot').removeClass('clicked');
	$('#appBox').show();
	$('#iotBox').hide();
   
}).on('click', '#iot', function(){
	$('#iot').addClass('clicked');
	$('#app').removeClass('clicked');
	$('#appBox').hide();
	$('#appBox').children('.silde').css({"margin-left": "", "transition": ""});
	$('#iotBox').show();
});

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
							$slide.removeAttr("style").children(":first").appendTo($slide); }, 1500);
    }
});


$(function(){
	var $slide01 = $('.slide01');
	var timerId;
	timerId = window.setInterval(slideBanner, 2000);
	$(".sildeImages01").hover( function () { window.clearInterval(timerId);}, 
                    		 function () { timerId = window.setInterval(slideBanner, 2000); }
                			);
	function slideBanner() { 
		$slide01.css({ "margin-left": "-100%", "transition": "1s" });
        window.setTimeout(function () {  
							$slide01.removeAttr("style").children(":first").appendTo($slide01); }, 1500);
    }
});

function go_order(){
	if('${login_info.user_email}' == ""){
		if(confirm('고객님은 현재 비로그인상태입니다.\n비회원 주문을 진행하시겠습니까?')){
			location.href="order";
		}else return;
	}else location.href="order";
}
</script>
</body>

</html>