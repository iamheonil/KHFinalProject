<!-- 200908 이서연 -->
<!-- 메인 > 상단메뉴 > 커뮤니티 > 공지사항 (검색된목록) -->

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
    -webkit-box-shadow: 1px 0 20px rgba(96,93,175,.05);
    box-shadow: 7px 7px 9px 2px rgba(96,93,175,.05);
    margin-bottom: 30px;
}
.table th {
    font-weight: 500;
    color: #777777;
    font-weight: bold;
}

.table thead { background-color: #fff; }

.table thead th:first-child { padding: 0 30px 8px; }

.table tbody tr td:first-child { padding: 0 30px; }

.table>tbody>tr>td, .table>thead>tr>td {
    padding: 14px 12px;
    vertical-align: middle;
}

.table tr td {
    color: #555555;
}

.table tbody td a {	
	color: #555555; 
    padding: 13px 0;
}

.table tbody td a:hover { color: #17B794; }

.pagingstyle{
 	width: 50%; 
 	margin: 0 auto;
}

#searchbox{
    float: right;
    width: 270px;
    margin: 0 auto 50px;
}

#row {
    position: relative;
    margin-top: 10px;
}

#form-control {
	width: 150px;
    position: absolute;
    right: 18%;
    height: 30px;
}

.input-group-btn{
	position: absolute;
    right: 18%;
}

.buttonC { /* 검색버튼 */
	background-color: #eee; 
	color: #666;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	padding: 4px;
	border: 1px solid #aaa;
	border-radius: 3px;
	cursor: pointer;
    width: 55px;
    height: 30px;
    margin-left: 7px;
}

.buttonC:hover { /* 검색버튼 */
	background-color: #dfdfdf; 
}
</style>





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


<div class="container">
    <div class="row">
        <div class="col-xl-12">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover mb-0">
                            <thead>
                                <tr class="align-self-center">
                                    <th style="width: 25%;">No.</th>
                                    <th style="width: 60%;">Title.</th>
                                    <th style="width: 15%;">Date.</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:if test="${empty notice}">
                          			<tr>
                          				<td></td><td style="text-align: center; height: 30px;">검색된 공지사항이 없습니다</td><td></td>
                          			</tr>
                            	</c:if>
                            	<c:if test="${not empty notice}">
                            		<c:forEach items="${notice }" var="n">
	                          			<tr>
	                          				<td>${n.noticeNo }</td>
	                          				<td><a href="${pageContext.request.contextPath}/board/notice/detail?no=${n.noticeNo }">${n.noticeTitle }</a></td>
	                          				<td>${n.noticeDate }</td>
	                          			</tr>
                          			</c:forEach>
                            	</c:if>
                            </tbody>
                        </table>
                    </div>
                    <!--end table-responsive-->
                </div>
            </div>
        </div>
    </div>
    
    <!--  검색 -->
<%-- 	<c:if test="${not empty notice}"> --%>
		<div id="searchbox" >
			<form action="${pageContext.request.contextPath}/board/notice/search" method="get">
				<div id="row">
					<input type="text" id="form-control" placeholder="제목을 입력하세요" name="keyword">
					<span class="input-group-btn">
						<button class="buttonC" type="submit">검색</button>
					</span>
				</div>
			</form>
		</div>
<%-- 	</c:if> --%>
	
</div>


<!-- 페이징 -->
<c:if test="${not empty notice}">
	<br>
	<div class="pagingstyle">
		<c:import url="/WEB-INF/paging/user/notice/userNoticeSearchPaging.jsp"></c:import>
	</div>
	<br><br>
</c:if>





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
