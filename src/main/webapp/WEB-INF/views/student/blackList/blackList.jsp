<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!-- 메인 헤더 -->   
<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>

<!-- 학생 마이페이지 헤더 -->
<c:import url="/WEB-INF/layout/student/stuHeader.jsp"></c:import>



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



<div id="title">
	<i class="glyphicon glyphicon-menu-right"></i>
	<a href="#">신고 내역</a>
</div>



<div id="content">


	<div class="row">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-body">
					<div class="table-responsive project-list">
					
						<div class="text-left">
							<span style="font-weight: bold">신고 수 : ${blackCnt } 개</span>
						</div>
						
						<form method="post" id="tableForm">
						
							<table class="table project-table table-centered table-nowrap table-hover" style="text-align: center;">
							
								<thead>
									<tr>
										<th  style="text-align: center" scope="col">#</th>
										<th  style="text-align: center" scope="col">게시판</th>
										<th  style="text-align: center" scope="col">신고글</th>
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
						<c:import url="/WEB-INF/paging/student/blacklistPaging.jsp" />
					</c:if>
					
				</div>
			</div>
		</div>
	</div>



</div> <!-- end content -->



<!-- 학생 마이페이지 푸터 -->
<c:import url="/WEB-INF/layout/student/stuFooter.jsp"></c:import>
<c:import url="/WEB-INF/layout/student/stuFooter2.jsp"></c:import>
