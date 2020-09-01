<!-- 이인주 20200818 : 학생 마이페이지 body test  -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!-- 메인 헤더 -->   
<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>

<!-- 학생 마이페이지 헤더 -->
<c:import url="/WEB-INF/layout/student/stuHeader.jsp"></c:import>

<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
<style type="text/css">
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


#marketTable{
	width: 90%;
	margin: 0 auto;
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
}

a {
    color: #3498db;
    outline: none!important;
}
.user-list tbody td>img {
    position: relative;
    max-width: 50px;
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
</style>




<div id="title">커뮤니티
	<i class="glyphicon glyphicon-menu-right"></i>
	<a href="">중고장터</a>
	<i class="glyphicon glyphicon-menu-right"></i>
	<a href="">내가 작성한 글</a>
</div>

<div id="marketContent">

<div id="marketTable">
    <div class="row">
        <div class="col-lg-12">
            <div class="main-box no-header clearfix">
                <div class="main-box-body clearfix">
                    <div class="table-responsive">
                        <table class="table user-list">
                            <thead>
                                <tr>
                                <th class="text-center" style="width: 5%;"><span>No</span></th>
                                <th class="text-center" style="width: 60%;"><span>글제목</span></th>
                                <th class="text-center"><span>판매 상태</span></th>
                                <th class="text-center"><span>작성일</span></th>
                                <th style="width: 5%;">&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach items="${list }" var="m">
                                <tr>
                                    <td>${m.NO }</td>
                                    <td>
                                        <img src="https://bootdey.com/img/Content/user_1.jpg" alt="">
                                        <a href="#" class="user-link">${m.MK_TITLE }</a>
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
                                    <td>
                                        <a href="#" class="table-link danger">
                                            <span class="fa-stack">
                                                <i class="fa fa-square fa-stack-2x"></i>
                                                <i class="fa fa-trash-o fa-stack-1x fa-inverse"></i>
                                            </span>
                                        </a>
                                    </td>
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        <div style="text-align: center;">
<%--                         	<c:if test="${not empty list}" > --%>
								<c:import url="/WEB-INF/paging/student/market/marketPaging.jsp" />
<%-- 							</c:if> --%>
						</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<hr>

<div id="title">커뮤니티
	<i class="glyphicon glyphicon-menu-right"></i>
	<a href="">중고장터</a>
	<i class="glyphicon glyphicon-menu-right"></i>
	<a href="">내가 작성한 댓글</a>
</div>

                


</div>
<!-- 학생 마이페이지 푸터 -->
<c:import url="/WEB-INF/layout/student/stuFooter.jsp"></c:import>
<c:import url="/WEB-INF/layout/student/stuFooter2.jsp"></c:import>
