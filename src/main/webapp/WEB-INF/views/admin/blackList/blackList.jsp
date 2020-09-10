<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 관리자 페이지 header -->   

<c:import url="/WEB-INF/layout/admin/adminHeader.jsp"></c:import>

	<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" />
	

<script type="text/javascript">
/* 체크박스 전체선택, 전체해제 */
function checkAll(){
      if( $("#th_checkAll").is(':checked') ){
        $("input[name=checkRow]").prop("checked", true);
      }else{
        $("input[name=checkRow]").prop("checked", false);
      }
}

function turndown(){
// 반려하기 버튼 클릭
	
	// check값넣을 리스트
	
	// 질문
	var qList = []
	
	// 후기
	var rList = []
	
	// 장터
	var mList = []
	
	$("input[name='checkRow']:checked").each(function(){
		
		// 보드가 후기면 rList 에
		if( $(this).parent().siblings(".board").text() == '질문'){
			qList.push($(this).val());
		}else if($(this).parent().siblings(".board").text() == '후기' ){
			rList.push($(this).val());
		}else if($(this).parent().siblings(".board").text() == '장터' ){
			mList.push($(this).val());
		}
	})
	
	// 제출할 url  지정
	var url = "<%=request.getContextPath() %>/admin/blacklist/turndown";
	var allData = { "qList" : qList, "rList" : rList, "mList" : mList };
	
	// 비동기 처리
	$.ajax({
		type : "POST",
		url: url,
		data: allData,
		success : function(result) {
			
			if (result == 1) {
				
				$("#checkMessage").html("신고가 반려되었습니다<br><br><br>");
				$("#checkType").attr("class","modal-content panel-success");
				$("#checkModal").modal();
				
			}else{
				$("#checkMessage").html("1개 이상 선택해주십시오<br><br><br>");
				$("#checkType").attr("class","modal-content panel-warning");
				
			}
			$("#checkModal").modal();
			
		}
	
	});
}
function deleteReview(){
	// 삭제 버튼 클릭
	
	// check값넣을 리스트
		
	// 질문
	var qList = []
	
	// 후기
	var rList = []
	
	// 장터
	var mList = []
	
	$("input[name='checkRow']:checked").each(function(){
		
		if( $(this).parent().siblings(".board").text() == '질문'){
			qList.push($(this).val());
		}else if($(this).parent().siblings(".board").text() == '후기' ){
			rList.push($(this).val());
		}else if($(this).parent().siblings(".board").text() == '장터' ){
			mList.push($(this).val());
		}
	})
	// 제출할 url  지정
	var url = "<%=request.getContextPath() %>/admin/blacklist/deletereview";
	var allData = { "qList" : qList, "rList" : rList, "mList" : mList };
	
	// 비동기 처리
	$.ajax({
		type : "POST",
		url: url,
		data: allData,
		success : function(result) {
			
			if (result == 1) {
				
				$("#checkMessage").html("신고된 게시글이 삭제되었습니다.<br><br><br>");
				$("#checkType").attr("class","modal-content panel-success");
				$("#checkModal").modal();
				
			}else{
				$("#checkMessage").html("1개 이상 선택해주십시오<br><br><br>");
				$("#checkType").attr("class","modal-content panel-warning");
				
			}
			$("#checkModal").modal();
			
		}
	
	});
}

function reload(){
	location.reload();
}

// 체크박스 하나라도 체크 해제하면 전체 선택 박스 해제
$(document).ready(function(){
	
	$("input[name=checkRow]").change(function(){
		if( $(this).is(":checked") == false ){
			if( $("#th_checkAll").is(':checked') ){
				 $("#th_checkAll").prop("checked", false)
			}
		}		
	})
	
	
});
</script>
<style type="text/css">
main{
	height: 1000px;
}
.card {
	height: 100%;
    border: none;
    margin-bottom: 24px;
/*     -webkit-box-shadow: 0 0 13px 0 rgba(236,236,241,.44); */
/*     box-shadow: 0 0 13px 0 rgba(236,236,241,.44); */
}
.avatar-xs {
    height: 2.3rem;
    width: 2.3rem;
}
.card-btn{
	position:absolute;
    top:50%; left:50%;
    transform: translate(-50%, -50%);
    width: 100%
}
.card-size{
    width: 245px;
    height: 102px;
}

 #divbtn{ 
    padding: 10px; 
} 

#search-form{
	width: 500px;
	margin: 80px auto 30px;
}

#content{
	height: 700px;
	width: 1140px;
	margin: 0 auto;
}

.StateTurndown{
	font-size: 10px;
	border-radius: 2px;
	color: white;
	background-color: #aaa;
	font-weight: bold; 
	padding: 0 5px;
}
.StateReport{
	font-size: 10px;
	border-radius: 2px;
	color: white;
	background-color: #1E90FF;
	font-weight: bold; 
	padding: 0 5px;
}
.StateDelete{
	font-size: 10px;
	border-radius: 2px;
	color: white;
	background-color: #B90000;
	font-weight: bold; 
	padding: 0 5px;
}

.button-green{
	font-size: 15px;
	border-radius: 2px;
	color: white;
	background-color: #339900;
	font-weight: bold; 
	padding: 0 5px;
}

.button-red{
	font-size: 15px;
	border-radius: 2px;
	color: white;
	background-color: #CC0000;
	font-weight: bold; 
	padding: 0 5px;
	
}
</style>

            
<div id="title">신고 내역 
	<i class="fas fa-angle-right"></i>
	<a href="#">신고 내역 관리</a>
</div>

<main>
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
    
    <div id="content">
            <div class="row">
				<form id="search-form"
					action="${pageContext.request.contextPath}/admin/blacklist"
					method="get">
					<div class="col-lg-3 col-md-3 col-sm-12 p-0">
						<select class="form-control" name="category">
							<c:choose>
								<c:when test="${category eq '질문' }">
									<option  value="전체">전체</option>
									<option  value="질문" selected="selected">질문</option>
									<option  value="후기">후기</option>
									<option value="장터" >장터</option>
								</c:when>
								<c:when test="${category eq '후기' }">
									<option  value="전체">전체</option>
									<option  value="질문">질문</option>
									<option  value="후기" selected="selected">후기</option>
									<option value="장터" >장터</option>
								</c:when>
								<c:when test="${category eq '장터' }">
									<option value="전체">전체</option>
									<option  value="질문">질문</option>
									<option value="후기">후기</option>
									<option value="장터" selected="selected">장터</option>
								</c:when>
								<c:otherwise>
									<option value="전체" selected="selected">전체</option>
									<option  value="질문">질문</option>
									<option value="후기">후기</option>
									<option value="장터">장터</option>
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
				</form>
				</div>
				<br> <br>
                

		    <div class="row">
		        <div class="col-lg-12">
		            <div class="card">
		                <div class="card-body">
		                    <div class="table-responsive project-list">
		                    <div class="text-left">
		                    <span style="font-weight: bold">처리 전 신고 수 : ${blackCnt } 개</span>
		                   	<div id="footerbtn">
								<div id="divbtn">
									<button onclick="turndown();" type="button" class="btn button-green" id="returnBtn">반려</button>
									<button onclick="deleteReview();" type="button" class="btn button-red" id="deleteBtn">삭제</button>
								</div> 
		                    </div>
							</div>
		                    <form method="post" id="tableForm">
		                        <table class="table project-table table-centered table-nowrap table-hover">
		                            <thead>
		                                <tr style="background: #eee;">
		                                    <th  style="text-align: center" scope="col"><input type="checkbox" id="th_checkAll"  onclick="checkAll();" /></th>
		                                    <th  style="text-align: center" scope="col">#</th>
		                                    <th  style="text-align: center" scope="col">게시판</th>
		                                    <th  style="text-align: center" scope="col">신고글</th>
		                                    <th  style="text-align: center" scope="col">신고 사유</th>
		                                    <th  style="text-align: center" scope="col">신고 날짜</th>
		                                    <th  style="text-align: center" scope="col">신고인</th>
		                                    <th  style="text-align: center" scope="col">처리 상태</th>
		                                </tr>
		                            </thead>
		                            <tbody>
		                            <c:forEach items="${list }" var="i">
		                                <tr>
		                                    <th scope="row"  style="text-align: center">
		                                    	<c:if test="${i.BLACKLIST_STATE == '신고됨' }" >
				                                    <input type="checkbox" name="checkRow" value="${i.BLACKLIST_NO }"/>
		                                   		</c:if>
		                                    	<c:if test="${i.BLACKLIST_STATE == '반려됨' }" >
				                                    <input type="checkbox" disabled="disabled"/>
		                                   		</c:if>
		                                    	<c:if test="${i.BLACKLIST_STATE == '삭제됨' }" >
				                                    <input type="checkbox" disabled="disabled"/>
		                                   		</c:if>
		                                    </th >
		                                    <th style="text-align: center" scope="row">${i.NO }</th>
		                                    <td class="board">${i.BLACKLIST_BOARD }</td>
		                                    <td>
		                                    	<c:if test="${i.BLACKLIST_BOARD == '질문' }" >
		                                   		 	${i.REVIEW_CONTENT }
		                                   		 </c:if>
		                                    	<c:if test="${i.BLACKLIST_BOARD == '후기' }" >
		                                   		 	${i.REVIEW_CONTENT }
		                                   		 </c:if>
		                                    	<c:if test="${i.BLACKLIST_BOARD == '장터' }" >
		                                   		 	${i.MK_TITLE }
		                                   		 </c:if>
		                                    </td>
		                                    <td>${i.BLACKLIST_CONTENT }</td>
		                                    <td>${i.BLACKLIST_DATE }</td>
		                                    <td>${i.USER_ID }</td>
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
								<c:import url="/WEB-INF/paging/admin/blacklist/blacklistPaging.jsp" />
							</c:if>
		                </div>
		            </div>
		        </div>
		    </div>
		    <!-- end row -->
		</div>
<!--       </div> -->
</main>
                
<!-- 관리자 페이지 footer --> 
<c:import url="/WEB-INF/layout/admin/adminFooter.jsp"></c:import>

