<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- nav include  -->
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/layout/main/header.jsp"></jsp:include>
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

<body>
	<div class="gtco-loader"></div>

	<!-- 김헌일 : 중고장터 프론트 초안작성중 0817 ~ ing -->

	<br>
	<br>
	<br>
	<br>
	<br>

	<div id="main_wrap">
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

		<h2 style="text-align: left">중고장터</h2>
		<h5>- 자유롭게 물건을 사고 파는 게시판입니다</h5>

	</div>

	<table class="table" style="width: 80%; margin: 0 auto; text-align: center;">
		<th style="text-align: center; width: 150px;">이미지</th>
		<th style="text-align: center; width: 40px;">번호</th>
		<th style="text-align: center; width: 290px;">제목</th>
		<th style="text-align: center; width: 110px;">작성일</th>
		<th style="text-align: center; width: 50px;">작성자</th>

		<!-- 테스트 데이터 삽입-->

		<tr>
			<td><img src="#" alt="상품 상세 이미지"
				style="width: 150px; height: 150px;" /></td>
			<td>1</td>
			<td>플레이스테이션 팝니다~!</td>
			<td>2020.08.17</td>
			<td>공자</td>
		</tr>

		<tr>
			<td><img src="#" alt="상품 상세 이미지"
				style="width: 150px; height: 150px;" /></td>
			<td>2</td>
			<td>스타벅스 아메리카노 2잔 기프트콘 판매합니다!</td>
			<td>2020.08.17</td>
			<td>맹자</td>
		</tr>

		<tr>
			<td><img src="#" alt="상품 상세 이미지"
				style="width: 150px; height: 150px;" /></td>
			<td>3</td>
			<td>원효대사가 직접 마신 해골물 판매하려고 합니다</td>
			<td>2020.08.17</td>
			<td>원효</td>
		</tr>

	</table>

	<br>
	<br>
	
	<!-- 페이징 삽입 위치 -->
	
	<div style="width: 80%; margin: 0 auto;"> >> Paging Here << </div>
	
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

