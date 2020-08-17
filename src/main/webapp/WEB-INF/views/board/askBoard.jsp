<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 구동영 20200817 : 프론트 작업 -->
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
<div class="gtco-services gtco-section" style="background-color: #eee;">
	<div class="gtco-container">
		<div class="row">
			<div class="col-md-8 col-md-offset-2 gtco-heading text-center">
				<h2>질문 게시판</h2>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus placerat enim et urna sagittis, rhoncus euismod erat tincidunt. Donec tincidunt volutpat erat.</p>
			</div>
		</div>
		
	<!-- 검색바 -->		
	 <div class="s128">
      <form>
        <div class="inner-form">
          <div class="row">
            <div class="input-field first" id="first">
              <input class="input" id="inputFocus" type="text" placeholder="선생님 이름으로 검색" />
            </div>
          </div>
        </div>
      </form>
    </div>

	
	<table class="table" style="width: 80%; margin: 0 auto; text-align: center;">
		<tr>
			<th style="text-align: center; width: 40px;">번호</th>
			<th style="text-align: center; width: 290px;">제목</th>
			<th style="text-align: center; width: 110px;">작성일</th>
			<th style="text-align: center; width: 50px;">작성자</th>
		</tr>

		<tr>
			<td>1</td>
			<td>집에 가고싶다</td>
			<td>2020.08.17</td>
			<td>짱구</td>
		</tr>

		<tr>
			<td>2</td>
			<td>수업 언제 끝남</td>
			<td>2020.08.17</td>
			<td>짱아</td>
		</tr>

		<tr>
			<td>3</td>
			<td>수능 만점받는 방법좀</td>
			<td>2020.08.17</td>
			<td>철수</td>
		</tr>

	</table>

	
		
	</div>
				
	</div>
<!-- END .gtco-services -->

<!-- footer include  -->
	<jsp:include
		page="${pageContext.request.contextPath}/WEB-INF/layout/main/footer.jsp"></jsp:include>


	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>
	
	<!-- jQuery -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
	<!-- countTo -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.countTo.js"></script>
	<!-- Carousel -->
	<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<!-- Magnific Popup -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/magnific-popup-options.js"></script>
	
	<!-- Main -->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

	</body>
</html>