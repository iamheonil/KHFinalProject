<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 관리자 페이지 header -->   

<c:import url="/WEB-INF/layout/admin/adminHeader.jsp"></c:import>
<script type="text/javascript">
/* 체크박스 전체선택, 전체해제 */
function checkAll(){
      if( $("#th_checkAll").is(':checked') ){
        $("input[name=checkRow]").prop("checked", true);
      }else{
        $("input[name=checkRow]").prop("checked", false);
      }
}

// 반려하기 버튼 클릭
function turndown(){
	
// 	console.log($("input[name=checkRow]"));
	
	$("#tableForm").attr("action", "<%=request.getContextPath() %>/admin/blacklist/turndown");
	$("#tableForm").submit();
}
function deleteReview(){
	$("#tableForm").attr("action", "<%=request.getContextPath() %>/admin/blacklist/deletereview");
	$("#tableForm").submit();
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
    float: left;
} 

#searchForm{
	float: right;
}

#searchForm input{
	width: 300px;
}
#content{
	height: 700px;
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

</style>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
            
<div id="title">후기 게시판 
	<i class="fas fa-angle-right"></i>
	<a href="#">신고 내역 관리</a>
</div>

<main>
    
    <div id="content">

<!-- 		<div class="container"> -->
	    <div class="row">
               <h3 class="text-right">신청된 신고 >> <span>${blackCnt }</span></h3>
	    </div>
	    <!-- end row -->
	            
	        <div id="footerbtn">
				<div id="divbtn">
					<button onclick="turndown();" type="button" class="btn btn-default" id="returnBtn">반려</button>
					<button onclick="deleteReview();" type="button" class="btn btn-default" id="deleteBtn">삭제</button>
				</div> 
				<div id="searchForm">
	                <form action="/ss/admin/blacklist" method="get">
	                       <div class="input-group mb-0">
	                           <input type="text" value="${search }" name="search" class="form-control" placeholder="Search..." aria-describedby="project-search-addon" />
	                           <div class="input-group-append">
	                               <button class="btn" type="submit" id="project-search-addon"><i class="fa fa-search search-icon font-12"></i></button>
	                           </div>
	                       </div>
	                </form>
                </div>
			</div>
			<div class="clearfix" ></div>
		    <div class="row">
		        <div class="col-lg-12">
		            <div class="card">
		                <div class="card-body">
		                    <div class="table-responsive project-list">
		                    <form method="post" id="tableForm">
		                        <table class="table project-table table-centered table-nowrap">
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
		                                        <span class="text-primary font-12"><i class="mdi mdi-checkbox-blank-circle mr-1"></i>${i.BLACKLIST_STATE }</span>
		                                   		</c:if>
		                                    	<c:if test="${i.BLACKLIST_STATE == '반려됨' }" >
		                                        <span class="text-success font-12"><i class="mdi mdi-checkbox-blank-circle mr-1"></i>${i.BLACKLIST_STATE }</span>
		                                   		</c:if>
		                                    	<c:if test="${i.BLACKLIST_STATE == '삭제됨' }" >
		                                        <span class="text-danger font-12"><i class="mdi mdi-checkbox-blank-circle mr-1"></i>${i.BLACKLIST_STATE }</span>
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

