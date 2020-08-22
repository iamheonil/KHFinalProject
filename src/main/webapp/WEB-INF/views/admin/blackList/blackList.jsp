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
	var list = []
	
	$("input[name='checkRow']:checked").each(function(){
		// 리스트에 값 넣어주기
		list.push($(this).val())
	})
	
	console.log(list)
	// 제출할 url  지정
	var url = "<%=request.getContextPath() %>/admin/blacklist/turndown";
	
	// 비동기 처리
	$.ajax({
		type : "POST",
		url: url,
		data: {list: list},
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
	var list = []
	
	$("input[name='checkRow']:checked").each(function(){
		// 리스트에 값 넣어주기
		list.push($(this).val())
	})
	
	console.log(list)
	// 제출할 url  지정
	var url = "<%=request.getContextPath() %>/admin/blacklist/deletereview";
	
	// 비동기 처리
	$.ajax({
		type : "POST",
		url: url,
		data: {list: list},
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
.card {
    border: none;
    margin-bottom: 24px;
    -webkit-box-shadow: 0 0 13px 0 rgba(236,236,241,.44);
    box-shadow: 0 0 13px 0 rgba(236,236,241,.44);
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

#searchForm{
	width: 500px;
	margin: 80px auto 50px;
}
#content{
	height: 700px;
	width: 1140px;
	margin: 0 auto;
}

#returnBtn{
	padding: 5px 0;
	width: 50px;
	heigth: 30px;
	text-align: center;
	font-size: 14px;
}

#deleteBtn{
	padding: 5px 0;
	width: 50px;
	heigth: 30px;
	text-align: center;
	font-size: 14px;
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

</style>

            
<div id="title">후기 게시판 
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
   			 <div id="searchForm">
	                <form action="/ss/admin/blacklist" method="get">
	                       <div class="input-group mb-0">
	                           <input type="text" value="${search }" name="search" class="form-control" placeholder="신고글" aria-describedby="project-search-addon" />
	                           <div class="input-group-append">
	                               <button class="btn" type="submit" id="project-search-addon"><i class="fa fa-search search-icon font-12"></i></button>
	                           </div>
	                       </div>
	                </form>
             </div>
                

		    <div class="row">
		        <div class="col-lg-12">
		            <div class="card">
		                <div class="card-body">
		                    <div class="table-responsive project-list">
		                    <div class="text-left">
		                    <span style="font-weight: bold">신청된 신고 : ${blackCnt } 개</span>
		                   	<div id="footerbtn">
								<div id="divbtn">
									<button onclick="turndown();" type="button" class="btn btn-success" id="returnBtn">반려</button>
									<button onclick="deleteReview();" type="button" class="btn btn-danger" id="deleteBtn">삭제</button>
								</div> 
		                    </div>
							</div>
		                    <form method="post" id="tableForm">
		                        <table class="table project-table table-centered table-nowrap table-hover">
		                            <thead>
		                                <tr>
		                                    <th  style="text-align: center" scope="col"><input type="checkbox" id="th_checkAll"  onclick="checkAll();" /></th>
		                                    <th  style="text-align: center" scope="col">#</th>
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
		                                    <td>${i.REVIEW_CONTENT }</td>
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

