<!-- 200907 이서연 -->
<!-- 메인 > 상단메뉴 > 커뮤니티 > 게시판 > 신고하기 -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<script type="text/javascript"
src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- nav include  -->
<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>


<!-- 배너 css link -->
<link rel="stylesheet"href="${pageContext.request.contextPath}/resources/css/HisearchBar.css">	

<!-- 본문 css link -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css" rel="stylesheet">


<script type="text/javascript">
$(document).ready(function(){

	$("#singoForm").submit(function(){
		 alert('신고가 접수되었습니다.');
	})
	
})

</script>


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

.content {
	width: 700px;
    margin: 80px auto;
}

.formRow { 
	border: 2px solid #eee;
	border-radius: 30px;
	padding: 30px 20px 15px;
 }

.content .form-group { 
	margin-bottom: 25px; 
	color: #777777;
}

.content .form-control[readonly] { 
	background: none; 
	color: #777777;
}

.content .form-group .form-control { color: #777777; }

.singoBtn {
	text-align: center;
	margin: 30px 0 70px;
}

.singoBtn button { 
	font-size: 14px; 
	padding: 10px;
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
										<p><h1>신고하기</h1></p>
									</div>
									<br>
									<div class="row margin-top-xl text title title-xl text-bold text-white pull-left">
										<p><h2>사이트 운영 방침에 어긋나는 게시글을 신고해주세요</h2></p>
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


<div class="clearfix"></div>  


<div class="content">

	<form action="${pageContext.request.contextPath}/board/blacklist/insert" method="post" id="singoForm">
		<div class="row formRow">
		
		
			<div class="col-sm-6 mb-3">
			    <i class="fa fa-caret-right fa-1x"></i> 글번호
			    <div class="form-group">
		        <input type="text" class="form-control" id="no" name="no" value="${no }" readonly="readonly">
			    </div>
			</div>
			
			<div class="col-sm-6 mb-3">
			    <i class="fa fa-caret-right fa-1x"></i> 게시판
			    <div class="form-group">
		        <input type="text" class="form-control" id="board" name="board" value="${board }" readonly="readonly">
			    </div>
			</div>
			
			<div class="col-sm-6 mb-3">
			    <i class="fa fa-caret-right fa-1x"></i> 신고글
			    <div class="form-group">
		        <input type="text" class="form-control" id="title" name="title" value="${title }" readonly="readonly">
			    </div>
			</div>
			
			<div class="col-sm-6 mb-3">
			    <i class="fa fa-caret-right fa-1x"></i> 작성자
			    <div class="form-group">
		        <input type="tel" class="form-control" id="userId" name="userId" value="${userId }" readonly="readonly">
			    </div>
			</div>
			
			<div class="col-sm-12 mb-3">
		      	  <i class="fa fa-edit"></i> 신고 사유
			    <div class="form-group">
			        <textarea class="form-control" id="blContent" name="blContent" rows="4" required="required"
			        placeholder="※ 신고 사유를 작성해주세요.&#13;&#10;※ 무분별한 신고는 제재 대상이 될 수 있습니다."></textarea>
			    </div>
			</div>
		
		</div>
		
		<div class="col-sm-12 mb-3 singoBtn">
		    <button type="submit" name="submit" id="singoBtn" class="btn btn-primary">신고하기</button>
		</div>
		
	</form>
    
</div>







<!-- footer include  -->
<c:import url="/WEB-INF/layout/main/footer.jsp"></c:import>

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



