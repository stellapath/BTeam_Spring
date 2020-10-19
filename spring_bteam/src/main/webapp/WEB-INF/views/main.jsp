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
/*플로팅버튼*/
#btnOrderBox{ position: absolute; top: 50%; right: 8%;}
#btnOrder {background-color: #F8AA34; border: 2px solid; border-radius:10px; color : #232F34; width: max-content; padding: 5px 10px; font-weight: bold;}
a.subTitleName {color: #2c2c2c;    font-size: 20px;    font-weight: 500;    font-family: 'Noto Sans KR',sans-serif;    text-align: center;    padding-bottom: 20px;		margin-bottom: 0;}
    .button-wrapper {
        display: inline-block;
        margin: 20px 5px;
        padding: 40px;
    }
    .button {
        background: #232F34;
        padding: 2px;
        cursor: pointer;
        display: block;
        position: relative;
        overflow: hidden;
        transition: all .35s ease-in-out .35s;
        margin: 0 auto;
        width: 220px;
        text-align: center;
    }
    span {
        display: block;
        border: 2px solid #F8AA34;
        padding: 15px 30px;
        background: #F8AA34;
        z-index: 100;
        position: relative;
        transition: all .35s ease-in-out .35s;
    }
    .button:hover span {
    	border: 2px solid #232F34;
        background: #232F34;
        color: #F8AA34;
        transition: all .35s ease-in-out .35s;
    }
    .button:after {
        bottom: -100%;
        right: -100%;
        content: "";
        width: 100%;
        height: 100%;
        position: absolute;
        background: #F8AA34;
        transition: all .35s ease-in-out .5s;
    }
    .button:hover:after {
        right: 0;
        bottom: 0;
        transition: all ease-in-out .35s;
    }
    .button:before {
        top: -100%;
        left: -100%;
        content: "";
        width: 100%;
        height: 100%;
        position: absolute;
        background: #F8AA34;
        transition: all .35s ease-in-out .5s;
    }
    .button:hover:before {
        left: 0;
        top: 0;
        transition: all ease-in-out .35s;
    }


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
$(document).ready(function(){

	//움직이는 버튼(주문페이지 이동)
	var floatPosition = parseInt($("#btnOrderBox").css('top'));

	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";

		//애니메이션없음(위치고정)
		//$("#btnOrder").css('top', newPosition);
		//애니메이션있음(이동효과)
		$("#btnOrderBox").stop().animate({"top" : newPosition	}, 100);

	}).scroll();

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
function go_order(){
	if('${login_info.user_email}' == ""){
		if(confirm('고객님은 현재 비로그인상태입니다.\n비회원 주문을 진행하시겠습니까?')){
			location.href="order";
		}else return;
	}else location.href="order";
}
</script>
</head>
<body>
<div id="btnOrderBox">
<!--  	<a class="btnOrder" onclick="go_order()"><span>제품구매 바로가기</span></a> -->

<div class="light-button button-wrapper">
    <div class="button">
        <a class="btnOrder subTitleName" onclick="go_order()"><span>제품구매 바로가기</span></a>
    </div>  
</div>
</div>
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