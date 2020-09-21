<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- 관리자 페이지 header -->
<c:import url="/WEB-INF/layout/admin/adminHeader.jsp"></c:import>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" />




<style type="text/css">
body {
	margin-top: 20px;
}
/* USER LIST TABLE */
.user-list tbody td>img {
	position: relative;
	max-width: 50px;
	float: left;
	margin-right: 15px;
}

.user-list tbody td .user-link {
	display: block;
	font-size: 1.55em;
	padding-top: 3px;
	margin-left: 60px;
}

.user-list tbody td .user-subhead {
	font-size: 1.5em;
	font-style: italic;
}
/* TABLES */
.table {
	border-collapse: separate;
}

.table-hover>tbody>tr:hover>td, .table-hover>tbody>tr:hover>th {
	background-color: #eee;
}

.table thead>tr>th {
	border-bottom: 1px solid #C2C2C2;
	padding-bottom: 0;
}

.table tbody>tr>td {
	font-family: 'NanumSquareRound', sans-serif !important;
	font-weight: bolder !important;
	font-size: 1.25em;
	background: #f5f5f5;
	border-top: 10px solid #fff;
	vertical-align: middle;
	padding: 12px 8px;
}

.table tbody>tr>td:first-child, .table thead>tr>th:first-child {
	padding-left: 20px;
}

.table thead>tr>th span {
	border-bottom: 2px solid #C2C2C2;
	display: inline-block;
	padding: 0 5px;
	padding-bottom: 5px;
	font-weight: normal;
}

.table thead>tr>th>a span {
	color: #344644;
}

.table thead>tr>th>a span:after {
	content: "\f0dc";
	font-family: FontAwesome;
	font-style: normal;
	font-weight: normal;
	text-decoration: inherit;
	margin-left: 5px;
	font-size: 0.75em;
}

.table thead>tr>th>a.asc span:after {
	content: "\f0dd";
}

.table thead>tr>th>a.desc span:after {
	content: "\f0de";
}

.table thead>tr>th>a:hover span {
	text-decoration: none;
	color: #2bb6a3;
	border-color: #2bb6a3;
}

.table.table-hover tbody>tr>td {
	-webkit-transition: background-color 0.15s ease-in-out 0s;
	transition: background-color 0.15s ease-in-out 0s;
}

.table tbody tr td .call-type {
	display: block;
	font-size: 0.75em;
	text-align: center;
	align-items: center;
}

.table tbody tr td .first-line {
	line-height: 1.5;
	font-weight: 400;
	font-size: 1.125em;
}

.table tbody tr td .first-line span {
	font-size: 0.875em;
	color: #969696;
	font-weight: 300;
}

.table tbody tr td .second-line {
	font-size: 0.875em;
	line-height: 1.2;
}

.table a.table-link {
	margin: 0 5px;
	font-size: 1.125em;
}

.table a.table-link:hover {
	text-decoration: none;
	color: #2aa493;
}

.table a.table-link.danger {
	color: #fe635f;
}

.table a.table-link.danger:hover {
	color: #dd504c;
}

.table-products tbody>tr>td {
	background: none;
	border: none;
	border-bottom: 1px solid #ebebeb;
	-webkit-transition: background-color 0.15s ease-in-out 0s;
	transition: background-color 0.15s ease-in-out 0s;
	position: relative;
}

.table-products tbody>tr:hover>td {
	text-decoration: none;
	background-color: #f6f6f6;
}

.table-products .name {
	display: block;
	font-weight: 600;
	padding-bottom: 7px;
}

.table-products .price {
	display: block;
	text-decoration: none;
	width: 50%;
	float: left;
	font-size: 0.875em;
}

.table-products .price>i {
	color: #8dc859;
}

.table-products .warranty {
	display: block;
	text-decoration: none;
	width: 50%;
	float: left;
	font-size: 0.875em;
}

.table-products .warranty>i {
	color: #f1c40f;
}

.table tbody>tr.table-line-fb>td {
	background-color: #9daccb;
	color: #262525;
}

.table tbody>tr.table-line-twitter>td {
	background-color: #9fccff;
	color: #262525;
}

.table tbody>tr.table-line-plus>td {
	background-color: #eea59c;
	color: #262525;
}

.table-stats .status-social-icon {
	font-size: 1.9em;
	vertical-align: bottom;
}

.table-stats .table-line-fb .status-social-icon {
	color: #556484;
}

.table-stats .table-line-twitter .status-social-icon {
	color: #5885b8;
}

.table-stats .table-line-plus .status-social-icon {
	color: #a75d54;
}
</style>

<!--////////////////////////////////////////////////////////////////////////  -->

<style type="text/css">
.widget-26 {
	color: #3c4142;
	font-weight: 400;
}

.widget-26 tr:first-child td {
	border: 0;
}

.widget-26 .widget-26-job-emp-img img {
	width: 35px;
	height: 35px;
	border-radius: 50%;
}

.widget-26 .widget-26-job-title {
	min-width: 200px;
}

.widget-26 .widget-26-job-title a {
	font-weight: 400;
	font-size: 0.875rem;
	color: #3c4142;
	line-height: 1.5;
}

.widget-26 .widget-26-job-title a:hover {
	color: #68CBD7;
	text-decoration: none;
}

.widget-26 .widget-26-job-title .employer-name {
	margin: 0;
	line-height: 1.5;
	font-weight: 400;
	color: #3c4142;
	font-size: 0.8125rem;
	color: #3c4142;
}

.widget-26 .widget-26-job-title .employer-name:hover {
	color: #68CBD7;
	text-decoration: none;
}

.widget-26 .widget-26-job-title .time {
	font-size: 12px;
	font-weight: 400;
}

.widget-26 .widget-26-job-info {
	min-width: 100px;
	font-weight: 400;
}

.widget-26 .widget-26-job-info p {
	line-height: 1.5;
	color: #3c4142;
	font-size: 0.8125rem;
}

.widget-26 .widget-26-job-info .location {
	color: #3c4142;
}

.widget-26 .widget-26-job-salary {
	min-width: 70px;
	font-weight: 400;
	color: #3c4142;
	font-size: 0.8125rem;
}

.widget-26 .widget-26-job-category {
	padding: .5rem;
	display: inline-flex;
	white-space: nowrap;
	border-radius: 15px;
}

.widget-26 .widget-26-job-category .indicator {
	width: 13px;
	height: 13px;
	margin-right: .5rem;
	float: left;
	border-radius: 50%;
}

.widget-26 .widget-26-job-category span {
	font-size: 0.8125rem;
	color: #3c4142;
	font-weight: 600;
}

.widget-26 .widget-26-job-starred svg {
	width: 20px;
	height: 20px;
	color: #fd8b2c;
}

.widget-26 .widget-26-job-starred svg.starred {
	fill: #fd8b2c;
}

.bg-soft-base {
	background-color: #e1f5f7;
}

.bg-soft-warning {
	background-color: #fff4e1;
}

.bg-soft-success {
	background-color: #d1f6f2;
}

.bg-soft-danger {
	background-color: #fedce0;
}

.bg-soft-info {
	background-color: #d7efff;
}

.search-form {
	width: 80%;
	margin: 0 auto;
	margin-top: 1rem;
}

.search-form input {
	height: 100%;
	background: transparent;
	border: 0;
	display: block;
	width: 100%;
	padding: 1rem;
	height: 100%;
	font-size: 1rem;
}

.search-form select {
	background: transparent;
	border: 0;
	padding: 1rem;
	height: 100%;
	font-size: 1rem;
	padding-left: 4rem;
}

.search-form select:focus {
	border: 0;
}

.search-form button {
	height: 100%;
	width: 100%;
	font-size: 1rem;
}

.search-form button svg {
	width: 24px;
	height: 24px;
}

.search-body {
	margin-bottom: 5.5rem;
}

.search-body .search-filters .filter-list {
	margin-bottom: 1.3rem;
}

.search-body .search-filters .filter-list .title {
	color: #3c4142;
	margin-bottom: 1rem;
}

.search-body .search-filters .filter-list .filter-text {
	color: #727686;
}

.search-body .search-result .result-header {
	margin-bottom: 2rem;
}

.search-body .search-result .result-header .records {
	color: #3c4142;
}

.search-body .search-result .result-header .result-actions {
	text-align: right;
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.search-body .search-result .result-header .result-actions .result-sorting
	{
	display: flex;
	align-items: center;
}

.search-body .search-result .result-header .result-actions .result-sorting span
	{
	flex-shrink: 0;
	font-size: 0.8125rem;
}

.search-body .search-result .result-header .result-actions .result-sorting select
	{
	color: #68CBD7;
}

.search-body .search-result .result-header .result-actions .result-sorting select option
	{
	color: #3c4142;
}

@media ( min-width : 700px) and (max-width: 900.98px) {
	.search-body .search-filters {
		display: flex;
	}
	.search-body .search-filters .filter-list {
		margin-right: 1rem;
	}
}

.card-margin {
	margin-bottom: 1.875rem;
}

@media ( min-width : 992px) {
	.col-lg-2 {
		flex: 0 0 16.66667%;
		max-width: 16.66667%;
	}
}

.card-margin {
	margin-bottom: 1.875rem;
}

.card {
	border: 0;
	box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
	-webkit-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
	-moz-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
	-ms-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
}

.card {
	position: relative;
	display: flex;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #ffffff;
	background-clip: border-box;
	border: 1px solid #e6e4e9;
	border-radius: 8px;
}





select.form-control:not([size]):not([multiple]) {
    height: calc(3.25rem + 2px);
}


</style>

<style type="text/css">
 .mya:link { color: black; text-decoration: none;}
 .mya:visited { color: black; text-decoration: none;}
 .mya:hover { color: black; text-decoration: underline;}
 
 
 .sb-topnav .navbar-brand {
    width: 225px;
    padding-left: 1.5rem;
    padding-right: 1rem;
    padding-top:1rem;
    margin: 0;
    font-size: 19px;
    font-weight: bold;
}

 
 
</style>




<script type="text/javascript">

function delchk(num){
	
	var url="${pageContext.request.contextPath}/delete/market";
	
	
	$.ajax({
			type : "POST",
			url: url,
			data: { mkNo: num },  
			success : function(result) {
				
				if (result == 1) {//친구를 찾았을때
					
					$("#checkMessage").html("게시물을 삭제했습니다 <br><br><br>");
					$("#checkType").attr("class","modal-content panel-success");
					$("#checkModal").modal();
					
					

				}else{//친구를 못찾았을때
					$("#checkMessage").html("게시물 삭제에 실패했습니다<br><br><br>");
					$("#checkType").attr("class","modal-content panel-warning");
					
				}
				$("#checkModal").modal();
			}
		});
	
	
}

function reload(){
	location.reload();
}

</script>
<script>
document.ready(function(){
	$('#sidenavAccordion > div > div > a')
	 $('#sidenavAccordion > div > div > a').on('click',function(){
		    $('#sidenavAccordion > div > div > a').removeClass('active');    // 모든 li에 'active'클래스 제거
		    $(this).addClass('active')    // 자신에게 'active'클래스 적용
		  });
		


	
})

</script>




	<div id="title">
		과외 <i class="fas fa-angle-right"></i> <a href="#">중고장터 조회/삭제</a>
	</div>

	<!-- 로그인처리 확인 구현  나중에 추가 구현 -->
	<%
		String userId = null;
		if (session.getAttribute("userID") != null) {//세션에서 아이디값 가져옴
			userId = (String) session.getAttribute("userID");
		}
		
	%>


	<!-- 삭제되었는지 모달띄우기  -->

	<div class="modal fade" id="checkModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div class="modal-content panel-info" id="checkType">
					<div class="modal-header panel heading">
						<h4 class="modal-title">확인 메시지</h4>
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times</span> <span class="sr-only">Close</span>
						</button>
					</div>
					<div class="modal-body" id="checkMessage"
						style="text-align: center;"></div>
					<div class="modal-footer">
						<button type="button" class="btn btn primary" data-dismiss="modal"
							onclick="reload();">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<main>
		<div id="content">




			<!-- 검색창  -->
			<div class="container">

				<div class="row">
					<div class="col-lg-12 card-margin">
						<div class="card search-form">
							<div class="card-body p-0">
								<form id="search-form"
									action="${pageContext.request.contextPath}/admin/market"
									method="get">
									<div class="row">
										<div class="col-12">
											<div class="row no-gutters">
												<div class="col-lg-3 col-md-3 col-sm-12 p-0">
													<select class="form-control" id="exampleFormControlSelect1"
														name="option">

														<c:choose>
															<c:when test="${option eq '사용자id' }">
																<option>전체</option>
																<option selected="selected">사용자id</option>
																<option>title</option>
															</c:when>
															<c:when test="${option eq 'title' }">
																<option>전체</option>
																<option>사용자id</option>
																<option selected="selected">title</option>
															</c:when>
															<c:otherwise>
																<option selected="selected">전체</option>
																<option>사용자id</option>
																<option>title</option>
															</c:otherwise>
														</c:choose>


													</select>
												</div>
												<div class="col-lg-8 col-md-6 col-sm-12 p-0">
													<input type="text" placeholder="검색어를 입력하세요"
														class="form-control" id="search" name="search"
														value="<c:if test="${search ne null }">${search }</c:if>">
												</div>
												<div class="col-lg-1 col-md-3 col-sm-12 p-0">
													<button type="submit" class="btn btn-base">
														<svg xmlns="http://www.w3.org/2000/svg" width="24"
															height="24" viewBox="0 0 24 24" fill="none"
															stroke="currentColor" stroke-width="2"
															stroke-linecap="round" stroke-linejoin="round"
															class="feather feather-search">
															<circle cx="11" cy="11" r="8"></circle>
															<line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
													</button>
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<br> <br>
				

				<!-- 게시물 리스트  -->
				<div class="row">
					<div class="col-lg-12">
						<div class="main-box clearfix">
							<div class="table-responsive">
								<table class="table user-list table-hover">
									<thead>
										<tr>
											<th><span>writer</span></th>
											<th><span>thumb</span></th>
											
											<th><span>title</span></th>
											<th><span>Created</span></th>
											<th class="text-center"><span>Status</span></th>
											<th><span>price</span></th>
											<th>&nbsp;</th>

										</tr>
									</thead>
									<tbody>
										<c:forEach items="${marketList.mList}" var="market">
											<a href="#" class="user-link">
												<tr>
												<td>${market.USER_ID }</td>
												<td align="center" class="mytd"><img
														src="${pageContext.request.contextPath}/resources/upload/${market.MK_THUMB_RENAME}" onerror="this.src='${pageContext.request.contextPath}/resources/images/noImage.png'"
														alt="" style="width: 50px;height: 50px; margin-left: 32%"></td>
													<td><a class="mya" href="${pageContext.request.contextPath}/board/adminMarket/detail?mkno=${market.mkNo}" > ${market.mkTitle }</a></td>
													<td>${market.mkDate }</td>
													<td class="text-center"><span
														class="label label-default"> <c:if
																test="${market.mkState eq 0}">
												게시중</span></td>
													</c:if>
													<c:if test="${market.mkState eq 1}">
												판매완료</span>
														</td>
													</c:if>
													<c:if test="${market.mkState eq 2}">
												삭제</span>
														</td>
													</c:if>
													<td>${market.mkPrice }원</td>
													<td style="width: 20%;"><a href="javascript:void(0);"
														onclick="delchk(${market.mkNo});"
														class="table-link danger"> <span class="fa-stack">
																<i class="fa fa-square fa-stack-2x"></i> <i
																class="fa fa-trash fa-stack-1x fa-inverse "></i>
														</span>
													</a></td>
												</tr>
											</a>
										</c:forEach>

									</tbody>
								</table>
							</div>

							<!-- 페이징 처리  -->

							<ul class="pagination pull-right">
								<!-- 첫 페이지로 가기 -->
								<c:if test="${paging.curPage gt 1 }">
									<%--    <c:if test="${paging.curPage gt paging.pageCount  }"> --%>
									<li><a
										href="${pageContext.request.contextPath}/admin/market?curPage=1&option=${option}&search=${search}">&laquo;</a></li>
								</c:if>

								<!-- 이전 페이지로 가기 -->
								<c:if test="${paging.curPage gt 1 }">
									<li><a
										href="${pageContext.request.contextPath}/admin/market?curPage=${paging.curPage - 1 }&option=${option}&search=${search}">&lt;</a>
								</c:if>

								<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
									var="i">

									<!-- 현재 페이지라면 강조(.active) -->
									<c:if test="${paging.curPage eq i }">
										<li class="active"><a
											href="${pageContext.request.contextPath}/admin/market?curPage=${i }&option=${option}&search=${search}">${i }</a></li>
									</c:if>

									<!-- 현재 페이지가 아니라면 평소 모습-->
									<c:if test="${paging.curPage ne i }">
										<li><a
											href="${pageContext.request.contextPath}/admin/market?curPage=${i }&option=${option}&search=${search}">${i }</a></li>
									</c:if>

								</c:forEach>

								<!-- 다음 페이지로 가기 -->
								<c:if test="${paging.curPage < paging.totalPage}">
									<li><a
										href="${pageContext.request.contextPath}/admin/market?curPage=${paging.curPage + 1 }&option=${option}&search=${search}">&gt;</a>
								</c:if>

								<!-- 마지막 페이지로 가기 -->
								<c:if test="${paging.curPage < paging.totalPage }">
									<li><a
										href="${pageContext.request.contextPath}/admin/market?curPage=${paging.totalPage }&option=${option}&search=${search}">&raquo;</a></li>
								</c:if>


							</ul>
						</div>
					</div>
				</div>
			</div>

		</div>

		<hr>
	</main>


	<!-- 관리자 페이지 footer -->
	<c:import url="/WEB-INF/layout/admin/adminFooter.jsp"></c:import>