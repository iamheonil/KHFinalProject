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
#profileborder {
	border: 1px solid #ccc;
	border-radius: 20px;
	padding-top : 10px;
	height: 1000px;
}
#boardtitle {
    font-size: 16px;
    font-weight: bold;
}
</style>


<div id="main">

<span id="boardtitle">회원정보 수정</span>
<hr>

<div id="profileborder">

    <form action="/" id="joinAction" method="post" class="form-horizontal" enctype="multipart/form-data">
      
      	<h5>개인 정보</h5>
      
        <div class="form-group row">
			<label class="col-form-label col-4">아이디</label>
			<div class="col-8 float">
                <input type="text" id="userId" name="userId" required="required" size="20" autofocus="autofocus"> 
            </div>
        </div>
        
        <div class="form-group row" id="id-check" style="font-size: 8px; text-align: center;" >
        	<span id="id-check-msg" class="id-check-msg" style="font-size: 8px; text-align: center;"></span>
        </div>

		<div class="form-group row">
			<label class="col-form-label col-4">비밀번호</label>
			<div class="col-8 float">
                <input type="password" class="form-control" id="userPw" name="userPw" required="required">
            </div>        	
        </div>
		<div class="form-group row">
			<label class="col-form-label col-4">비밀번호 확인</label>
			<div class="col-8 float">
                <input type="password" class="form-control" id="userPw_check" name="userPw_check" required="required">
            </div>        	
        </div>
        
        <div class="form-group row" id="pw-check" style="font-size: 8px; text-align: center;">
        	<span id="pw-check-msg" class="pw-check-msg" style="font-size: 8px; text-align: center;"></span>
        </div>
        
		<div class="form-group row">
			<label class="col-form-label col-4">Email</label>
                <%-- <input class="btn-info btn-xs" type="button" value="인증"> --%>
			<div class="col-8 float">
                <input type="email" class="form-control" name="userEmail" required="required" />
            </div>
        </div>
        
        <div class="form-group row" id="mailCode" >
        </div>
        
		
        <div class="form-group row">
			<label class="col-form-label col-4">이름</label>
			<div class="col-8 float">
                <input type="text" class="form-control" name="userName" required="required">
            </div>        	
        </div>
        <div class="form-group row">
			<label class="col-form-label col-4">전화번호</label>
			<div class="col-8 float">
                <input type="text" class="form-control" onKeyup="inputPhoneNumber(this);" maxlength="13" name="userPhone" required="required">
            </div>        	
        </div>

        <div class="form-group row">
			<label class="col-form-label col-4">주소</label>
			<!-- 주소 API 추가하기 -->
			<div class="col-8 float">
                
                <input type="button" onclick="DaumPostcode()" value="우편번호 찾기"><br>
                <input type="text" id="postCode" name="postCode" placeholder="우편번호" required="required">

                <input type="text" id="roadAddress" name="roadAddress" placeholder="도로명주소" size="35" required="required">
<%--                <input type="text" id="jibunAddress" placeholder="지번주소" size="35">--%>
                <input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소" size="35" required="required">

            </div>
        </div>

        <div class="form-group row" id="resume" >
        </div>

        <div class="form-group row">
			<label class="col-form-label col-4">성별</label>
			<div class="col-8 float">
				<label><input type="radio" name="userGender" value="m"/> 남&emsp;&emsp;</label>
				<label><input type="radio" name="userGender" value="w"/> 여</label>
            </div>        	
        </div>
        <div class="form-group row">
			<label class="col-form-label col-4">생년월일</label>
			<div class="col-8 float">
				<p><input type="date" name="userBirth" value="2000-01-01"
                          min="1940-01-01" max="2020-12-31" /></p>
            </div>        	
        </div>
        
		<button type="submit" class="btn btn-default" id="btn" >수정</button>
		<button type="submit" class="btn btn-default" id="btn" >탈퇴</button>
    </form>
    
    
</div>
</div>




<!-- 선생님 마이페이지 푸터 -->
<c:import url="/WEB-INF/layout/teacher/teaFooter.jsp"></c:import>
<c:import url="/WEB-INF/layout/teacher/teaFooter2.jsp"></c:import>