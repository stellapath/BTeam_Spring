<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<style type="text/css">
.change_pw input {width: 300px;}
.change_pw span {float: left; margin-left: 5px; margin-top: 10px;}
</style>
<c:if test="${login_info eq null}">
<script>
   alert("로그인이 필요한 페이지 입니다.");
   location.href = "login";
</script>
</c:if>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- 주소입력 -->
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
</head>
<body>
<div class="myMenuBar">
<ul>
   <li><a href="myPage?user_email=${login_info.user_email }" ${mypage eq 'info' ? 'class="active"' : '' }>개인정보수정</a></li>
   <li>｜</li>
   <li><a href="myOrder?user_email=${login_info.user_email }" ${mypage eq 'order' ? 'class="active"' : '' }>나의 주문내역</a></li>
   <li>｜</li>
   <li><a href="myQna?user_email=${login_info.user_email }" ${mypage eq 'qna' ? 'class="active"' : '' }>나의 문의내역</a></li>
</ul>
</div>
<div class="pageName">
   <p class="subTitleName">${vo.user_nickname}님의 마이페이지</p>
   <div class="titleLine"></div>
</div>
<div>
   <form action="update" method="post">
   <input type="hidden" name="user_email" value="${vo.user_email}"/>
   <table id="boardTable">   
      <tr>
         <th class="w-px120">프로필 사진</th>
         <td style="text-align: left;">
            <img src="profileImgDn?user_email=${vo.user_email}" style="width:100px;" />
            <button type="button" onclick="imageUpload()" >이미지 변경</button>
         </td>
      </tr>
      <tr><th>이메일</th>
         <td style="text-align: left;">${vo.user_email}</td>
      </tr>
      <tr><th>비밀번호</th>
         <td><input type="password" name="input_pw" placeholder="현재 비밀번호를 입력하세요."/>
            <a class="btn_fill" onclick="change_pw('${vo.user_pw}')">변경</a>
         </td>
      </tr>      
      <tr class="change_pw" style="display: none;">
         <th>비밀번호변경</th>
         <td>
            <div style="display: flex;"><input type="password" name="user_pw" value="${vo.user_pw}" placeholder="새로운 비밀번호를 입력하세요." /></div>
            <div><input type="password" id="check_pw" placeholder="새로운 비밀번호를 다시 입력하세요." /><span class="check_msg"></span></div>
         </td>
      </tr>
      <tr>
         <th>닉네임</th>
         <td><input type="text" name="user_nickname" id="user_nickname" required 
                  value="${vo.user_nickname}"/></td>
      </tr>
      <tr>
         <th>전화번호</th>
         <td><input type="text" name="user_phone" id="user_phone" required 
                  value="${vo.user_phone}"/></td>
      </tr>
      <tr>
         <th>주소</th>
         <td><input type="text" name="user_zipcode" class="postcodify_postcode5" 
                     value="${vo.user_zipcode}" />
            <a class="btn_fill" id="postcodify_search_button">우편번호 검색</a><br/>
            <input type="text" name="user_address" class="postcodify_address" value="${vo.user_address}" /><br/>
            <input type="text" name="detail_address" class="postcodify_details" value="${vo.detail_address}" />
         </td>
      </tr>
      <tr>
         <th>생일</th>
         <td><input type="text" name="user_birth" value="${vo.user_birth}" readonly />
            <span id="delete" style="color : red; position: relative; right: 30px; display: none; float: left;"><i class="fas fa-eraser font-img"></i></span>
         </td>
      </tr>
   </table>
   </form>
   <div class="buttons">
      <a class="btn_fill" onclick="go_save();">저장</a>
      <a class="btn_empty" href="home">취소</a>
      <a style="float: right; color: red; font-weight: bold;" onclick="goodbyeMember('${vo.user_email}')">회원탈퇴</a>
   </div>
</div>

<!-- jQuery DatePicker -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
function imageUpload() {
   window.open("profileImgUp", "프로필 이미지 변경", 
      "width=400, height=300, scrollbars=0, status=0, toolbar=0"
   );
}
//생년월일 입력시 삭제아이콘 활성화
$('[name=user_birth]').change(function(){
   $('#delete').css('display', 'inline-block');
});
$('#delete').click(function(){
   $('[name=user_birth]').val("");
   $('#delete').css('display', 'none');
});

//만 13세 이상부터 가입가능
var today = new Date();
var endDay = new Date(today.getFullYear() - 13, today.getMonth(), today.getDay() - 1);

//생년월일: jQuery DatePicker 사용
$('[name=user_birth]').datepicker({
   showMonthAfterYear: true,
   dateFormat: 'yy-mm-dd',
   dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
   monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
   changeMonth: true,
   changeYear: true,
   maxDate: endDay
});

$("[name=user_birth]").change(function(){
   $("#user_birth").text($('[name=user_birth]').val());
});

$("#check_pw").keyup(function(){
   var check_pw = $("#check_pw").val();
   var user_pw = $("[name=user_pw]").val();
      
   if(check_pw != user_pw){
      $(".check_msg").html("비밀번호를 확인하세요.").css("color", "red");
      return false;
   }else{
      $(".check_msg").html("비밀번호 일치").css("color", "green");
   }
});

function change_pw(pw){

   $('[name=user_pw]').val('');
   
   if(!$('[name=input_pw]').val()){
      alert('현재 비밀번호를 입력하세요.');
       $('[name=input_pw]').focus();
       return false;
   }

    if($('[name=input_pw]').val() == pw){
       $('.change_pw').show();
    }else if($('[name=input_pw]').val() != pw){
      alert('현재 비밀번호와 일치하지 않습니다.\n비밀번호를 다시 입력하세요.');
       $('[name=input_pw]').val('');
       $('[name=input_pw]').focus();
       return false;
    }
}

function goodbyeMember( user_email ){
   if( confirm('탈퇴하시겠습니까??') ){
      $.ajax({
         url: 'goodbyeMember',
         data : {user_email: user_email},
         success : function( result ){
            if(result) alert('회원탈퇴가 완료되었습니다.');
            else alert('회원탈퇴에 실패했습니다. 잠시후 다시 시도해주세요.');
            location.reload();
         },
         error : function(req, text){
            alert(text + " : " + req.status);
            location.reload();
         }
      });
   }else{
      alert('회원탈퇴가 취소되었습니다.');
   }
}

function go_save(){
   if ($('[name=input_pw]').val() ) {
      
      if(!$("[name=user_pw]").val()){
         alert("새로운 비밀번호를 입력하세요.");
         $("[name=user_pw]").focus();
            return false;

      }else{
          
         if (!$("#check_pw").val()) {
            alert("새로운 비밀번호를 다시 입력하세요.");
            $("#check_pw").focus();
            return false;
         }
      }
      
   }
   
   if( confirm('개인정보를 수정하시겠습니까?') ){
      $('form').submit(); 
      alert('저장 완료되었습니다.');
   }

}//go_save()

</script>
</body>
</html>