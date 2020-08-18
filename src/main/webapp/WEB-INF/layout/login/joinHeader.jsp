<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>슬기로운 과외생활</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
 
<!-- <!-- 부가적인 테마 --> -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
 
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description"
	content="Free HTML5 Website Template by FreeHTML5.co" />
<meta name="keywords"
	content="free website templates, free html5, free template, free bootstrap, free website template, html5, css3, mobile first, responsive" />
<meta name="author" content="FreeHTML5.co" />


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
<!-- <link rel="stylesheet" -->
<%-- 	href="${pageContext.request.contextPath}/resources/css/style.css"> --%>
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
  margin: .9em 0 0 0;
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
  text-decoration: none;
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

@media screen and (max-width: 480px) {
  #gtco-header .text-left {
    text-align: center !important;
  }
}
@media screen and (max-width: 480px) {
  #gtco-header .btn {
    display: block;
    width: 100%;
  }
}

.gtco-container {
  max-width: 1140px;
  position: relative;
  margin: 0 auto;
  padding-left: 15px;
  padding-right: 15px;
}


</style>
<!-- custom css  -->

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/custom.css">
	
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/heonilcss.css">

<!-- Modernizr JS -->
<script
	src="${pageContext.request.contextPath}/resources/js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

</head>
<body>
<a href="#" class="js-gtco-nav-toggle gtco-nav-toggle"><i></i></a>
		<nav class="gtco-nav" role="navigation">
			<div class="gtco-container">

				<div class="row">
					<div class="col-sm-2 col-xs-12">
						<div id="gtco-logo">
							<a href="index.html"><img
								src="${pageContext.request.contextPath}/resources/images/logo.png"
								alt="Free HTML5 Website Template by FreeHTML5.co"></a>
						</div>
					</div>
					<div class="col-xs-10 text-right menu-1">
						<ul>
							<li class="active"><a href="about.html">로그인</a></li>
							<li><a href="index.html">회원가입</a></li>
							<li ><a href="services.html">과외찾기</a>
								<!-- <ul class="dropdown">
									<li><a href="#">Web Design</a></li>
									<li><a href="#">eCommerce</a></li>
									<li><a href="#">Branding</a></li>
									<li><a href="#">API</a></li>
								</ul>-->
								</li> 
							<li ><a href="#">학생찾기</a>
								<!-- <ul class="dropdown">
									<li><a href="#">HTML5</a></li>
									<li><a href="#">CSS3</a></li>
									<li><a href="#">Sass</a></li>
									<li><a href="#">jQuery</a></li>
								</ul> -->
								</li>
							<li><a href="portfolio.html">중고장터</a></li>
							<li><a href="contact.html">마이페이지</a></li>
						</ul>
					</div>
				</div>

			</div>
		</nav>
</body>		
