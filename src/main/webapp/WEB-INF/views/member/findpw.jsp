<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 2020.08.19 김헌일 수정 + 헤더 푸터 Import 작업-->

<%@ include file="/WEB-INF/layout/main/header.jsp" %>

<style type="text/css">

@import url(https://fonts.googleapis.com/css?family=Open+Sans);
.btn { display: inline-block; *display: inline; *zoom: 1; padding: 4px 10px 4px; margin-bottom: 0; font-size: 13px; line-height: 18px; color: #333333; text-align: center;text-shadow: 0 1px 1px rgba(255, 255, 255, 0.75); vertical-align: middle; background-color: #f5f5f5; background-image: -moz-linear-gradient(top, #ffffff, #e6e6e6); background-image: -ms-linear-gradient(top, #ffffff, #e6e6e6); background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#ffffff), to(#e6e6e6)); background-image: -webkit-linear-gradient(top, #ffffff, #e6e6e6); background-image: -o-linear-gradient(top, #ffffff, #e6e6e6); background-image: linear-gradient(top, #ffffff, #e6e6e6); background-repeat: repeat-x; filter: progid:dximagetransform.microsoft.gradient(startColorstr=#ffffff, endColorstr=#e6e6e6, GradientType=0); border-color: #e6e6e6 #e6e6e6 #e6e6e6; border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25); border: 1px solid #e6e6e6; -webkit-border-radius: 4px; -moz-border-radius: 4px; border-radius: 4px; -webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05); -moz-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05); box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.05); cursor: pointer; *margin-left: .3em; }
.btn:hover, .btn:active, .btn.active, .btn.disabled, .btn[disabled] { background-color: #e6e6e6; }
.btn-large { padding: 9px 14px; font-size: 15px; line-height: normal; -webkit-border-radius: 5px; -moz-border-radius: 5px; border-radius: 5px; }
.btn:hover { color: #333333; text-decoration: none; background-color: #e6e6e6; background-position: 0 -15px; -webkit-transition: background-position 0.1s linear; -moz-transition: background-position 0.1s linear; -ms-transition: background-position 0.1s linear; -o-transition: background-position 0.1s linear; transition: background-position 0.1s linear; }
.btn-primary, .btn-primary:hover { text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25); color: #ffffff; }
.btn-primary.active { color: rgba(255, 255, 255, 0.75); }
.btn-primary { background-color: #4a77d4; background-image: -moz-linear-gradient(top, #6eb6de, #4a77d4); background-image: -ms-linear-gradient(top, #6eb6de, #4a77d4); background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#6eb6de), to(#4a77d4)); background-image: -webkit-linear-gradient(top, #6eb6de, #4a77d4); background-image: -o-linear-gradient(top, #6eb6de, #4a77d4); background-image: linear-gradient(top, #6eb6de, #4a77d4); background-repeat: repeat-x; filter: progid:dximagetransform.microsoft.gradient(startColorstr=#6eb6de, endColorstr=#4a77d4, GradientType=0);  border: 1px solid #3762bc; text-shadow: 1px 1px 1px rgba(0,0,0,0.4); box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.2), 0 1px 2px rgba(0, 0, 0, 0.5); }
.btn-primary:hover, .btn-primary:active, .btn-primary.active, .btn-primary.disabled, .btn-primary[disabled] { filter: none; background-color: #4a77d4; }
.btn-block { width: 100%; display:block; }

#wrap { 
	background: #092756;
	background: -moz-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%),-moz-linear-gradient(top,  rgba(57,173,219,.25) 0%, rgba(42,60,87,.4) 100%), -moz-linear-gradient(-45deg,  #670d10 0%, #092756 100%);
	background: -webkit-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -webkit-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -webkit-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
	background: -o-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -o-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -o-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
	background: -ms-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -ms-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -ms-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
	background: -webkit-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), linear-gradient(to bottom,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), linear-gradient(135deg,  #670d10 0%,#092756 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#3E1D6D', endColorstr='#092756',GradientType=1 );
}

#loginForm { 
	position: relative;
	width: 50%;
	height: 50%;
	margin: 0 auto;
}

.login h1 { color: #fff; text-shadow: 0 0 10px rgba(0,0,0,0.3); letter-spacing:1px; text-align:center; }

input { 
	width: 25%; 
	margin: 0 auto;
	background: rgba(0,0,0,0.3);
	border: none;
	outline: none;
	padding: 10px;
	font-size: 13px;
	color: #fff;
	text-shadow: 1px 1px 1px rgba(0,0,0,0.3);
	border: 1px solid rgba(0,0,0,0.3);
	border-radius: 4px;
	box-shadow: inset 0 -5px 45px rgba(100,100,100,0.2), 0 1px 1px rgba(255,255,255,0.2);
	-webkit-transition: box-shadow .5s ease;
	-moz-transition: box-shadow .5s ease;
	-o-transition: box-shadow .5s ease;
	-ms-transition: box-shadow .5s ease;
	transition: box-shadow .5s ease;
}

input:focus { box-shadow: inset 0 -5px 45px rgba(100,100,100,0.4), 0 1px 1px rgba(255,255,255,0.2); } 

</style>

<!-- 이메일 인증 HttpRequest.js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>

<script type="text/javascript">

//이메일 인증번호 체크

function ajaxFromServer() {
	if (httpRequest.readyState == 4) {//DONE,응답완료
		if (httpRequest.status == 200) {//OK
			var resultText = httpRequest.responseText;
			if (resultText == 0) {
				alert("이메일 전송 실패");
			} else if (resultText == 1) { //이메일 전송 완료
				alert("이메일 전송완료")
			}
		} else {
			console.log("AJAX요청/응답 에러")
		}
	}
}

function emailCheck() {
	var usercode = document.getElementById("inputCode").value;
	console.log(usercode)
	if (usercode == code) {
		document.getElementById("email-check-msg").innerHTML = "이메일 인증 완료";
		document.querySelector('#email-check-msg').style.color = 'white';
		document.querySelector('#userPw').style.display = 'block';
		document.querySelector('#userPw_check').style.display = 'block';
		document.querySelector('#userPwBtn').style.display = 'block';
		$("#userPwBtn").removeAttr("disabled");
	} else {
		document.querySelector('#userEmail').focus();
		document.querySelector("#userEmail").value = "";
		document.querySelector("#email-check-msg").innerHTML = "이메일 인증 실패";
		document.querySelector('#email-check-msg').style.color = 'red';
		document.querySelector('#userPw').style.display = 'none';
		document.querySelector('#userPwBtn').style.display = 'none';
	}

}


// 비밀번호 AJAX 처리
function findPw(){
    //querySelector :
    //   css선택자로 원하는 html element 객체를 불러온다.
    //  jquery의 $('')와 유사하다.
    
    var userEmail = document.getElementById('userEmail').value;
	// console.log(userEmail);
	code = Math.floor(Math.random() * 1000000) + 100000;
	  
    var userName = document.querySelector('#userName').value;
    var userId = document.querySelector('#userId').value;
    var userActor = document.querySelector('#userActor').value;
    var userEmail = document.querySelector('#userEmail').value;

$.ajax({
   type:"POST",
   url:"/ss/member/findpwAjax",
   data:{
	   userName:userName,
	   userId:userId,
       userActor:userActor,
   	   userEmail:userEmail   
	},
	success:function(data){
	if(data != ''){
            document.querySelector('#pw-msg').textContent = '이메일로 전송된 인증번호를 입력해주세요.';
            document.querySelector('#pw-msg').style.color = 'white';

        	$("#sendMail").html(
            		'<label class="col-form-label col-4" style="color: white;">인증번호</label>' +
        			'<div class="col-8 float">'+
                       ' <input type="text" id="inputCode" name="inputCode" required="required" size="18">' +
                       ' <input type="button" value="인증하기" onclick="emailCheck()"> ' +
                    '</div>'		
            )
            
            emailSend();
        } else {
            document.querySelector("#pw-msg").textContent = '일치하는 정보가 없습니다';
            document.querySelector('#pw-msg').style.color = 'white';
        }
	}
})
 
 function emailSend() {
    			
            	userEmail = document.getElementById('userEmail').value;
            	var param = "email=" + userEmail + "&code_check=" + code;
            	// console.log(param)
            	sendRequest("GET", "/ss/member/send", param, ajaxFromServer);
            	alert("이메일을 전송했습니다!")
            }
 
}


$(document).ready(function() {

	//정규식 시작

	//모든 공백 체크 정규식
		var empJ = /\s/g;
		// 비밀번호 정규식
		var pwJ = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,14}$/;

		$("#userPw").blur(function() {
			if (pwJ.test($(this).val())) {
					// console.log(pwJ.test($(this).val()));
					console.log('Password Check');
			} else {
				$("#userPw").val('');
				$("#userPw").focus();
				$('#pw-check-msg').text('대소문자, 숫자와 특수문자를 하나 이상 넣어 7~14자 사이로 작성해야 합니다');
				$('#pw-check-msg').css('color', 'red');
			}
		});

	// 정규식 끝

	// 비밀번호 일치여부
	    $(function(){
	        $('#userPw_check').blur(function(){
	        	if($('#userPw').val() != $('#userPw_check').val()){
	                $('#pw-check-msg').html('비밀번호가 일치하지 않습니다<br><br>');
	                $('#pw-check-msg').css('color', '#f82a2aa3');
	                $('#userPw_check').val('');
	              } else {
	                $('#pw-check-msg').html('비밀번호가 일치합니다!<br><br>');
	                $('#pw-check-msg').css('color', '#199894b3');
	              }
	          });
	    });
	});

</script>

	<div id="gtco_header" class="gtco-cover gtco-cover-xl" style="text-align: center;">
		<div id="loginForm" style="margin-top: 5%;">
			<br><br><br><br><br>
	        <h3 style="white">비밀번호 찾기</h3>
					  <form action="/ss/member/pwModify" method="POST">
				            <br>
				            <p style="color: white; font-size: 14px;">회원구분 &nbsp;
			    	    	<select id="userActor" name="userActor" style="color: black;" >
								<option id="userActor" name="userActor" value="2" selected="selected">학생</option>
								<option id="userActor" name="userActor" value="1">선생님</option>
							</select></p>
				       <p style="color: white; font-size: 14px;">아이디 <input id="userId" name="userId" class="lostInput" type="text"></p>
				       <p style="color: white; font-size: 14px;">이름 &nbsp;  <input id="userName" name="userName" class="lostInput" type="text"></p>
				       <p style="color: white; font-size: 14px;">이메일 <input id="userEmail" name="userEmail" class="lostInput" type="text"></p>
			    		<input type="button" id="login-button" onclick="findPw();" value="비밀번호찾기">
			    		<br><br>
			    		<span id="pw-msg" class="pw-msg" style="font-size: 14px; text-align: center;"></span>
			    		
			    		<div class="form-group row" id="sendMail" style="text-align: center;"></div>
			    		<div class="form-group row" id="email-check" style="font-size: 8px; text-align: center;" >
        					<span id="email-check-msg" class="email-check-msg" style="font-size: 8px; text-align: center;"></span>
       					 </div>
			    		
			    		<p><input type="password" id="userPw" name="userPw" placeholder="비밀번호" style="font-size: 13px; color: white; text-align: center; display:none;"></p>
			    		<p><input type="password" id="userPw_check" placeholder="비밀번호 확인" name="userPw_check" required="required" style="font-size: 13px; color: white; text-align: center; display: none;"></p>
			    		<div class="form-group row" id="checking" style="font-size: 8px; text-align: center;">
			    			<span id="pw-check-msg" class="pw-check-msg" style="font-size: 13px; text-align: center;"></span>
			    		</div>
	    				<input type="submit" id="userPwBtn" name="userPwBtn" style="display:none;" value="비밀번호 변경하기" disabled>	
				 	</form>
		    		
		    		
		
        
        <form action="/ss/member/pwModify" method="POST">
		    	
        </form>
	</div>
</div>

</body>
<!-- 푸터 -->
<%@ include file="/WEB-INF/layout/main/footer.jsp" %>

<div class="gototop js-top">
        <a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
    </div>

    <!-- jQuery -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
	<!-- countTo -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.countTo.js"></script>
	<!-- Carousel -->
	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<!-- Magnific Popup -->
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/magnific-popup-options.js"></script>
	<!-- Main -->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>