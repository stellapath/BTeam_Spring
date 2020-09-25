<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사소개</title>
<style type="text/css">
#kt,#tel {
	border: 2px solid #058eff;
	width:750px;
	height:100px;
	border-radius: 10px;
	background-color: #bfe2f5;
}
#wrap {
 margin: 0auto;
 padding: 100px;
}
#map {
 border: 5px solid #058eff;
 border-radius: 5px;
}

</style>
</head>
<body>
<div id="wrap">
	<p>회사를 소개합니다.</p>
	
	<h3 class="o">오시는길</h3>
	
	<p>(619-28) 광주광역시 서구 경열로 3 ( 농성동 271-4 ), 한울직업전문학교</p>
	<div id="map" style="width:600px;height:500px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8f6743850499b2f4b82c98bddf99345d"></script>
		<script>
			var container = document.getElementById('map');
			var options = {
				center: new kakao.maps.LatLng(35.153653, 126.888032),
				level: 3
			};
	
			var map = new kakao.maps.Map(container, options);
		</script>
	<h4>교통정보</h4>
	<div id="kt">
		<ul>
			<li>주   소 : (619-28) 광주광역시 서구 경열로 3 ( 농성동 271-4 )</li>
			<li>버   스 : 금호36, 문흥39, 봉선37, 송정19,송암68, 송암72, 나주160, 함평500, 지선1187, 마을763</li>
			<li>지 하 철 : 농성역1번 출구, (도보 5분여 소요)</li>
		</ul>
	</div>
	<h4>연락처</h4>
	<div id="tel">
		<ul>
			<li>전화번호 : 062)362-7797</li>
			<li>F A X : 062)362-7798</li>
		</ul>
	</div>
</div>
</body>
</html>
