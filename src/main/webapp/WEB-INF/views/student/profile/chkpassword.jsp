<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!-- 이인주 : 학생 > 마이페이지 > 2차 비밀번호 확인 jsp -->

<!-- 메인 헤더 -->   
<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>

<!-- 학생 마이페이지 헤더 -->
<c:import url="/WEB-INF/layout/student/stuHeader.jsp"></c:import>


<style type="text/css">
#main {
	display: inline-block;
	float: right;
	width: 960px;
	padding: 0 20px;
}

#boardtitle {
    font-size: 16px;
    font-weight: bold;
}

#class_upload_notice {
	text-align: center;
	border: 1px solid #ccc;
	border-radius: 20px;
	padding: 50px 120px;
	height: 360px;
}

#ctitle {
	font-size: 20px;
	font-weight: bold;
	padding: 3px;
	color: #333;
}

#class_upload_notice_content {
	text-align: center;
	font-size: 15px;
}
</style>


<!-- ajax -->
<script type="text/javascript">
function XMLPWCheck(){
	
	var userPw = document.querySelector('#userPw').value;

	//ajax 통신 객체 생성
	var xhr = new XMLHttpRequest();
	
	//통신을 위한 시작줄 작성
	xhr.open('POST','<%=request.getContextPath()%>/teacher/profile/chkpasswordRes');
	
	//Http Request header 설정
	xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded; charset=UTF-8');
	
	//http request body 설정
	//xhr.send() : 전송할 데이터가 있다면 파라미터에 넣어서 보내주면 된다
	xhr.send('userPw='+userPw);
	
	//ajax 통신이 끝난 뒤 실행할 콜백 함수 등록
	xhr.addEventListener('load',function(){
	
		//결과 받아오기
		var data = xhr.response;
		
		//결과가 1보다 크면  
		if(data == ''){
// 			alert(data);
			location.href="${pageContext.request.contextPath}/student/profile/select";
			
		//결과가 1보다 작으면 "비밀번호가 일치하지 않습니다."	
		}else if(data != ''){
// 			alert(data);
			document.querySelector('#ajaxresult').textContent = data;
			
		}
	});
}


</script>

<div id="main">
	<span id="boardtitle">회원정보 수정</span>
	<hr>
	 
	<div id="class_upload_notice">
		<span id="ctitle">&nbsp;개인정보 보안을 위한 2차 인증 절차&nbsp; </span><br><br><hr><br>
			<div id="class_upload_notice_content">
			
				  <div class="form-group">
				    <label for="exampleInputName2">PASSWORD</label>
				    <input type="password" class="form-control" id="userPw" name ="userPw" placeholder="비밀번호를 입력해주세요" required="required">
				  </div>
				  
				 <button type="button" class="btn btn-default" id="btn" onclick="XMLPWCheck()">확인</button>
				 
				 <div id="ajaxresult"></div>
				
			</div>
	</div>
	
</div>


<!-- 학생 마이페이지 푸터 -->
<c:import url="/WEB-INF/layout/student/stuFooter.jsp"></c:import>
<c:import url="/WEB-INF/layout/student/stuFooter2.jsp"></c:import>
