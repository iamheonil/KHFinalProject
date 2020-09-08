<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <div class="row">
        <div class="col-lg-12 marketTable">
            <div class="main-box no-header clearfix">
                <div class="main-box-body clearfix">
                    <div class="table-responsive">
                        <table class="table user-list">
                            <thead>
                                <tr  class="tableHeader">
                                <th class="text-center" style="width: 5%;"><span>No</span></th>
                                <th class="text-center" style="width: 55%;"><span>글제목</span></th>
                                <th class="text-center"  style="width: 15%;"><span>가격</span></th>
                                <th class="text-center"  style="width: 10%;"><span>판매 상태</span></th>
                                <th class="text-center"  style="width: 10%;"><span>작성일</span></th>
                                <th style="width: 5%;">&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach items="${list1 }" var="m">
                                <tr>
                                    <td>${m.NO }</td>
                                    <td>
                                        <img src="https://bootdey.com/img/Content/user_1.jpg" alt="">
                                        <a href="#" class="user-link">${m.MK_TITLE }</a>
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
<%--<c:if test="${not empty list}" > --%>
	<c:import url="/WEB-INF/paging/student/market/marketPaging.jsp" />
<%-- </c:if> --%>
	</div>
