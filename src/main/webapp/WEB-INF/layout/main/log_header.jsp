<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>&mdash; 슬기로운 과외생활</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="슬기로운 과외생활" />
<meta name="keywords" content="과외, 선생님, 과외선생님, 초등학생, 중학생, 고등학생" />
<meta name="author" content="KH FINAL PROJECT" />

<!-- Facebook and Twitter integration -->
<meta property="og:title" content="" />
<meta property="og:image" content="" />
<meta property="og:url" content="" />
<meta property="og:site_name" content="" />
<meta property="og:description" content="" />
<meta name="twitter:title" content="" />
<meta name="twitter:image" content="" />
<meta name="twitter:url" content="" />
<meta name="twitter:card" content="" />

<link
	href="https://fonts.googleapis.com/css?family=Raleway:100,300,400,700"
	rel="stylesheet">

<!-- Animate.css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/animate.css">
<!-- Icomoon Icon Fonts-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/icomoon.css">
<!-- Themify Icons-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/themify-icons.css">
<!-- Bootstrap  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css">

<!-- Magnific Popup -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">

<!-- Owl Carousel  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
	

<!-- Theme style  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">

<!-- custom css  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/custom.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/heonilcss.css">
	
<!-- 
돋보기(검색기능) 관련 CSS // 구동영씨가 searchBar css 파일 업로드하면 
아래의 main.css 는 삭제 혹은 주석처리할 것
-->

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/searchBar.css">	

<!-- 필터 -->
<link href="https://fonts.googleapis.com/css?family=Poppins:400,600,700" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/main_filter.css" rel="stylesheet" />
		<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<!-- Modernizr JS -->
<script
	src="${pageContext.request.contextPath}/resources/js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	<style type="text/css">
		.gtco-nav {
		  position: relative;
		  top: 0;
		  margin: 0;
		  padding: 0;
		  width: 100%;
		  padding: 10px 0;
		  z-index: 1001;
		  background: #fff;
		  position: fixed;
		}
		@media screen and (max-width: 768px) {
		  .gtco-nav {
		    padding: 10px 0;
		  }
		}
		.gtco-nav #gtco-logo {
		  font-size: 20px;
		  width: 65px;
		  height: 70px;
		  margin: 0;
		  padding: 0;
		  text-transform: uppercase;
		  font-weight: bold;
		}
		.gtco-nav #gtco-logo em {
		  color: #17B794;
		}
		@media screen and (max-width: 768px) {
		  .gtco-nav .menu-1, .gtco-nav .menu-2 {
		    display: none;
		  }
		}
		.gtco-nav ul {
		  padding: 0;
		  margin: .4em 0 0 0;
		}
		.gtco-nav ul li {
		  padding: 0;
		  margin: 0;
		  list-style: none;
		  display: inline;
		  line-height: 1.5;
		}
		.gtco-nav ul li > a {
		  text-transform: uppercase;
		  font-size: 13px !important;
		  letter-spacing: .05em;
		}
		.gtco-nav ul li a {
		  font-size: 16px;
		  padding: 30px 10px;
		  color: #3ac1bc;
		  -webkit-transition: 0.5s;
		  -o-transition: 0.5s;
		  transition: 0.5s;
		}
		.gtco-nav ul li a:hover, .gtco-nav ul li a:focus, .gtco-nav ul li a:active {
		  color: #33a3bd;
		}
		.gtco-nav ul li.has-dropdown {
		  position: relative;
		}
		.gtco-nav ul li.has-dropdown > a {
		  position: relative;
		  padding-right: 20px !important;
		}
		.gtco-nav ul li.has-dropdown > a:after {
		  font-family: 'icomoon';
		  speak: none;
		  font-style: normal;
		  font-weight: normal;
		  font-variant: normal;
		  text-transform: none;
		  line-height: 1;
		  /* Better Font Rendering =========== */
		  -webkit-font-smoothing: antialiased;
		  -moz-osx-font-smoothing: grayscale;
		  content: "\e921";
		  font-style: 10px;
		  position: absolute;
		  top: 50%;
		  margin-top: -7px;
		  right: 0;
		  color: #ccc;
		}
		.gtco-nav ul li.has-dropdown .dropdown {
		  width: 130px;
		  -webkit-box-shadow: 0px 4px 5px 0px rgba(0, 0, 0, 0.15);
		  -moz-box-shadow: 0px 4px 5px 0px rgba(0, 0, 0, 0.15);
		  box-shadow: 0px 4px 5px 0px rgba(0, 0, 0, 0.15);
		  z-index: 1002;
		  visibility: hidden;
		  opacity: 0;
		  position: absolute;
		  top: 40px;
		  left: 0;
		  text-align: left;
		  background: #fff;
		  padding: 20px;
		  -webkit-border-radius: 4px;
		  -moz-border-radius: 4px;
		  -ms-border-radius: 4px;
		  border-radius: 4px;
		  -webkit-transition: 0s;
		  -o-transition: 0s;
		  transition: 0s;
		}
		.gtco-nav ul li.has-dropdown .dropdown:before {
		  bottom: 100%;
		  left: 40px;
		  border: solid transparent;
		  content: " ";
		  height: 0;
		  width: 0;
		  position: absolute;
		  pointer-events: none;
		  border-bottom-color: #fff;
		  border-width: 8px;
		  margin-left: -8px;
		}
		.gtco-nav ul li.has-dropdown .dropdown li {
		  display: block;
		  margin-bottom: 7px;
		}
		.gtco-nav ul li.has-dropdown .dropdown li:last-child {
		  margin-bottom: 0;
		}
		.gtco-nav ul li.has-dropdown .dropdown li a {
		  padding: 2px 0;
		  display: block;
		  color: #999999;
		  line-height: 1.2;
		  text-transform: none;
		  font-size: 15px;
		}
		.gtco-nav ul li.has-dropdown .dropdown li a:hover {
		  color: #000;
		}
		.gtco-nav ul li.has-dropdown .dropdown li.active > a {
		  color: #000 !important;
		}
		.gtco-nav ul li.has-dropdown:hover a, .gtco-nav ul li.has-dropdown:focus a {
		  color: #33a3bd;
		}
		.gtco-nav ul li.btn-cta a {
		  color: #17B794;
		}
		.gtco-nav ul li.btn-cta a span {
		  background: #fff;
		  padding: 4px 20px;
		  display: -moz-inline-stack;
		  display: inline-block;
		  zoom: 1;
		  *display: inline;
		  -webkit-transition: 0.3s;
		  -o-transition: 0.3s;
		  transition: 0.3s;
		  -webkit-border-radius: 100px;
		  -moz-border-radius: 100px;
		  -ms-border-radius: 100px;
		  border-radius: 100px;
		}
		.gtco-nav ul li.btn-cta a:hover span {
		  -webkit-box-shadow: 0px 14px 20px -9px rgba(0, 0, 0, 0.75);
		  -moz-box-shadow: 0px 14px 20px -9px rgba(0, 0, 0, 0.75);
		  box-shadow: 0px 14px 20px -9px rgba(0, 0, 0, 0.75);
		}
		.gtco-nav ul li.active > a {
		  color: #000 !important;
		}
		
		.gtco-container {
		  max-width: 1140px;
		  position: relative;
		  margin: 0 auto;
		  padding-left: 15px;
		  padding-right: 15px;
		  }
	</style>
</head>

	<nav class="gtco-nav" role="navigation">
			<div class="gtco-container">

				<div class="row">
					<div class="col-sm-2 col-xs-12">
						<div id="gtco-logo">
							<a href="/ss/member/main">
                <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="슬기로운 과외생활"></a>
						</div>
					</div>
					<div class="col-xs-10 text-right menu-1">
						<ul style="margin-top: 20px;">
							<li class="active" style="font-size: 13px; color: #3ac1bc;">
							
							<c:choose>
								<c:when test="${loginUser.userName != null}">
									안녕하세요! ${loginUser.userName }님!
								</c:when>
								
								<c:otherwise>
									안녕하세요! ${loginUser.name }님!
								</c:otherwise>
								
							</c:choose>
							
							</li>
							<li ><a href="/ss/member/findLesson">과외찾기</a>
								<!-- <ul class="dropdown">
									<li><a href="#">Web Design</a></li>
									<li><a href="#">eCommerce</a></li>
									<li><a href="#">Branding</a></li>
									<li><a href="#">API</a></li>
								</ul>-->
								</li> 
							<li ><a href="/ss/lesson/findStu/list">학생찾기</a>
								<!-- <ul class="dropdown">
									<li><a href="#">HTML5</a></li>
									<li><a href="#">CSS3</a></li>
									<li><a href="#">Sass</a></li>
									<li><a href="#">jQuery</a></li>
								</ul> -->
								</li>
							<li><a href="/ss/board/main">커뮤니티</a></li>
							<li><a href="/ss/member/login">마이페이지</a></li>
							<li><a href="/ss/member/logout">로그아웃</a></li>
						</ul>
					</div>
				</div>

			</div>
		</nav>
		
