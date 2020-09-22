<!-- 20200902 김성은 -->
<!-- 학생 마이페이지 질문게시판 paging -->
<!-- /student/questionlist -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>
<c:import url="/WEB-INF/layout/student/stuHeader.jsp"></c:import>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/signStudent.css" type="text/css">


<style type="text/css">
	.menu-item#three ul {
		height: 93px;
	}

	#reviewM{
		background: #eee;
	}
	#title{

		width: 100%;
		font-weight: bold;
	}

	#title a {
		color: #17B794; /* 청록색 */
	}

</style>


<style type="text/css">

	body{
		background:#f5f5f5;
		margin-top:20px;
	}
	.card {
		border: none;
		-webkit-box-shadow: 1px 0 20px rgba(96,93,175,.05);
		box-shadow: 1px 0 20px rgba(96,93,175,.05);
		margin-bottom: 30px;
	}
	.table th {
		font-weight: 500;
		color: #262626;
		text-align: center;
	}
	.table thead {
		background-color: #f3f3f3cc;
	}
	.table>tbody>tr>td, .table>tfoot>tr>td, .table>thead>tr>td {
		padding: 14px 12px;
		vertical-align: middle;
	}
	.table tr td {
		color: #262626;
		text-align: center;
	}
	.thumb-sm {
		height: 32px;
		width: 32px;
	}
	.badge-soft-warning {
		background-color: rgba(248,201,85,.2);
		color: #f8c955;
	}

	.badge {
		font-weight: 500;
	}
	.badge-soft-primary {
		background-color: rgba(96,93,175,.2);
		color: #605daf;
	}

	#write{
		background: #d66;
		color: white;
	}
	.container a{
		text-decoration: none;
	}

</style>
<script type="text/javascript">
	function removeReview(reviewno){

		console.log(reviewno)

		$.ajax({
			url:"${pageContext.request.contextPath}/student/removeReview",
			type:"POST",
			data:{reviewNo:reviewno},
			success:function(){
				alert("삭제 되었습니다");
				location.reload();
			}
		})

	}
</script>


<div id="title">커뮤니티
	<i class="glyphicon glyphicon-menu-right"></i>
	<a href="">후기 게시판</a>
</div>


<div class="tab-content" >
	<!-- 탭메뉴 -->
	<ul class="nav nav-tabs">
		<li class="nav-item">
			<a id="write" onclick="location.href='<%= request.getContextPath() %>/student/reviewlist'" class="nav-link active" data-toggle="tab" >작성한 후기</a>
		</li>

	</ul>

	<div class="tab-pane fade active in" id="first">
		<div class="container" style="width: 960px; height: 100%;">
			<div class="row">
				<div class="col-xl-12">
					<div class="card">
						<div class="card-body">
							<div class="table-responsive">

								<table class="table table-hover mb-0">

									<thead>
									<tr class="align-self-center">
										<th style="width: 10%">번호</th>
										<th style="width: 15%">과외이름</th>
										<th style="width: 40%">내용</th>
										<th style="width: 10%">별점</th>
										<th style="width: 15%">작성일</th>
										<th style="width: 10%">삭제</th>

									</tr>
									</thead>

									<tbody>
									<c:if test="${empty reviewList}" >
										<td colspan="6">게시글이 존재하지 않습니다.</td>
									</c:if>

									<c:if  test="${not empty reviewList}" >
										<c:forEach items="${reviewList }" var="reviewList" >
											<tr>
												<td>${reviewList.REVIEW_NO}</td>
												<td>
													<a href="#">${reviewList.LESSON_TITLE}</a>
												</td>
												<td>${reviewList.REVIEW_CONTENT }</td>
												<td style="width: 15%"><div><c:forEach var="rating" items="${ ratingOptions }" varStatus="status" begin="1" end="${ reviewList.STAR_POINT }">★</c:forEach></div></td>

												<td>${reviewList.REVIEW_DATE}</td>
												<td onclick="removeReview(${reviewList.REVIEW_NO})"><i class="fa fa-trash"></i></td>
											</tr>
										</c:forEach>
									</c:if>
									</tbody>

								</table>

								<c:if test="${not empty reviewList}" >
									<c:import url="/WEB-INF/paging/student/board/reviewListPaging.jsp" />
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</div>







<!-- 학생 마이페이지 푸터 -->
<c:import url="/WEB-INF/layout/student/stuFooter.jsp"></c:import>
<c:import url="/WEB-INF/layout/student/stuFooter2.jsp"></c:import>

