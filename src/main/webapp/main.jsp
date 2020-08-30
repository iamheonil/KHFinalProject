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
						<h2>People Love Us</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
							Phasellus placerat enim et urna sagittis, rhoncus euismod erat
							tincidunt. Donec tincidunt volutpat erat.</p>
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
									&ldquo;Design must be functional and functionality must be
									translated into visual aesthetics, without any reliance on
									gimmicks that have to be explained.&rdquo; <cite class="author">&mdash;
										Ferdinand A. Porsche</cite>
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
									&ldquo;Creativity is just connecting things. When you ask
									creative people how they did something, they feel a little
									guilty because they didn’t really do it, they just saw
									something. It seemed obvious to them after a while.&rdquo; <cite
										class="author">&mdash; Steve Jobs</cite>
								</p>
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
									&ldquo;I think design would be better if designers were much
									more skeptical about its applications. If you believe in the
									potency of your craft, where you choose to dole it out is not
									something to take lightly.&rdquo; <cite class="author">&mdash;
										Frank Chimero</cite>
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
									&ldquo;Design must be functional and functionality must be
									translated into visual aesthetics, without any reliance on
									gimmicks that have to be explained.&rdquo; <cite class="author">&mdash;
										Ferdinand A. Porsche</cite>
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

</body>
</html>

