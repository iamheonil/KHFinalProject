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
function turndown(){
	$("#tableForm").prop("action", "/admin/blacklist/turndown");
	$("#tableForm").submit();
}
// function delete(){
	
	
// }
</script>
<style type="text/css">
#layoutSidenav_content{	
	background-color: #f3f3f3cc;
}
.card {
    border: none;
    margin-bottom: 24px;
    -webkit-box-shadow: 0 0 13px 0 rgba(236,236,241,.44);
    box-shadow: 0 0 13px 0 rgba(236,236,241,.44);
}
.userbtn{
    width: 245px;
    height: 102px;
    vertical-align: middle;
    position: relative;
}
.avatar-xs {
    height: 2.3rem;
    width: 2.3rem;
}
.card-btn{
	position:absolute;
    top:50%; left:50%;
    transform: translate(-50%, -50%);
}
</style>
            
<div id="title">후기 게시판 
	<i class="fas fa-angle-right"></i>
	<a href="#">신고 내역 관리</a>
</div>

<main>
    <div id="content">
                    

		<div class="container">
		    <div class="row">
		        <div class="col-xl-3 col-md-6">
		            <div class="card bg-pattern">
		                <div class="card-body">
		                    <div class="float-right">
		                        <i class="fa fa-archive text-primary h4 ml-3"></i>
		                    </div>
		                    <h5 class="font-size-20 mt-0 pt-1">24</h5>
		                    <p class="text-muted mb-0">신청된 신고</p>
		                </div>
		            </div>
		        </div>
		        
		        <div class="col-xl-3 col-md-6" id="returnBtn" onclick="turndown();">
		            <button class="card bg-pattern userbtn">
		            	<div class="card-btn">
		                    <span class="text-muted mb-0">반려하기</span>
	                        <i class="fa fa-file text-success h4 ml-3"></i>
                     	</div>
		            </button>
		        </div>
		        
		        <div class="col-xl-3 col-md-6" id="deleteBtn" onclick="delete();">
		            <button class="card bg-pattern userbtn">
		            	<div class="card-btn">
		                    <span class="text-muted mb-0">삭제하기</span>
	                        <i class="fas fa-trash-alt text-danger h4 ml-3"></i>
	                   </div>
		            </button>
		        </div>
		        
		        <div class="col-xl-3 col-md-6">
		            <div class="card">
		                <div class="card-body">
		                    <form>
		                        <div class="form-group mb-0">
		                            <label>Search</label>
		                            <div class="input-group mb-0">
		                                <input type="text" class="form-control" placeholder="Search..." aria-describedby="project-search-addon" />
		                                <div class="input-group-append">
		                                    <button class="btn btn-danger" type="button" id="project-search-addon"><i class="fa fa-search search-icon font-12"></i></button>
		                                </div>
		                            </div>
		                        </div>
		                    </form>
		                </div>
		            </div>
		        </div>
		    </div>
		    <!-- end row -->
		
		    <div class="row">
		        <div class="col-lg-12">
		            <div class="card">
		                <div class="card-body">
		                    <div class="table-responsive project-list">
		                    <form action="" method="post" id="tableForm">
		                        <table class="table project-table table-centered table-nowrap">
		                            <thead>
		                                <tr>
		                                    <th scope="col"><input type="checkbox" id="th_checkAll"  onclick="checkAll();" /></th>
		                                    <th scope="col">#</th>
		                                    <th scope="col">신고글</th>
		                                    <th scope="col">신고 사유</th>
		                                    <th scope="col">신고 날짜</th>
		                                    <th scope="col">신고인</th>
		                                    <th scope="col">처리 상태</th>
		                                </tr>
		                            </thead>
		                            <tbody>
		                            <c:forEach items="${list }" var="i">
		                                <tr>
		                                    <th scope="row"><input type="checkbox" name="checkRow" value="${i.BLACKLIST_NO }"/></th>
		                                    <th scope="row">${i.BLACKLIST_NO }</th>
		                                    <td>${i.REVIEW_CONTENT }</td>
		                                    <td>${i.BLACKLIST_CONTENT }</td>
		                                    <td>${i.BLACKLIST_DATE }</td>
		                                    <td>${i.USER_ID }</td>
		                                    <td>
		                                        <span class="text-success font-12"><i class="mdi mdi-checkbox-blank-circle mr-1"></i>${i.BLACKLIST_STATE }</span>
		                                    </td>
		                                </tr>
		                            </c:forEach>
		
		                            </tbody>
		                        </table>
		                        </form>
		                    </div>
		                    <!-- end project-list -->
		
		                    <div class="pt-3">
		                        <ul class="pagination justify-content-end mb-0">
		                            <li class="page-item disabled">
		                                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
		                            </li>
		                            <li class="page-item"><a class="page-link" href="#">1</a></li>
		                            <li class="page-item active"><a class="page-link" href="#">2</a></li>
		                            <li class="page-item"><a class="page-link" href="#">3</a></li>
		                            <li class="page-item">
		                                <a class="page-link" href="#">Next</a>
		                            </li>
		                        </ul>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		    <!-- end row -->
		</div>
      </div>
</main>
                
                
<!-- 관리자 페이지 footer --> 
<c:import url="/WEB-INF/layout/admin/adminFooter.jsp"></c:import>