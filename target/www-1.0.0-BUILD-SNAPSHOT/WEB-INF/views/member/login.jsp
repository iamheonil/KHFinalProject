<!-- 20200817 김성은 -->
<!-- 로그인 페이지 -->
<!-- 2020.08.19 김헌일 수정 + 헤더 푸터 Import 작업-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/layout/main/header.jsp" %>
<%-- <jsp:include page="${pageContext.request.contextPath}/WEB-INF/layout/main/header.jsp"></jsp:include> --%>


<style>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</style>

<style>
    body {
        color: #fff;
        background: #17B794;
    }
    .form-control {
        min-height: 41px;
        background: #fff;
        box-shadow: none !important;
        border-color: #e3e3e3;
    }
    .form-control:focus {
        border-color: #70c5c0;
    }
    .form-control, .btn {
        border-radius: 2px;
    }
    .login-form {
        width: 350px;
        margin: 0 auto;
        padding: 130px 0 30px;
    }
    .login-form form {
        color: #7a7a7a;
        border-radius: 2px;
        margin-bottom: 15px;
        font-size: 13px;
        background: #ececec;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
        position: relative;
    }
    .login-form h2 {
        font-size: 22px;
        margin: 35px 0 25px;
    }
    .login-form .avatar {
        position: absolute;
        margin: 0 auto;
        left: 0;
        right: 0;
        top: -50px;
        width: 95px;
        height: 95px;
        border-radius: 50%;
        z-index: 9;
        background: #fff;
        padding: 15px;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.1);
    }
    .login-form .avatar img {
        width: 100%;
    }
    .login-form input[type="checkbox"] {
        position: relative;
        top: 1px;
    }
    .login-form .btn, .login-form .btn:active {
        font-size: 16px;
        font-weight: bold;
        background: #70c5c0;
        border: none;
        margin-bottom: 20px;
    }
    .login-form .btn:hover, .login-form .btn:focus {
        background: #50b8b3 !important;
    }
    .login-form a {
        color: #fff;
        text-decoration: underline;
    }
    .login-form a:hover {
        text-decoration: none;
    }
    .login-form form a {
        color: #7a7a7a;
        text-decoration: none;
    }
    .login-form form a:hover {
        text-decoration: none;
    }
    .login-form .bottom-action {
        font-size: 14px;
    }


    .social-btn .btn {
        color: #fff;
        margin: 10px 0;
        font-size: 15px;
        border-radius: 50px;
        text-indent: 10px;
        font-weight: normal;
        border: none;
        text-align: center;
    }
    .social-btn .btn:hover {
        opacity: 0.9;
    }
    .social-btn .btn-primary {
        background: #507cc0;
    }
    .social-btn .btn-info {
        background: #64ccf1;
    }
    .social-btn .btn-danger {
        background: #df4930;
    }
    .social-btn .btn i {
        margin-right: 9px;
        font-size: 20px;
        min-width: 25px;
        position: relative;
        top: 2px;
    }

    .or-seperator {
        margin: 20px 0 20px;
        text-align: center;
        border-top: 1px solid #e0e0e0;
    }
    .bar{
        float: right;
        padding-right: 15px;
        padding-left: 15px;
    }
    #login_body {
        background: rgba(61,205,188,1);
        background: -moz-linear-gradient(left, rgba(61,205,188,1) 0%, rgba(51,161,189,1) 100%);
        background: -webkit-gradient(left top, right top, color-stop(0%, rgba(61,205,188,1)), color-stop(100%, rgba(51,161,189,1)));
        background: -webkit-linear-gradient(left, rgba(61,205,188,1) 0%, rgba(51,161,189,1) 100%);
        background: -o-linear-gradient(left, rgba(61,205,188,1) 0%, rgba(51,161,189,1) 100%);
        background: -ms-linear-gradient(left, rgba(61,205,188,1) 0%, rgba(51,161,189,1) 100%);
        background: linear-gradient(to right, rgba(61,205,188,1) 0%, rgba(51,161,189,1) 100%);
        filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#3dcdbc', endColorstr='#33a1bd', GradientType=1 );
    }

</style>

<body id="login_body">

<br><br>

<div class="login-form">
    <form action="/examples/actions/confirmation.php" method="post">
		
<!-- 			<img src="/examples/images/avatar.png" alt="Avatar"> -->
			<div class="lcb-float">
				<i class="fa fa-users fa-4x"></i>
			</div>
		<br>
        <h3 class="text-center">슬기로운 과외생활</h3>
        <br>
        <label><input type="radio" name="who" value="student" /> 학생</label>&emsp;
        <label><input type="radio" name="who" value="teacher" /> 선생님</label>
        <div class="form-group">
        	<input type="text" class="form-control" name="username" placeholder="Userid" required="required">
        </div>
		<div class="form-group">
            <input type="password" class="form-control" name="password" placeholder="Password" required="required">
        </div>        
        <div class="form-group">
            <button type="submit" class="btn btn-primary btn-lg btn-block">LOGIN</button>
        </div>
		<div class="bottom-action clearfix" style="text-align: center;">
<!--             <label class="float-left form-check-label"><input type="checkbox"> 아이디 저장</label> -->
            <a href="findid.jsp" class="float-left">아이디 찾기</a> | <a href="findpw.jsp" class="float-right">비밀번호 찾기</a>
        </div>
        <div class="or-seperator"></div>
        <div class="text-center social-btn" >
			<a href="#" class="btn btn-danger btn-lg btn-block"><i class="fa fa-google"></i> <b>Google</b> 로그인 </a>
<!--             <a href="#" class="btn btn-primary btn-lg btn-block"><i class="fa fa-facebook"></i> Sign in with <b>Facebook</b></a> -->
<!--             <a href="#" class="btn btn-info btn-lg btn-block"><i class="fa fa-twitter"></i> Sign in with <b>Twitter</b></a> -->
<!-- 			<a href="#" class="btn btn-danger btn-lg btn-block"><i class="fa fa-google"></i> Sign in with <b>Google</b></a> -->
        </div>
    </form>
    <p class="text-center small">로그인정보가 기억나지 않으세요? <a href="#">여기</a> 를 눌러주세요!</p>

    <br><br>

</div>
</body>
<%@ include file="/WEB-INF/layout/main/footer.jsp" %>
<%-- <jsp:include page="${pageContext.request.contextPath}/WEB-INF/layout/main/footer.jsp"></jsp:include> --%>