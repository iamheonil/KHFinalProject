<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<!-- 메인 헤더 -->   
<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>

<!-- 선생님 마이페이지 헤더 -->
<c:import url="/WEB-INF/layout/teacher/teaHeader.jsp"></c:import>

<!-- 모달 추가 -->
<!-- <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" /> -->

<style type="text/css">
#main {
	display: inline-block;
	float: right;
	width: 960px;
	padding: 0 20px;
}
#profileborder {
	border: 1px solid #ccc;
	border-radius: 20px;
	padding-top : 10px;
	height: 1500px;
}
#boardtitle {
    font-size: 16px;
    font-weight: bold;
}

.boardersize{
	width: 500px;
	text-align : left;
	margin-left: 50px;
	margin-right: 10px;
	margin-bottom: 10px;
}

.deleteprofile{
	width: 800px;
	text-align : right;
	margin-left: 50px;
	margin-right: 50px;
	margin-bottom: 10px;
}

.pointfont{
	font-weight: bold;
	font-size: medium;
}

.imgsize{
	width: 150px;
	height: 200px;
	margin-bottom: 10px;
}

#fileView{
	width: 200px;
	height: 200px;
}

</style>

<!-- 도로명 주소 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function DaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postCode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                // document.getElementById("jibunAddress").value = data.jibunAddress;

            }
        }).open();
    }

</script>

<script type="text/javascript">
$(document).ready(function() {

	/* 비밀번호 일치 확인 */
    $('#userPw').keyup(function(){
      $('#pw-check-msg').html('');
    });

    $('#userPw_check').keyup(function(){

        if($('#userPw').val() != $('#userPw_check').val()){
          $('#pw-check-msg').html('비밀번호가 일치하지 않습니다<br><br>');
          $('#pw-check-msg').attr('color', '#f82a2aa3');
        } else{
          $('#pw-check-msg').html('비밀번호가 일치합니다!<br><br>');
          $('#pw-check-msg').attr('color', '#199894b3');
        }

    });
    
    /* 모달 > 탈퇴  */
    $('#deletebtn').click(function(){
//     	alert("탈퇴");
    	location.href="<%= request.getContextPath() %>/teacher/profile/delete?userNo=${loginUser.userNo }";
    });
    
    /* 체크 박스 value 값 따라 변경 */
//     $("#w").prop("checked", false);
//     $("#m").prop("checked", false);
    
    var chkval = ${loginUser.userGender  };
    if(chkval == m ){
    	$("#w").prop("checked", false);
    	$("#m").prop("checked", true);

    }else if(chkval == w ){
    	$("#w").prop("checked", true);
    	$("#m").prop("checked", false);
	}
   
    
});

/* 핸드폰 번호 */
function inputPhoneNumber(obj) {

    var number = obj.value.replace(/[^0-9]/g, "");
    var phone = "";

    if(number.length < 4) {
        return number;
    } else if(number.length < 7) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3);
    } else if(number.length < 11) {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 3);
        phone += "-";
        phone += number.substr(6);
    } else {
        phone += number.substr(0, 3);
        phone += "-";
        phone += number.substr(3, 4);
        phone += "-";
        phone += number.substr(7);
    }
    obj.value = phone;
}

/* 비밀번호 정규식 검사 */
var ajaxFlag = false;

function validate() {
    var pass = document.getElementById('userPw');
    var regExpPw = /(?=.*\d)(?=.*[~`!@#$%\^&*()-+=])(?=.*[a-zA-Z]).{6,15}$/;

    function chk(re, e, msg) {
        if(re.test(e.value)) {
            return true;
        } else {
            alert(msg);
            e.value = "";
            e.focus();
            //기본 이벤트 취소
            return false;
        }
    }

    // 비밀번호 검사
    if(!chk(regExpPw, pass,'비밀번호는 숫자,영어,특수문자가 하나 이상 포함되어 있어야하며, 6글자 이상 15글자 이하여야 합니다')){
        return false;
    }
    return true;
}

/* 첨부파일 이미지 미리보기 */
function loadImg(value){
	if(value.files && value.files[0]){
		/* 파일리더 객체 생성 */
		var reader = new FileReader();
		
		/* 리더 시작 시 함수 구현 */
		reader.onload = function(e){
			$("#fileImg").attr('src', e.target.result);
		}
		reader.readAsDataURL(value.files[0]);
	}
	
}

</script>


<div id="main">

<span id="boardtitle">회원정보 수정</span>
<hr>

<div id="profileborder">

    <form action="<%= request.getContextPath() %>/teacher/profile/update" method="post" class="form-horizontal" enctype="multipart/form-data">
      	<br>
      	<div class="boardersize pointfont" style="font-weight: bold;"><h5>개인 정보 수정 & 탈퇴</h5></div>
        <br>
      <div class="boardersize">
         <label class="col-form-label col-4">프로필 사진</label>
       	 <div>
       	 
       	 <c:if test="${not empty teacherFile.tchFileRename }">
       	 <img class="imgsize" alt="teacherFile" src="<%= request.getContextPath() %>/resources/upload/${teacherFile.tchFileRename }">
       	 </c:if>
       	 
       	 <c:if test="${empty  teacherFile.tchFileRename }">
       	 <h4>사진이 없습니다. 프로필 사진을 등록해주세요.</h4>
       	 </c:if>
       	 
       	 </div>
     </div>
      
      	<div class="boardersize">
			<label class="col-form-label col-4">아이디</label>
			<div class="col-8 float">
                <input type="text" id="userId" name="userId" size="20" readonly="readonly" value="${loginUser.userId }"> 
            </div>
		</div>
		
		<div class="boardersize">
			<label class="col-form-label col-4">비밀번호</label>
			<div class="col-8 float">
                <input type="password" class="form-control" id="userPw" name="userPw" size="20" autofocus="autofocus">
            </div>        	
        </div>
        
        <div class="boardersize">
			<label class="col-form-label col-4">비밀번호 확인</label>
			<div class="col-8 float">
                <input type="password" class="form-control" id="userPw_check" name="userPw_check" size="20">
            </div>
        </div>            	
        
        <div class="boardersize">
        <div id="pw-check" style="font-size: 8px;">
        	<span id="pw-check-msg" class="pw-check-msg" style="font-size: 8px; text-align: center;" size="20"></span>
        </div>
        </div>
        
        <div class="boardersize">
			<label class="col-form-label col-4">Email</label>
			<div class="col-8 float">
                <input type="email" class="form-control" name="userEmail" readonly="readonly" size="20" value="${loginUser.userEmail }"/>
            </div>
        </div>
        
        <div class="boardersize">
			<label class="col-form-label col-4">이름</label>
			<div class="col-8 float">
                <input type="text" class="form-control" name="userName" size="20" value="${loginUser.userName }">
            </div>      
        </div>
        
        <div class="boardersize">     	
			<label class="col-form-label col-4">전화번호</label>
			<div class="col-8 float">
                <input type="text" class="form-control" onKeyup="inputPhoneNumber(this);" maxlength="13" name="userPhone" size="20" value="${loginUser.userPhone }" >
            </div>  
        </div>      	

		<div class="boardersize">
			<label class="col-form-label col-4">주소</label>
			<!-- 주소 API 추가하기 -->
			<div class="col-8 float">
                <input type="button" onclick="DaumPostcode()" value="우편번호 찾기"><br>
                
                <input type="text" id="postCode" name="postCode" placeholder="우편번호" size="20" value="${loginUser.postCode }"><br>
                <input type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소" size="35" value="${loginUser.roadAddress }" ><br>
                <input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소" size="35" value="${loginUser.detailAddress }"><br>
            </div>

        <div class="form-group row" id="resume" >
        </div>
        </div>
		
		<div class="boardersize">
			<label class="col-form-label col-4">성별</label>
			<div class="col-8 float">
				<label><input type="radio" id="m" name="userGender" value="m" checked="checked"/> 남&emsp;&emsp;</label>
				<label><input type="radio" id="w" name="userGender" value="w" checked="checked"/> 여</label>
            </div>     
        </div>
        
        <div class="boardersize">    
			<label class="col-form-label col-4">생년월일</label>
			<div class="col-8 float">
				<p><input type="date" name="userBirth" value="${loginUser.userBirth }" min="1940-01-01" max="2020-12-31" /></p>
            </div>        	
       </div>
       
     <div class="boardersize">
         <label class="col-form-label col-4">프로필 사진 변경</label>
         
       	 <div class="col-8 float">
         	<input type="file" id="file" name="file" onchange="loadImg(this);" /> 
    	 </div>
    	 
    	 <small style="color: tomato;">사진은 1장만 선택 가능하며, 기존 프로필은 자동으로 삭제됩니다</small><br>
    	 
    	 <small>이미지 미리보기</small>
      	  <div id="fileView">
      	  	<img alt="" src="" id="fileImg" class="imgsize">
      	  </div>
     </div>
        
       <div class="boardersize"> 
			<button type="submit" class="btn btn-default" id="btn" >수정</button>
	   </div>
    </form>
    
    <hr>
    
    <div class="deleteprofile">
    <small>회원정보를 삭제하시겠어요?</small>
    <!-- Button trigger modal -->
	<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#myModalProfile">회원탈퇴</button>
    </div>
    
	<!-- Modal -->
	<div class="modal fade" id="myModalProfile" tabindex="-1" role="dialog" aria-labelledby="myModalProfileLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content" style="top:110px; width: 600px;">
	    
	      <div class="modal-header">
	        <h4 class="modal-title" id="myModalProfileLabel">회원 탈퇴 안내</h4>
	      </div>
	      
	      <div class="modal-body">
	        1. 연결된 과외가 있는 경우 회원탈퇴를 할 수 없습니다.<br>
	        2. 회원탈퇴시 모든 거래내역은 확인할 수 없습니다.<br>
	        3. 회원탈퇴시 결제 이미 결제된 과외 글에 대해서 환불할 수 없습니다<br>
	        4. 학생의 정보를 다시 열람 할 수 없습니다<br>
	        5. 위의 사항을 모두 동의합니다<br>
	      </div>
	      
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-default" id="deletebtn">탈퇴</button>
	      </div>
	      
	    </div>
	  </div>
	</div>
 
	    
</div>
</div>


<!-- 선생님 마이페이지 푸터 -->
<c:import url="/WEB-INF/layout/teacher/teaFooter.jsp"></c:import>
<c:import url="/WEB-INF/layout/teacher/teaFooter2.jsp"></c:import>