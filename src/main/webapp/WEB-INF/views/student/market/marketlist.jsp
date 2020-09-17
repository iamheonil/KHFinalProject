<!-- 이인주 20200818 : 학생 마이페이지 body test  -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 메인 헤더 -->   
<%@ include file="/WEB-INF/layout/main/header.jsp" %>

<!-- 학생 마이페이지 헤더 -->
<c:import url="/WEB-INF/layout/student/stuHeader.jsp"></c:import>

<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
<style type="text/css">
.menu-item#three ul {
   height: 93px; 
}

#studentMK{
  background: #eee;
}

#title{
	width: 100%;
	font-weight: bold;
}

#title a {
	color: #17B794; /* 청록색 */
}

#marketContent{
	width: 97%;
	margin: 0 auto;
}

#marketBoard{
	width: 90%;
	margin: 0 auto;
}

#marketComm{
	width: 90%;
	margin: 0 auto;
}
.marketTable{
/* 	height: 360px; */
}

.marketCommTable{
/* 	height: 260px; */
}

.main-box.no-header {
    padding-top: 20px;
}
.main-box {
    background: #FFFFFF;
/*     -webkit-box-shadow: 1px 1px 2px 0 #CCCCCC; */
/*     -moz-box-shadow: 1px 1px 2px 0 #CCCCCC; */
/*     -o-box-shadow: 1px 1px 2px 0 #CCCCCC; */
/*     -ms-box-shadow: 1px 1px 2px 0 #CCCCCC; */
/*     box-shadow: 1px 1px 2px 0 #CCCCCC; */
    margin-bottom: 16px;
    -webikt-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
}
.table a.table-link.danger {
    color: #e74c3c;
}
.label {
    border-radius: 3px;
    font-size: 0.875em;
    font-weight: 600;
}
.user-list tbody td .user-subhead {
    font-size: 0.875em;
    font-style: italic;
}
.user-list tbody td .user-link {
    display: block;
    font-size: 1.25em;
    margin-left: 60px;
    margin-top: 12.5px;
    widht: 350px;
	overflow: hidden;
  	text-overflow: ellipsis;
  	white-space: nowrap;
  	 display: block;
}

a {
    color: #3498db;
    outline: none!important;
}
.user-list tbody td>img {
    position: relative;
    max-width: 50px;
    max-height: 50px;
    float: left;
    margin-right: 15px;
}

.table thead tr th {
    text-transform: uppercase;
    font-size: 0.875em;
}
.table thead tr th {
    border-bottom: 2px solid #e7ebee;
}
.table tbody tr td:first-child {
    font-size: 1.125em;
    font-weight: 300;
}
.table tbody tr td {
    font-size: 0.875em;
    vertical-align: middle;
    border-top: 1px solid #e7ebee;
    padding: 4px 8px;
}

.commContent{
	width: 500px;
	overflow: hidden;
  	text-overflow: ellipsis;
  	white-space: nowrap;
  	 display: inline-block;
}

.tableHeader{
	background: #eee;
}
</style>
<script type="text/javascript">
function marketPaging(curPage){
	
	var url = "<%=request.getContextPath() %>/student/marketpage";
	// 비동기 처리
	$.ajax({
		type : "POST",
		url: url,
		data: {curPage : curPage},
		success : function(result) {
// 			console.log(result);
			$("#marketBoard").html(result);
		},
		error : function(){
			alert("ajax 실패")
		}
	});
	
}

function marketCommPaging(curPage){
	
	var url = "<%=request.getContextPath() %>/student/marketcommpage";
	// 비동기 처리
	$.ajax({
		type : "POST",
		url: url,
		data: {curPage : curPage},
		success : function(result) {
// 			console.log(result);
			$("#marketComm").html(result);
			$("#marketCommTable").focus();
		},
		error : function(){
			alert("ajax 실패")
		}
	});
	
}
</script>

<div id="title">커뮤니티
	<i class="glyphicon glyphicon-menu-right"></i>
	<a href="javascript:void(0);">중고장터</a>
	<i class="glyphicon glyphicon-menu-right"></i>
	<a href="javascript:void(0);">내가 작성한 글</a>
</div>

<div id="marketContent">
<div id="marketBoard">
    <div class="row">
        <div class="col-lg-12 marketTable">
            <div class="main-box no-header clearfix">
                <div class="main-box-body clearfix">
                    <div class="table-responsive">
                        <table class="table user-list">
                            <thead>
                                <tr class="tableHeader">
                                <th class="text-center" style="width: 5%;"><span>No</span></th>
                                <th class="text-center" style="width: 60%;"><span>글제목</span></th>
                                <th class="text-center"  style="width: 15%;"><span>가격</span></th>
                                <th class="text-center"  style="width: 10%;"><span>판매 상태</span></th>
                                <th class="text-center"  style="width: 10%;"><span>작성일</span></th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:if test="${empty list1 }" >
                            		<tr>
                            			<td class="text-center" colspan="5">작성한 글이 없습니다.</td>
                            		</tr>
                                </c:if>
                            	<c:forEach items="${list1 }" var="m">
                                <tr>
                                    <td class="text-center"><span>${m.NO }</span></td>
                                    <td>
                                        <img src="<%= request.getContextPath() %>/resources/upload/${m.MK_THUMB_RENAME }" alt="메인 사진">
                                        <a href="<%= request.getContextPath() %>/board/market/detail?mkno=${m.MK_NO }" class="user-link">${m.MK_TITLE }</a>
                                    </td>
                                    <td  class="text-center">
                                        <span>
                                        <fmt:formatNumber type="currency" currencyCode="KRW" value="${m.MK_PRICE }"/>
                                        </span>
                                    </td>
                                    <td class="text-center">
                                    <c:if test="${m.MK_STATE eq 0 }">
                                        <span class="label label-success">판매중</span>
                                    </c:if>
                                    <c:if test="${m.MK_STATE eq 1 }">
                                        <span class="label label-default">판매완료</span>
                                    </c:if>
                                    </td>
                                    <td  class="text-center">
                                        <span>${m.MK_DATE }</span>
                                    </td>
                                </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
	</div>
<c:if test="${!empty list1 }" >
        <div style="text-align: center;">
<%--    <c:if test="${not empty list}" > --%>
		<c:import url="/WEB-INF/paging/student/market/marketPaging.jsp" />
<%-- 	</c:if> --%>
		</div>
</c:if>
</div>
<br>
<hr>

<div id="title">커뮤니티
	<i class="glyphicon glyphicon-menu-right"></i>
	<a href="javascript:void(0);">중고장터</a>
	<i class="glyphicon glyphicon-menu-right"></i>
	<a href="javascript:void(0);">내가 작성한 댓글</a>
</div>

<div id="marketComm">
    <div class="row">
        <div class="col-lg-12 marketCommTable">
            <div class="main-box no-header clearfix">
                <div class="main-box-body clearfix">
                    <div class="table-responsive">
                        <table class="table user-list">
                            <thead>
                                <tr class="tableHeader">
	                                <th class="text-center" style="width: 5%;"><span>No</span></th>
	                                <th class="text-center"><span>댓글 내용</span></th>
	                                <th class="text-center"  style="width: 10%;"><span>작성일</span></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${empty list2 }" >
                            		<tr>
                            			<td colspan="3" class="text-center">작성한 댓글이 없습니다.</td>
                            		</tr>
                                </c:if>
                            	<c:forEach items="${list2 }" var="m">
                                <tr>
                                    <td class="text-center"><span>${m.NO }</span></td>
                                    <td>
                                        <a href="${pageContext.request.contextPath }/board/market/detail?mkno=${m.MK_NO }"  class="commContent">${m.MK_COMM_CONTENT }</a>
                                    </td>
                                    <td  class="text-center">
                                        <span>${m.MK_COMM_DATE }</span>
                                    </td>
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
	</div>
<c:if test="${!empty list2 }" >
        <div style="text-align: center;">
<%--    <c:if test="${not empty list}" > --%>
		<c:import url="/WEB-INF/paging/student/market/marketCommPaging.jsp" />
<%-- 	</c:if> --%>
		</div>

</c:if>
</div>
                


</div>
<!-- 학생 마이페이지 푸터 -->
<c:import url="/WEB-INF/layout/student/stuFooter.jsp"></c:import>
<c:import url="/WEB-INF/layout/student/stuFooter2.jsp"></c:import>
