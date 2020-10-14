<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사소개</title>
<style type="text/css">
/* #kt, #tel { */
/* 	border: 2px solid #058eff; */
/* 	width: 750px; */
/* 	height: 100px; */
/* 	border-radius: 10px; */
/* 	background-color: #bfe2f5; */
/* } */

#staticMap { margin: 30px 0;}
</style>
</head>
<body>
<div class="pageName">
	<p class="titleName">회사소개</p>
	<div class="titleLine"></div>
</div>
<div id="companyAbout">
	<div id="company_image">
<!----------------------------------------------------회사소개이미지---------------------------------------------------->
		<img alt="회사소개이미지" src="img/company.png" class="full_image">
	</div>
	<div class="bgInner">
		<div class="innerTitle">
			<p>W E L C O M E</p>
			<p>우산써조를 방문해 주셔서 감사합니다.</p>
		</div>
		<div class="innerContent">
			<div>
<!----------------------------------------------------회사소개 좌측글--------------------------------------------------->
				<div class="content_left">
					저희 우산써조 팀원들은 여섯명의 JAVA기반 응용SW 개발자 양성과정 수강생들로 구성되었습니다. 
					2020년 4월 20일부터 꾸준히 쌓아온 경험과 노하우를 바탕으로 프로젝트(WEB + APP + IOT)를 준비하였습니다.
					회사소개글이 들어가는 부분입니다. 회사소개글이 들어가는 부분입니다. 회사소개글이 들어가는 부분입니다. 
					회사소개글이 들어가는 부분입니다. 회사소개글이 들어가는 부분입니다. 회사소개글이 들어가는 부분입니다. 
					회사소개글이 들어가는 부분입니다. 회사소개글이 들어가는 부분입니다. 회사소개글이 들어가는 부분입니다. </div>
<!----------------------------------------------------회사소개 우측글--------------------------------------------------->
				<div class="content_right">
					저희 우산써조 팀원들은 여섯명의 JAVA기반 응용SW 개발자 양성과정 수강생들로 구성되었습니다. 
					2020년 4월 20일부터 꾸준히 쌓아온 경험과 노하우를 바탕으로 프로젝트(WEB + APP + IOT)를 준비하였습니다.
					회사소개글이 들어가는 부분입니다. 회사소개글이 들어가는 부분입니다. 회사소개글이 들어가는 부분입니다. 
					회사소개글이 들어가는 부분입니다. 회사소개글이 들어가는 부분입니다. 회사소개글이 들어가는 부분입니다. 
					회사소개글이 들어가는 부분입니다. 회사소개글이 들어가는 부분입니다. 회사소개글이 들어가는 부분입니다.</div>
			</div>
		</div>
	</div>
</div>
<div id="companyLoad">
	<h3 class="o">오시는길</h3>

	<p>(619-28) 광주광역시 서구 경열로 3 ( 농성동 271-4 )</p>
	<div id="staticMap" style="width: 100%; height: 500px;"></div>
	<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8f6743850499b2f4b82c98bddf99345d"></script>
	<script>
		var markers = [ {
			position : new kakao.maps.LatLng(35.153653, 126.888032)
		}, {
			position : new kakao.maps.LatLng(35.153653, 126.888032),
			text : '한울직업전문학교'
		} ];
		var staticMapContainer = document.getElementById('staticMap'), 	// 이미지 지도를 표시할 div  
		staticMapOption = {
			center : new kakao.maps.LatLng(35.153653, 126.888032), 		// 이미지 지도의 중심좌표
			level : 3, 													// 이미지 지도의 확대 레벨
			marker : markers											// 이미지 지도에 표시할 마커 
		};
		// 이미지 지도를 생성
		var staticMap = new kakao.maps.StaticMap(staticMapContainer, staticMapOption);
	</script>
	<div class="innerContent">
		<div>
		<div id="kt" class="content_left">
		<h4>교통정보</h4>
		<hr>
			<ul>
				<li>주 소 : (619-28) 광주광역시 서구 경열로 3 ( 농성동 271-4 )</li>
				<li>버 스 : 금호36, 문흥39, 봉선37, 송정19,송암68, 송암72, 나주160, 함평500, 지선1187, 마을763</li>
				<li>지 하 철 : 농성역1번 출구 (도보 5분소요)</li>
			</ul>
		</div>
		<div id="tel" class="content_right">
		<h4>연락처</h4>
		<hr>
			<ul>
				<li><a href="qnaWrite">이메일 : bteamproject0420@gmail.com</a></li>
				<li>전화번호 : 062)362-7797</li>
				<li>F A X : 062)362-7798</li>
			</ul>
		</div>
		</div>
	</div>
</div>
</body>
</html>