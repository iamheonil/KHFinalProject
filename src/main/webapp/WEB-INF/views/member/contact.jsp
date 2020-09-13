<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/layout/main/header.jsp" %>

<style type="text/css">
	
	

</style>

	<body>
		<br><br><br>
		<div id="main_wrap" style="margin: 0 auto;">
				<div id="maps" style="margin-left: 15%;">
				<br><br>
				
				<img src="${pageContext.request.contextPath}/resources/images/contact.png" alt="Contact" style="margin-left: -3%">
				<br><br>
				
				<h4>
					Address - 서울 강남구 테헤란로10길 9 4층(서울 강남구 역삼동 823-42 4층) <br>
					Tel - 010-1234-5678 <br>
					E-mail - abc@kh.com <br>
					고객센터 - 월-금 9:00-17:00 <br>
				</h4>
				
				<br>
				
				<!--
				* 카카오맵 - 약도서비스
				* 한 페이지 내에 약도를 2개 이상 넣을 경우에는
				* 약도의 수 만큼 소스를 새로 생성, 삽입해야 합니다.
				-->
				
				<!-- 1. 약도 노드 -->
				<div id="daumRoughmapContainer1599547970928" class="root_daum_roughmap root_daum_roughmap_landing"></div>
				
				<!-- 2. 설치 스크립트 -->
				<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
				
				<!-- 3. 실행 스크립트 -->
				<script charset="UTF-8">
					new daum.roughmap.Lander({
						"timestamp" : "1599547970928",
						"key" : "2zxg3",
						"mapWidth" : "1000",
						"mapHeight" : "400"
					}).render();
				</script>
			</div>
		</div>
	</body>
	<br>
	
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