<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#listBar {display: inline-block; width: 100%; margin-top: 50px; margin-bottom: 20px;}
#listBar ul {overflow: visible; width: 1000px; margin: 0px auto;}
#listBar ul li {float: left; width: 500px; box-sizing: border-box;}
#listBar ul li:nth-child(2n){ margin-left: -2px;}
#listBar ul li:nth-child(3){ margin-top: -2px;}
a.productName { display:inline-block; width:100%; padding: 10px 0; border: 2px solid #F8AA34; font-weight: bold; box-sizing: border-box;}
a.productName:hover, a.goPage:hover, a.clicked { background-color: #F8AA34; margin: 0; }
a.productName li:last-child { border-left: 0px; }

.productBox, .productOverZone {display: inline-block; width: 100%; min-width: max-content;  max-width: 1000px;}
.productOverZone {overflow: hidden;}
.productMainImage, .productInfo {display: block; width: 50%; min-width: 300px; min-height:300px; box-sizing: border-box; float: left;}
.productMainImage { vertical-align: middle;}
.productInfo ul li:first-child{ text-align: left;}

.noImage {width: 300px; margin: 0 auto; vertical-align: middle;}
.productDetailImage { height:max-content; vertical-align: middle;}
.detailImage{ width: 100%;}
.defaultImage{height: 300px; width: 300px; border: 10px solid #a8a8a8;}

.deliv_info{margin: 40px 0; padding: 20px; background-color: #f2f2f2; border-radius: 10px;}
.deliv_info p {text-align: left; margin: 5px 0;}
.deliv_info p.info_title {font-weight: bold;}
.deliv_info p:not(.info_title) {font-size: 13px;}

.btnGoPage { margin: 20px 0px; width: 100%; }
.goPage{ display:inline-block; width: 300px; margin: 5px 0 auto; padding: 10px 0; border: 2px solid #F8AA34; border-radius: 5px; font-weight: bold;}

</style>
</head>
<body>
<div class="pageName">
	<p class="titleName">제품상세정보</p>
	<div class="titleLine"></div>
</div>
<div id="listBar">
	<ul class="grid"><c:forEach items="${product }" var="vo">
		<li><a class="productName">${vo.p_name }</a></li>
		</c:forEach>
	</ul>
</div>
<c:forEach items="${product }" var="vo">
<div class="productBox">
	<div class="productOverZone">
		<div class="productMainImage">
			<c:if test="${!empty vo.p_defaultimage_path}">
			<img src="<c:url value='/' />${vo.p_defaultimage_path}" class="defaultImage"/>
			</c:if>
			<c:if test="${empty vo.p_defaultimage_path}">
			<img alt="상품준비중" src="img/product_noimage.png" class="noImage"/>
			</c:if>
		</div>
		<div class="productInfo">
			<ul>
				<li style="font-weight: bold;"><p>${vo.p_name }</p></li>
				<li><hr></li>
				<li style="text-align: right; padding-right: 10px; "><p><i class="fas fa-won-sign"></i><fmt:formatNumber value="${vo.p_price }" pattern="#,###"/></p></li>
			</ul>
		</div>
	</div>
	<div class="productUnderZone">
		<p class="subTitleName">상세정보</p>
		<hr/>
		<div class="productDetailImage">
		<c:if test="${!empty vo.p_detailimage_path}">
			<img src="<c:url value='/' />${vo.p_detailimage_path}" class="detailImage"/>
			</c:if>
			<c:if test="${empty vo.p_detailimage_path}">
			<img alt="상품준비중" src="img/product_noimage.png" class="noImage"/>
			</c:if>
		</div>
		<div class="deliv_info">
		<p class="info_title"><i class="fas fa-info-circle"></i>&nbsp;배송안내</p>
		<hr>
		<p>배송비: 2,500원(3만원 이상 구매시 무료배송, 제주도 및 도서산간지역 3,000원 추가)</p>
		<br/><br/>
		<p class="info_title"><i class="fas fa-info-circle"></i>&nbsp;교환 및 반품 안내</p>
		<hr>
		<p>단순변심에 의한 교환 및 반품의 경우 택배비는 고객님이 부담하시게 됩니다.</p>
		<p>제품불량으로 인한 상품의 회수 및 교환은 불량 확인 후, 본사에서 진행해 드립니다.</p>
		<p>본사와의 상담없는 임의 반품건은 수취거부되며 배송에 관련한 모든 비용은 고객님께 청구됩니다.</p>
		<br/>
		<p>아래의 사항의 경우는 교환/반품(불량) 불가사유입니다.</p>
		<p>1. 상품의 미세한 스크래치가 있을 수 있습니다.</p>
		<br/>
		<p>본 제품은 소모품으로, 정상적인 사용에 의한 마모, 오염 혹은 파손의 경우 A/S가 불가합니다.</p>
		<br/><br/>
		<p class="info_title"><i class="fas fa-info-circle"></i>&nbsp;교환 및 반품주소</p>
		<hr>
		<p>(61927) 광주광역시 서구 경열로3 한울직업전문학교 201호 우산써조 앞</p>
		<p>*접수확인이 되지 않은 교환/반품건은 수취거부될 수 있습니다.</p>
		<br/><br/>
		<p class="info_title"><i class="fas fa-info-circle"></i>&nbsp;고객상담</p>
		<hr>
		<p>문의게시판에 문의글을 남기시거나 아래의 연락처로 연락주시면 빠른 답변 받아보실 수 있습니다.</p>
		<p>전화문의: 062) 000-0420</p>
		<p>이메일: bteamproject0420@gamil.com</p>
		</div>
	</div>
	<div class="btnGoPage">
		<a class="goPage" onclick="go_order('${vo.p_num}')"><i class="fas fa-shopping-cart"></i> 주문서작성 바로가기</a>
		<a class="goPage" href="reviewBoard?board_category=1"><i class="fas fa-umbrella"></i> 사용후기 바로가기</a>
	</div>
</div>
</c:forEach>
<script type="text/javascript">
$(function(){
	$('.listBar ul').css('height', 
			(( $('.listBar ul li').length%2 > 0 ? 1 : 0 )+Math.floor($('.listBar ul li').length/2))*$('.listBar ul li').outerHeight(true)-2		
	);
	$('.productName:eq(0)').addClass('clicked');
	$('.productBox:not(:eq(0))').hide();
});

$(document).on('click', '.productName', function(){
	var index = $('.productName').index(this);
//	alert(index);
	
  	$('.productName:eq('+index+')').addClass('clicked');
  	$('.productName:not(:eq('+index+'))').removeClass('clicked');
  	$('.productBox:eq('+index+')').show();
  	$('.productBox:not(:eq('+index+'))').hide();
});

function go_order(num){
	location.href = 'orderFixed?p_num='+num;
	return;
}

</script>
</body>
</html>