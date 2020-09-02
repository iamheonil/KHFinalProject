<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>
<c:import url="/WEB-INF/layout/teacher/teaHeader.jsp"></c:import>



<!-- 현위지 메뉴 -->
<style type="text/css">

#title{
	width: 100%;
	font-weight: bold;
}

#title a:hover { color: #777777; }

/* 최상위 메뉴만 청록색 */
#title a:last-child { color: #17B794; }

</style>


<!-- 신고 처리 상태 -->
<style type="text/css">

.StateTurndown{
	font-size: 13px;
	border-radius: 5px;
	color: white;
	background-color: #aaa;
	font-weight: bold; 
	padding: 3px;
}
.StateReport{
	font-size: 13px;
	border-radius: 5px;
	color: white;
	background-color: #1E90FF;
	font-weight: bold; 
	padding: 3px;
}
.StateDelete{
	font-size: 13px;
	border-radius: 5px;
	color: white;
	background-color: #B90000;
	font-weight: bold; 
	padding: 3px;
}

</style>


<!-- contents -->
<style type="text/css">

.table {
	text-align: center;
	margin-top: 2px;
	color: #262626;
}

.table thead { background: #f3f3f3; }


#paging-box { text-align: center; }

.text-right > span { 
	font-weight: bold; 
	color: black;
	padding: 3px;
}

</style>


            
<div id="title">
	<i class="glyphicon glyphicon-menu-right"></i>
	<a href="">신고 내역</a>
</div>



	<!-- 삭제되었는지 모달띄우기  -->
<!-- 	<div class="modal fade" id="checkModal" tabindex="-1" role="dialog" -->
<!-- 		aria-hidden="true"> -->
<!-- 		<div class="vertical-alignment-helper"> -->
<!-- 			<div class="modal-dialog vertical-align-center"> -->
<!-- 				<div class="modal-content panel-info" id="checkType"> -->
<!-- 					<div class="modal-header panel heading"> -->
<!-- 						<h4 class="modal-title">확인 메시지</h4> -->
<!-- 						<button type="button" class="close" data-dismiss="modal"> -->
<!-- 							<span aria-hidden="true">&times</span> <span class="sr-only">Close</span> -->
<!-- 						</button> -->
<!-- 					</div> -->
<!-- 					<div class="modal-body" id="checkMessage" -->
<!-- 						style="text-align: center;"></div> -->
<!-- 					<div class="modal-footer"> -->
<!-- 						<button type="button" class="btn btn primary" data-dismiss="modal" -->
<!-- 							onclick="reload();">확인</button> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
    
<div id="content">

	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<div class="table-responsive project-list">
					
						<div class="text-right" style="margin: 0 18px;">
							<span>전체 : ${blackCnt } 건</span>
						</div>
						
						<form method="post" id="tableForm">
						
							<table class="table project-table table-centered table-nowrap table-hover">
							
								<thead>
									<tr>
										<th  style="text-align: center" scope="col">번호</th>
										<th  style="text-align: center" scope="col">게시판</th>
										<th  style="text-align: center" scope="col">글제목</th>
										<th  style="text-align: center" scope="col">신고 사유</th>
										<th  style="text-align: center" scope="col">신고 날짜</th>
										<th  style="text-align: center" scope="col">처리 상태</th>
									</tr>
								</thead>
								
								<tbody>
									<c:forEach items="${list }" var="i">
										<tr>
											<th style="text-align: center" scope="row">${i.NO }</th>
											<td class="board">${i.BLACKLIST_BOARD }</td>
											<td>
												<c:if test="${i.BLACKLIST_BOARD == '후기' }" >
													${i.REVIEW_CONTENT }
												</c:if>
												<c:if test="${i.BLACKLIST_BOARD == '장터' }" >
													${i.MK_TITLE }
												</c:if>
												<c:if test="${i.BLACKLIST_BOARD == '질문' }" >
													${i.QUESTION_TITLE }
												</c:if>
											</td>
											<td>${i.BLACKLIST_CONTENT }</td>
											<td>${i.BLACKLIST_DATE }</td>
											<td>
												<c:if test="${i.BLACKLIST_STATE == '신고됨' }" >
													<span class="StateReport">${i.BLACKLIST_STATE }</span>
												</c:if>
												<c:if test="${i.BLACKLIST_STATE == '반려됨' }" >
													<span class="StateTurndown">${i.BLACKLIST_STATE }</span>
												</c:if>
												<c:if test="${i.BLACKLIST_STATE == '삭제됨' }" >
													<span class="StateDelete">${i.BLACKLIST_STATE }</span>
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</tbody>
								
							</table>
							
						</form>
						
					</div>
					
					<!-- end project-list -->
					<c:if test="${not empty list}" >
						<div id="paging-box">
							<c:import url="/WEB-INF/paging/teacher/blacklistPaging.jsp" />
						</div>
					</c:if>
					
				</div>
			</div>
		</div>
	</div>


</div> <!-- end content -->


<c:import url="/WEB-INF/layout/teacher/teaFooter.jsp"></c:import>
<c:import url="/WEB-INF/layout/main/footer.jsp"></c:import>



