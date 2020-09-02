<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
     <div class="row">
        <div class="col-lg-12 marketCommTable">
            <div class="main-box no-header clearfix">
                <div class="main-box-body clearfix">
                    <div class="table-responsive">
                        <table class="table user-list">
                            <thead>
                                <tr>
                                <th class="text-center" style="width: 5%;"><span>No</span></th>
                                <th class="text-center"><span>댓글 내용</span></th>
                                <th class="text-center"><span>작성일</span></th>
                                <th style="width: 5%;">&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach items="${list2 }" var="m">
                                <tr>
                                    <td class="text-center"><span>${m.NO }</span></td>
                                    <td>
                                        <a href="#" class="commContent">${m.MK_COMM_CONTENT }</a>
                                    </td>
                                    <td  class="text-center">
                                        <span>
                                        <fmt:parseDate value="${m.MK_COMM_DATE }" pattern="yyyyMMdd" var="date"/>
                               		    <fmt:formatDate value="${date }" pattern="yyyy/MM/dd"/>
                                        
                                        </span>
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
                    </div>
                </div>
            </div>
        </div>
	</div>
        <div style="text-align: center;">
<%--    <c:if test="${not empty list}" > --%>
		<c:import url="/WEB-INF/paging/student/market/marketCommPaging.jsp" />
<%-- 	</c:if> --%>
		</div>