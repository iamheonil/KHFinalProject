<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- nav include  -->
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/layout/main/header.jsp"></jsp:include>
	
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/HisearchBar.css">	
		
<script>
	var btnDelete = document.getElementById('clear');
	var inputFocus = document.getElementById('inputFocus');
	//- btnDelete.on('click', function(e) {
	//-   e.preventDefault();
	//-   inputFocus.classList.add('isFocus')
	//- })
	//- inputFocus.addEventListener('click', function() {
	//-   this.classList.add('isFocus')
	//- })
	btnDelete.addEventListener('click', function(e) {
		e.preventDefault();
		inputFocus.value = ''
	})
	document.addEventListener('click', function(e) {
		if (document.getElementById('first').contains(e.target)) {
			inputFocus.classList.add('isFocus')
		} else {
			// Clicked outside the box
			inputFocus.classList.remove('isFocus')
		}
	});
</script>

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
	
	<!-- 김헌일 : 중고장터 프론트 초안작성중 0817 ~ ing -->

	<header id="gtco_header" class="gtco-cover gtco-cover-xs gtco-inner" role="banner">
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
												<p><h1>중고장터</h1></p>
											</div>
											<br>
											<div class="row margin-top-xl text title title-xl text-bold text-white pull-left">
												<p><h2>자유롭게 물건들을 팔아보아요</h2></p>
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
	
	<br>
	<table class="table table-hover" style="width: 80%; margin: 0 auto; text-align: center;">
		<th style="text-align: center; width: 150px;">이미지</th>
		<th style="text-align: center; width: 40px;">번호</th>
		<th style="text-align: center; width: 290px;">제목</th>
		<th style="text-align: center; width: 110px;">작성일</th>
		<th style="text-align: center; width: 50px;">작성자</th>

		<!-- 테스트 데이터 삽입-->

		<tr>
			<td><img src="https://estnn.com/wp-content/uploads/2020/04/playstation-5-ps5.png" alt="상품 상세 이미지"
				style="width: 150px; height: 150px;" /></td>
			<td>1</td>
			<td>플레이스테이션 팝니다~!</td>
			<td>2020.08.17</td>
			<td>공자</td>
		</tr>

		<tr>
			<td><img src="https://ccimg.hellomarket.com/images/2020/item/02/28/15/5958641_740264_1.jpg?size=s6" alt="상품 상세 이미지"
				style="width: 150px; height: 150px;" /></td>
			<td>2</td>
			<td>스타벅스 아메리카노 2잔 기프트콘 판매합니다!</td>
			<td>2020.08.17</td>
			<td>맹자</td>
		</tr>

		<tr>
			<td><img src="https://lh3.googleusercontent.com/proxy/3-urJrBM503b16KrYGFK6okVWWfLWUckDNXjt0xMaIPEwvo9uCiGPG4st_MY2TjBu8QvV6ebbsLkYC7mGEP00irVT1dzd1B6H2XUhcjGs__l8eg7cNFCAUk" alt="상품 상세 이미지"
				style="width: 150px; height: 150px;" /></td>
			<td>3</td>
			<td>원효대사가 직접 마신 해골물 판매하려고 합니다</td>
			<td>2020.08.17</td>
			<td>원효</td>
		</tr>
		
		<tr>
			<td><img src="https://img.ridicdn.net/cover/3984000001/xxlarge" alt="상품 상세 이미지"
				style="width: 150px; height: 150px;" /></td>
			<td>4</td>
			<td>진짜 뻥 안치고 한번 펴서 본 토비의 스프링 팝니다</td>
			<td>2020.08.17</td>
			<td>익명</td>
		</tr>
		
		<tr>
			<td><img src="https://theorydb.github.io/assets/img/review/2019-12-26-review-book-git-github-1.jpg" alt="상품 상세 이미지"
				style="width: 150px; height: 150px;" /></td>
			<td>5</td>
			<td>퇴사한 기념으로 깃 & 깃허브 입문 도서 판매합니다</td>
			<td>2020.08.18</td>
			<td>헌일</td>
		</tr>

	</table>

	<br>
	<br>
	
	<!-- 페이징 삽입 위치 -->
	
	<div class="text-center" style="width: 80%; margin: 0 auto;">
	
		<ul class="pagination">
		
			<li><a href="">1</a></li>
			<li><a href="">2</a></li>
			<li><a href="">3</a></li>
			<li><a href="">4</a></li>
			<li><a href="">5</a></li>
		
		</ul>

		<div class="s128">
			<form>
				<div class="inner-form">
					<div class="row">
						<div class="input-field second" id="first">
							<input class="input" id="inputFocus" type="text"
								placeholder="검색어를 입력해주세요" />
						</div>
					</div>
				</div>
			</form>
		</div>
	
	</div>
	
	<br>
	<br>

	<!-- footer include  -->
	<jsp:include
		page="${pageContext.request.contextPath}/WEB-INF/layout/main/footer.jsp"></jsp:include>

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

