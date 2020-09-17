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
                                    <td>${m.NO }</td>
                                    <td>
                                        <img src="<%= request.getContextPath() %>/resources/upload/${m.MK_THUMB_RENAME }" alt="메인 사진">
                                        <a href="${pageContext.request.contextPath }/board/market/detail?mkno=${m.MK_NO }" class="user-link">${m.MK_TITLE }</a>
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
