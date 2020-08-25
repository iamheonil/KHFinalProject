<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<!-- 메인 헤더 -->   
<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>

<!-- 선생님 마이페이지 헤더 -->
<c:import url="/WEB-INF/layout/teacher/teaHeader.jsp"></c:import>

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

<div id="main">
	<span id="boardtitle">회원정보 수정</span>
	<hr>
	 
	<div id="class_upload_notice">
		<span id="ctitle">&nbsp;개인정보 보안을 위한 2차 인증 절차&nbsp; </span><br><br><hr><br>
			<div id="class_upload_notice_content">
			
				<form class="form-inline" action="${pageContext.request.contextPath}/teacher/profile/chkpassword" method="post">
				  <div class="form-group">
				    <label for="exampleInputName2">PASSWORD</label>
				    <input type="text" class="form-control" id="userPw" name ="userPw" placeholder="비밀번호를 입력해주세요">
				  </div>
				  
				 <button type="submit" class="btn btn-default" id="btn">확인</button>
				</form>
				
			</div>
	</div>
	
</div>

<!-- 선생님 마이페이지 푸터 -->
<c:import url="/WEB-INF/layout/teacher/teaFooter.jsp"></c:import>
<c:import url="/WEB-INF/layout/teacher/teaFooter2.jsp"></c:import>



