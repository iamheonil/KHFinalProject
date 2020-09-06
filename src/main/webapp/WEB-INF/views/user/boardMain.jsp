<!-- 200903 이서연 -->
<!-- 메인 > 삳단메뉴 > 커뮤니티 -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!-- nav include  -->
<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>

<!-- 배너 css link -->
<link rel="stylesheet"href="${pageContext.request.contextPath}/resources/css/HisearchBar.css">	

<!-- content css ling -->
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">


<!-- 배너 -->
<style type="text/css">

@import url('https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css');

.banner h1,.banner h2{
	font-family: 'NanumSquareRound', sans-serif !important;
    font-weight: bolder !important;
}

.banner h1{ margin-top:20px; }

.banner{ margin-top:120px; }

#bannerImg { 
	display: inline-block;
    position: absolute;
    right: -30%;
    top: -20%;

}

</style>


<!-- contents -->
<style type="text/css">

#content {
	width: 970px;
	margin: 100px auto; 
}

.container {
	width: 970px;
	margin: 0 auto;
}

.panel {
  box-shadow: 0 2px 0 rgba(0,0,0,0.05);
  border-radius: 0;
  border: 0;
  margin-bottom: 24px;
}

.panel-dark.panel-colorful {
  background-color: #3b4146;
  border-color: #3b4146;
  color: #fff;
}
.panel-dark.panel-colorful:hover { 
	background-color: #3b4146cc; 
	cursor: pointer;
}

.panel-danger.panel-colorful {
  background-color: #f76c51;
  border-color: #f76c51;
  color: #fff;
}
.panel-danger.panel-colorful:hover { 
	background-color: #f76c51cc; 
	cursor: pointer;
}

.panel-primary.panel-colorful {
  background-color: #949698;
  border-color: #949698;
  color: #fff;
}
.panel-primary.panel-colorful:hover { 
	background-color: #949698cc; 
	cursor: pointer;
}

.panel-info.panel-colorful {
  background-color: #33a1bd;
  border-color: #33a1bd;
  color: #fff;
}
.panel-info.panel-colorful:hover { 
	background-color: #33a1bdcc;
	cursor: pointer;
}

.panel-body {
  padding: 25px 20px 10px;
  height: 307px;
}

.panel hr {
  border-color: rgba(0,0,0,0.1);
}

.mar-top {
  margin-top: 10px;
}

h2, .h2 {
  font-size: 28px;
}

.small, small {
  font-size: 85%;
}

.text-sm {
  font-size: .9em;
}

.text-thin {
  font-weight: 300;
}

.text-semibold {
  font-weight: 600;
}


#boardTitle {
	color: white;
	font-size: 25px;
	font-weight: bold;
}

#conts {
	color: white;
	font-size: 15px;
	text-align: left;
    padding: 0 10px;
    
    overflow: hidden;
    white-space: nowrap; 
    text-overflow: ellipsis; 

}

</style>


<header id="gtco_header" class="gtco-cover gtco-cover-xs gtco-inner" role="banner">
	<div class="gtco-container">
		<div class="row">
			<div class="col-md-12 col-md-offset-0 text-left">
				<div class="display-t">
					<div class="display-tc">
						<div class="row">
							<div class="col-md-8 animate-box">
								<div class="row padding-horizontal-md pull-left banner">
									<div class="row margin-top-xs text title title-xxl text-bold text-white">
										<p><h1>커뮤니티</h1></p>
									</div>
									<br>
									<div class="row margin-top-xl text title title-xl text-bold text-white pull-left">
										<p><h2>다양한 회원들과 소통을 나누어요</h2></p>
									</div>
								</div>
								<div class="row padding-horizontal-md pull-right banner" id="bannerImg">
									<img alt="" src="${pageContext.request.contextPath}/resources/images/people.png" style="height: 350px;">
								</div>
							</div>	
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>

<div class="clearfix"></div>  

<!-- 본문 시작 -->
<div id="content"> 


	<div class="container bootstrap snippets bootdey">
	    <div class="row">
	    
	    	<a href="${pageContext.request.contextPath}/board/notice"> <!-- 공지사항 링크 -->
		        <div class="col-md-3 col-sm-6 col-xs-12">
		            <div class="panel panel-dark panel-colorful">
		                <div class="panel-body text-center">
		                	<p class="text-uppercase text-sm" id="boardTitle">공지사항</p>
		                	<i class="fa fa-users fa-3x mar-top"></i>
		                	<hr>
		                	<c:forEach items="${notice }" var="l">
		        				<p id="conts">
		        				<i class="fa fa-caret-right fa-1x mar-top"></i>&nbsp;
		        				${l.NOTICE_TITLE}</p>
		        			</c:forEach>
		                </div>
		            </div>
		        </div>
	        </a>
	        
	        <a href="${pageContext.request.contextPath}/board/review"> <!-- 후기게시판 링크 -->
		        <div class="col-md-3 col-sm-6 col-xs-12">
		        	<div class="panel panel-danger panel-colorful">
		        		<div class="panel-body text-center">
		        			<p class="text-uppercase text-sm" id="boardTitle">후기게시판</p>
		        			<i class="fa fa-comment fa-3x mar-top"></i>
		        			<hr>
		        			<c:forEach items="${review }" var="l">
		        				<p id="conts">
		        				<i class="fa fa-caret-right fa-1x mar-top"></i>&nbsp;
		        				${l.REVIEW_CONTENT}</p>
		        			</c:forEach>
		        		</div>
		        	</div>
		        </div>
	        </a>
	        
	        <a href="${pageContext.request.contextPath}/board/question"> <!-- 질문게시판 링크ㅡ -->
		        <div class="col-md-3 col-sm-6 col-xs-12">
		        	<div class="panel panel-primary panel-colorful">
		        		<div class="panel-body text-center">
		        			<p class="text-uppercase text-sm" id="boardTitle">질문게시판</p>
		        			<i class="fa fa-graduation-cap fa-3x mar-top" ></i>
		        			<hr>
		        			<c:forEach items="${question }" var="l">
		        				<p id="conts">
		        				<i class="fa fa-caret-right fa-1x mar-top"></i>&nbsp;
		        				${l.QUESTION_TITLE}</p>
		        			</c:forEach>
		        		</div>
		        	</div>
		        </div>
	        </a>
	        
	        <a href="${pageContext.request.contextPath}/board/market"> <!-- 중고장터 링크 -->
		        <div class="col-md-3 col-sm-6 col-xs-12">
		        	<div class="panel panel-info panel-colorful">
		        		<div class="panel-body text-center">
		        			<p class="text-uppercase text-sm" id="boardTitle">중고장터</p>
		        			<i class="fa fa-shopping-cart fa-3x mar-top"></i>
		        			<hr>
		        			<c:forEach items="${market }" var="l">
		        				<p id="conts">
		        				<i class="fa fa-caret-right fa-1x mar-top"></i>&nbsp;
		        				${l.MK_TITLE}</p>
		        			</c:forEach>
		        		</div>
		        	</div>
		        </div> 
	        </a>     
	          
		</div>
	</div>
	
	
	
</div> <!-- end #content -->


<!-- footer include  -->
<c:import url="/WEB-INF/layout/main/footer.jsp"></c:import>


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
