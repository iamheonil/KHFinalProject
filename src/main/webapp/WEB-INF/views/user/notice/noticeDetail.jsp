<!-- 200908 이서연 -->
<!-- 메인 > 상단메뉴 > 커뮤니티 > 공지사항 > 상세보기 -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<script type="text/javascript"
src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- nav include  -->
<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>

<!-- 배너 css link -->
<link rel="stylesheet"href="${pageContext.request.contextPath}/resources/css/HisearchBar.css">	


<!-- 배너 -->
<style type="text/css">

@import url('https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css');

.banner h1,.banner h2{
	font-family: 'NanumSquareRound', sans-serif !important;
    font-weight: bolder !important;
}

.banner h1{ margin-top:20px; }

.banner{ margin-top:120px; }

</style>


<!-- 본문 -->
<style type="text/css">

.container {
	width: 970px;
	margin: 100px auto 0;
}

.card {
    border: none;
    margin-bottom: 30px;
}

.table th {
    color: #777777;
    font-weight: bold;
}

.table th span#n { 
	color: #555555; 
	font-weight: 500;
}

.table thead { background-color: #fff; }

.table thead th:first-child { padding: 0 30px 8px; }

.table>thead>tr>td {
    padding: 14px 12px;
    vertical-align: middle;
}

#gotolist{
    float: right;
    width: 50px;
    margin: 0 auto 50px;
}

.button3 { /* 목록버튼 */
	background-color: #17B794;
	border: none;
	color: white;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	padding: 4px;
	border-radius: 3px;
	cursor: pointer;
	width: 65px;
	height: 30px;
}

</style>


<script type="text/javascript">
$(document).ready(function(){
	
	//목록 버튼 동작
	$("#listBtn").click(function(){
		$(location).attr("href", "${pageContext.request.contextPath}/board/notice");
	});
	
})
</script>



<!-- 배너 -->
<header id="gtco_header" class="gtco-cover gtco-cover-xs gtco-inner" role="banner">
	<div class="gtco-container">
		<div class="row">
			<div class="col-md-12 col-md-offset-0 text-left">
				<a href="${pageContext.request.contextPath}/board/notice"><div class="display-t">
					<div class="display-tc">
						<div class="row">
							<div class="col-md-8 animate-box">
								<div class="row padding-horizontal-md pull-left banner">
									<div class="row margin-top-xs text title title-xxl text-bold text-white">
										<p><h1>공지사항</h1></p>
									</div>
									<br>
									<div class="row margin-top-xl text title title-xl text-bold text-white pull-left">
										<p><h2>슬기로운 과외 생활을 위한 새롭고 다양한 소식을 전해드려요</h2></p>
									</div>
								</div>
							</div>	
						</div>
					</div>
				</div></a>
			</div>
		</div>
	</div>
</header>


<div class="clearfix"></div>

<!-- 본문 -->
<div class="container">
    <div class="row">
        <div class="col-xl-12">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover mb-0">
                            <thead>
                                <tr class="align-self-center">
                                    <th style="width: 25%;">No. <span id="n">${notice.noticeNo }</span></th>
                                    <th style="width: 55%;">Title. <span id="n">${notice.noticeTitle }</span></th>
                                    <th style="width: 20%;">Date. <span id="n">${notice.noticeDate }</span></th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                    <div style="text-align: center; margin: 50px 0;">${notice.noticeContent }</div><br><br>
<!--                end table-responsive -->
                </div>
            </div>
        </div>
    </div>
    
	<!-- 목록 -->
	<div id="gotolist" >
		<button type="button" class="button3" id="listBtn">목록</button>
	</div>
	
</div>






<!-- footer include  -->
<c:import url="/WEB-INF/layout/main/footer.jsp"></c:import>


<div class="gototop js-top">
	<a href="" class="js-gotop"><i class="icon-arrow-up"></i></a>
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
