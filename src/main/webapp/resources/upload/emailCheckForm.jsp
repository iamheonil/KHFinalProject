<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#wrap {
	width: 490px;
	text-align: center;
	margin: 0 auto 0 auto;
}

#chk {
	text-align: center;
}

#cancelBtn {
	visibility: visible;
}

#useBtn {
	visibility: hidden;
}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script type="text/javascript">
	var code = Math.floor(Math.random() * 1000000) + 100000;
	var userEmail = opener.document.getElementById("userEmail").value;
	console.log("code: " + code)

	// 회원가입창의 이메일 입력란의 값을 가져온다.
	function pValue() {
		userEmail = opener.document.getElementById("userEmail").value;
		console.log(userEmail)
	}

	// 이메일 인증번호 체크
	function emailSend() {

		userEmail = opener.document.getElementById("userEmail").value;
		var param = "email=" + userEmail + "&code_check=" + code;
		console.log(param)
		sendRequest("GET", "/ss/member/send", param, ajaxFromServer);
		alert("이메일을 전송했습니다!")

	}

	function ajaxFromServer() {
		if (httpRequest.readyState == 4) {//DONE,응답완료
			if (httpRequest.status == 200) {//OK
				var resultText = httpRequest.responseText;
				if (resultText == 0) {
					alert("이메일 전송 실패");
					document.getElementById("cancelBtn").style.visibility = 'visible';
					document.getElementById("useBtn").style.visibility = 'hidden';
					document.getElementById("msg").innerHTML = "";
				} else if (resultText == 1) { //이메일 전송 완료
					alert("이메일 전송완료")
				}

			} else {
				console.log("AJAX요청/응답 에러")
			}
		}
	}

	function emailCheck() {
		var usercode = document.getElementById("userEmail").value;
		console.log(usercode)
		if (usercode == code) {
			document.getElementById("cancelBtn").style.visibility = 'hidden';
			document.getElementById("useBtn").style.visibility = 'visible';
			document.getElementById("msg").innerHTML = "이메일 인증 완료";
		} else {
			document.getElementById("cancelBtn").style.visibility = 'visible';
			document.getElementById("useBtn").style.visibility = 'hidden';
			document.getElementById("msg").innerHTML = "이메일 인증 실패";
		}
	}

	// 사용하기 클릭 시 부모창으로 값 전달 
	function sendCheckValue() {
		// 중복체크 결과인 idCheck 값을 전달한다.
		opener.document.getElementById("emailAuth").value = "emailCheck";
		// 회원가입 화면의 ID입력란에 값을 전달
		opener.document.getElementById("userEmail").value = userEmail

		if (opener != null) {
			opener.chkForm = null;
			self.close();
		}
	}
</script>
</head>
<body onload="pValue()">
	<div id="wrap">
		<br> <b><font size="4" color="gray">이메일 인증</font></b>
		<hr size="1" width="460">
		<br>
		<div id="chk">
			<form id="checkForm">
				<input type="text" name="emailinput" id="userEmail"> <input
					type="button" value="이메일 전송" onclick="emailSend()"> <input
					type="button" value="인증번호 확인" onclick="emailCheck()">
			</form>
			<div id="msg"></div>
			<br> <input id="cancelBtn" type="button" value="취소"
				onclick="window.close()"><br> <input id="useBtn"
				type="button" value="사용하기" onclick="sendCheckValue()">
		</div>
	</div>
</body>
</html>