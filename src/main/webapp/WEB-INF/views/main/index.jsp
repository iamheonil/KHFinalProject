<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <!-- 김헌일 : 로그인 후 메인 페이지 작성 -->

<%-- <!-- nav include  -->
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/layout/main/header.jsp"></jsp:include> --%>
<%@ include file="/WEB-INF/layout/main/header.jsp" %>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/index_silder.js" ></script>
<link href="${pageContext.request.contextPath}/resources/css/index_silder.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
function findstu() {
	location.href="${pageContext.request.contextPath}/lesson/findStu/list";
}

function numberWithCommas(x) {
  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

var listCountConTxt= 126842;

$({ val : 0 }).animate({ val : listCountConTxt }, {
 duration: 25000,
step: function() {
  var num = numberWithCommas(Math.floor(this.val));
  $(".listCountCon").text(num);
},
complete: function() {
  var num = numberWithCommas(Math.floor(this.val));
  $(".listCountCon").text(num);
}
});

var memberCountConTxt= 31012;

$({ val : 0 }).animate({ val : memberCountConTxt }, {
 duration: 25000,
step: function() {
  var num = numberWithCommas(Math.floor(this.val));
  $(".memberCountCon").text(num);
},
complete: function() {
  var num = numberWithCommas(Math.floor(this.val));
  $(".memberCountCon").text(num);
}
});

var monthCountConTxt= 150;

$({ val : 0 }).animate({ val : monthCountConTxt }, {
 duration: 20000,
step: function() {
  var num = numberWithCommas(Math.floor(this.val));
  $(".monthCountCon").text(num);
},
complete: function() {
  var num = numberWithCommas(Math.floor(this.val));
  $(".monthCountCon").text(num);
}
});

function numberWithCommas(x) {
  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

</script>

<style type="text/css">

.wrap {

width: 100%;
text-align: center;
}

.verticalLine {
  	border-left: thick solid gray;
}

</style>

<body>

<br><br><br>
	<div id="gtco_header" class="gtco-cover gtco-cover-xl" role="banner">
		<div class="gtco-container">
			<div class="gtco-section gtco-products">
				<div class="col-md-8 col-md-offset-2 gtco-heading text-center">
						<br><br><br><br>
						<h2 style="color: black;" >슬기로운 과외생활입니다!</h2>
						<p>
							<br>
							<c:choose>
								<c:when test="${loginUser.userName != null}">
									<p style="color: white; font-size: 22px;">안녕하세요! <br>${loginUser.userName }님!</p>
								</c:when>
								
								<c:otherwise>
									<p style="color: white; font-size: 22px;">안녕하세요! <br>${loginUser.name }님!</p>
								</c:otherwise>
								
							</c:choose>

						</p>
						
						<br>
						
						<div class="col-md-12 text-center">
							<p>
								<a href="/ss/lesson/findlesson" class="btn btn-special">과외찾기</a>
								<a href="/ss/lesson/findStu/list" class="btn btn-special">학생찾기</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- END .gtco-products -->
		
		<div class="gtco-services gtco-section">
			<div class="gtco-container">
				<div class="row row-pb-sm">
					<div class="col-md-8 col-md-offset-2 gtco-heading text-center">
						<h2>안전하고 실속 있게<br> 매칭할 수 있게 도와드립니다!</h2>
						<p>업계최저 단 돈 '1000원' !<br>선생님께 드릴 부담을 최대한 줄여드립니다. (학생은 중개수수료 무료)</p>
						<div class="col-md-12 text-center">
							<!-- <p>
								<a href="#" class="btn btn-special">더 알아보기</a>
							</p> -->
						</div>
					</div>
				</div>
				<div class="row row-pb-md">
					<div class="col-md-4 col-sm-4 service-wrap">
						<div class="service">
							<h3><i class="ti-pie-chart"></i> ANALYSIS</h3>
							<p>프로필 사진을 확인하시고 선생님이 올린 증빙서류, 이력서를 꼼꼼하게 살펴보세요! 매칭이 끝난 뒤 수업 시작 단계에서 꼭 확인하세요!</p>
						</div>
					</div>
					<div class="col-md-4 col-sm-4 service-wrap">
						<div class="service animate-change">
							<h3><i class="ti-heart"></i> Wish</h3>
							<p>맘에 드는 과외가 있을 때 찜하기 기능을 사용해보세요! 찜한 과외는 찜목록에서 확인할 수 있습니다!</p>
						</div>
					</div>
					<div class="col-md-4 col-sm-4 service-wrap">
						<div class="service">
							<h3><i class="ti-shopping-cart"></i> MARKET</h3>
							<p>과외 매칭 기능외에도 자유롭게 중고 책, 학용품 등을 거래할 수 있는 중고장터를 운영하고 있어요! 사용할 일 없는 물건들을 팔아보세요!</p>
						</div>
					</div>

					<div class="clearfix visible-md-block visible-sm-block"></div>

				</div>
			</div>
		</div>
		<!-- END .gtco-services -->
		
		<!--  -->
		<div class=wrap>
			<div class="animate-box">
				<div class="gtco-testimony gtco-section gtco-products">
					<div>
						<img src="data:image/png;base64,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" alt="Teacher Introduce" style="width: 250px; height: 250px;">
					</div>
					<blockquote>
						<p>
							&ldquo;오수짼데.. 올해가 마지막이다 라는 생각으로 과외를 시작했어요.&rdquo; 
							<cite class="author">&mdash; 26세 신입생 김X일</cite>
							</p>
					</blockquote>
				</div>
			</div>
		</div>
		
	    <div class="gtco-loader"></div>
    
	<br><br><br>
       
		<div id="gtco_header" class="gtco-cover gtco-cover-xs" role="banner">
		<div class="gtco-container">
			<div class="gtco-section gtco-products">
				<div class="col-md-8 col-md-offset-2 gtco-heading text-center">
					<h2 style="color: black;" >슬기롭게 과외생활을 시작해보세요!</h2>
						<br>
							<h2 style="color: white;">학생 수 &nbsp;&nbsp; | &nbsp;&nbsp; 선생님 수 &nbsp;&nbsp; | &nbsp;&nbsp; 연성장</h2> <br>
							<div style="display: flex; justify-content: center;">
								<div class="listCountCon" style="color: white; font-size: 23px;"></div>
								<div class="memberCountCon" style="color: white; font-size: 23px; margin-left: 23%"></div>
								<div class="monthCountCon" style="color: white; font-size: 23px; margin-left: 25%"></div> <div style="color: white">%</div>
						</div>
						<br><br>
						<p style="color: white;">슬기로운 과외생활은 여러분과 함께 매일 성장 중입니다!</p>
					</div>
				</div>
			</div>
		</div>
		
<%-- 		<div class=wrap>
			<div class="animate-box">
				<div class="gtco-testimony gtco-section gtco-products">
					<div>
						<img src="${pageContext.request.contextPath}/resources/images/person_1.jpg" alt="Free Website template by FreeHTML5.co">
					</div>
					<blockquote>
						<p>
							&ldquo;Design must be functional and functionality must be
							translated into visual aesthetics, without any reliance on
							gimmicks that have to be explained.&rdquo; <cite class="author">&mdash;
							Ferdinand A. Porsche</cite>
							</p>
					</blockquote>
				</div>
			</div>
		</div>
--%>
		
    <br><br><br><br>

   <!-- footer include  -->
		<%-- <jsp:include page="${pageContext.request.contextPath}/WEB-INF/layout/main/footer.jsp"></jsp:include> --%>
		
<%--		<%@ include file="/WEB-INF/layout/main/footer.jsp" %>--%>

    <!-- 선생님 마이페이지 푸터 -->
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

</body></html>

