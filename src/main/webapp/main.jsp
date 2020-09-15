<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="WEB-INF/layout/main/header.jsp" %>


<%-- <jsp:include page="${pageContext.request.contextPath}/WEB-INF/layout/main/header.jsp"></jsp:include>    --%>

<style type="text/css">
@import url('https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css');

.banner h1,.banner h2{
	font-family: 'NanumSquareRound', sans-serif !important;
    font-weight: bolder !important;
}
.banner h1{
margin-top:20px;
}

.banner{
	margin-top:120px;
}

</style>
<body>

	<div class="gtco-loader"></div>

	<div id="page">
	<!-- nav include  -->
		<header id="gtco_header" class="gtco-cover gtco-cover-xs gtco-inner"
			role="banner">
			<div class="gtco-container">
				<div class="row">
					<div class="col-md-12 col-md-offset-0 text-left">
						<div class="display-t">
							<div class="display-tc">
								<div class="row">
									<div class="col-md-8 animate-box">
										<link
											href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
											rel="stylesheet">
											
										<div class="row padding-horizontal-md pull-left banner">
											<div class="row margin-top-xs text title title-xxl text-bold text-white">
												<p><h1>과외에 대한 모든 것</h1></p>
											</div>
											<br>
											<div class="row margin-top-xl text title title-xl text-bold text-white pull-left">
												<p><h2>슬기로운 과외생활에서 찾아보세요</h2></p>
											</div>
										
										</div>	
										<div class="container bootstrap snippets bootdey banner">
											<div class="lc-block col-md-4  toggled pull-right" id="l-login">
												<div class="lcb-float">
													<i class="fa fa-users"></i>
												</div>
												<div class="form-group">
													<form action="/ss/member/loginImpl" method="post">
														<div class="form-group">
															<input type="text" class="form-control" id="userId" name="userId" placeholder="아이디">
															<input type="password" class="form-control" id="userPw" name="userPw" placeholder="비밀번호">
														</div>
															<div class="clearfix"></div>
														<button class="btn btn-block btn-primary btn-float m-t-25" style="color: white;">로그인</button>
													</form>
												</div>
												<ul class="login-navigation">
													<li data-block="#l-register" class="bg-green">Register</li>
													<li data-block="#l-forget-password" class="bg-orange">Forgot Password?</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>
		<!-- END #gtco-header -->




		<!-- END .gtco-services -->


		<!-- END .gtco-products -->

		<div class="gtco-section gtco-testimonial gtco-gray">
			<div class="gtco-container">

				<div class="row row-pb-sm">
					<div class="col-md-8 col-md-offset-2 gtco-heading text-center">
						<h2>좋은 선생님을 원하는 곳에서</h2>
						<p>우리는 과외를 받으려는 학생/학부모님과 과외선생님을 웹을 통해 연결합니다.</p>
					</div>
				</div>

				<div class="row">
					<div class="col-md-6 col-sm-6 animate-box">
						<div class="gtco-testimony gtco-left">
							<div>
								<img
									src="${pageContext.request.contextPath}/resources/images/person_1.jpg"
									alt="Free Website template by FreeHTML5.co">
							</div>
							<blockquote>
								<p>
									&ldquo;우리는 좋은 선생님을 검증하고, 그 선생님이 열과 성을 다해서 가르치도록 환경을 조성하고 있습니다.&rdquo; 
								</p>
							</blockquote>
						</div>
					</div>

					<div class="col-md-6 col-sm-6 animate-box">
						<div class="gtco-testimony gtco-left">
							<div>
								<img
									src="${pageContext.request.contextPath}/resources/images/person_2.jpg"
									alt="Free Website template by FreeHTML5.co">
							</div>
							<blockquote>
								<p>
									&ldquo;학생은 선생님에 대한 추천 평가를 할수 있으며, 향후 투명한 과외 조성에 큰 역할을 합니다&rdquo; 
							</blockquote>
						</div>
					</div>


				</div>
				<div class="row">
					<div class="col-md-6 col-sm-6 animate-box">
						<div class="gtco-testimony gtco-left">
							<div>
								<img
									src="${pageContext.request.contextPath}/resources/images/person_3.jpg"
									alt="Free Website template by FreeHTML5.co">
							</div>
							<blockquote>
								<p>
									&ldquo;자료실, 1대1 채팅기능을 통해 선생님이 더 과외를 많이 하게 되는 구조를 계속해서 강화해 나가고 있습니다.&rdquo; 
								</p>
							</blockquote>
						</div>
					</div>

					<div class="col-md-6 col-sm-6 animate-box">
						<div class="gtco-testimony gtco-left">
							<div>
								<img
									src="${pageContext.request.contextPath}/resources/images/person_1.jpg"
									alt="Free Website template by FreeHTML5.co">
							</div>
							<blockquote>
								<p>
									&ldquo;중고장터를 통해 사용하지 않는 도서나 학용품 등을 자유롭게 거래할수 있습니다.&rdquo; 
								</p>
							</blockquote>
						</div>
					</div>
				</div>
			</div>
		</div>


		<%-- <!-- footer include  -->
		<jsp:include page="${pageContext.request.contextPath}/WEB-INF/layout/main/footer.jsp"></jsp:include>  --%>
		
		<%@ include file="WEB-INF/layout/main/footer.jsp" %>
		


	</div>

	 <span class="gototop js-tops">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</span> 

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

</body>
</html>

