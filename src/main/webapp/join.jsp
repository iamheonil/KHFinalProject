<!-- 20200817 김성은 -->
<!-- 회원가입 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<c:import url="/WEB-INF/layout/login/joinHeader.jsp"/>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
 
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

 
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style type="text/css">
body{
	background: #f3f3f3;
}
.col-sm-6 h2{
	margin: 30px;
}
.join{
	margin-top: 60px;
}
.float{
	width: 300px;
	float: right;
}
.form-horizontal{
	width: 450px;
	margin-left: 30px;
/* 	border-bottom: 1px solid #d0d1d8; */
}
.signup-form {
	width: 500px;
	margin: 0 auto;
	padding: 30px 0;
}
.signup-form h2 {
	color: #333;
	margin: 0 0 30px 0;
	display: inline-block;
	padding: 0 30px 10px 0;
	border-bottom: 3px solid #5cd3b4;
}
.signup-form .form-group row {
	margin-bottom: 20px;
}
.signup-form label {
	font-weight: normal;
	font-size: 14px;
	line-height: 2;
}
.signup-form input[type="checkbox"] {
	position: relative;
	top: 1px;
}
.signup-form .btn {        
	font-size: 16px;
	font-weight: bold;
	background: #5cd3b4;
	border: none;
	margin-top: 20px;
	min-width: 140px;
}
.signup-form .btn:hover, .signup-form .btn:focus {
	background: #41cba9;
	outline: none !important;
}
.signup-form a {
	color: #5cd3b4;
	text-decoration: underline;
}
.signup-form a:hover {
	text-decoration: none;
}
.signup-form form a {
	color: #5cd3b4;
	text-decoration: none;
}	
.signup-form form a:hover {
	text-decoration: underline;
}
.offset-4{
	margin-left: 33.333333%;
}
</style>
<script type="text/javascript">
$(document).ready(function() {

$("#teacher").click(function(){
    $("#resume").show();
})
$("#student").click(function(){
    $("#resume").hide();
})

});

</script>
</head>
<body>
     <div class="container">
    <div class="row">
    <div class="col-sm-12 " >
    <div class="col-sm-3"></div>
     
    <div class="col-sm-6">
<!--     <h2>회원가입</h2> -->
<!--     <img src="join_img.png"> -->
<div class="signup-form">
    <form action="/examples/actions/confirmation.php" method="post" class="form-horizontal">
      	<div class="row">
        	<div class="col-8 offset-4 join">
				<h2>회원가입</h2>
			</div>	
      	</div>			
        <div class="form-group row">
			<label class="col-form-label col-4">아이디</label>
			<div class="col-8 float">
                <input type="text" class="form-control" name="userid" required="required">
            </div>        	
        </div>
		<div class="form-group row">
			<label class="col-form-label col-4">비밀번호</label>
			<div class="col-8 float">
                <input type="password" class="form-control" name="password" required="required">
            </div>        	
        </div>
		<div class="form-group row">
			<label class="col-form-label col-4">비밀번호 확인</label>
			<div class="col-8 float">
                <input type="password" class="form-control" name="confirm_password" required="required">
            </div>        	
        </div>
		<div class="form-group row">
			<label class="col-form-label col-4">Email</label>
			<div class="col-8 float">
                <input type="email" class="form-control" name="email" required="required">
            </div>        	
        </div>
		<div class="form-group row">
			<label class="col-form-label col-4">구분</label>
			<div class="col-8 float">
				<label><input type="radio" name="who" id="student" /> 학생&emsp;&emsp;</label>
				<label><input type="radio" name="who" id="teacher" /> 선생님</label>
            </div>        	
        </div>
        <div class="form-group row">
			<label class="col-form-label col-4">이름</label>
			<div class="col-8 float">
                <input type="text" class="form-control" name="username" required="required">
            </div>        	
        </div>
        <div class="form-group row">
			<label class="col-form-label col-4">전화번호</label>
			<div class="col-8 float">
                <input type="tel" class="form-control" name="tel" required="required">
            </div>        	
        </div>
        <div class="form-group row">
			<label class="col-form-label col-4">주소</label>
			<!-- 주소 API 추가하기 -->
			<div class="col-8 float">
                <input type="text" class="form-control" name="address" required="required">
            </div>        	
        </div>
        <div class="form-group row" id="resume" style="display:none;">
			<label class="col-form-label col-4">이력서</label>
			<div class="col-8 float">
                <input type="file" name="resume" required="required">
            </div>        	
        </div>
        <div class="form-group row">
			<label class="col-form-label col-4">성별</label>
			<div class="col-8 float">
				<label><input type="radio" /> 남&emsp;&emsp;</label>
				<label><input type="radio" /> 여</label>
            </div>        	
        </div>
        
        
		<div class="form-group row">
				<p><label class="form-check-label"><input type="checkbox" required="required"> I accept the <a href="#">Terms of Use</a> &amp; <a href="#">Privacy Policy</a>.</label></p>
			<div class="col-8 offset-4">
				<button type="submit" class="btn btn-primary btn-lg">Sign Up</button>
			</div>  
		</div>		      
    </form>
	<div class="text-center">Already have an account? <a href="#">Login here</a></div>
</div>


     
    </div>
    </div>
</div>    
</div>
</body>
</html>