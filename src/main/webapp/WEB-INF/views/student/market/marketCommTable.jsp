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
                                <tr  class="tableHeader">
                                <th class="text-center" style="width: 5%;"><span>No</span></th>
                                <th class="text-center"><span>댓글 내용</span></th>
                                <th class="text-center"><span>작성일</span></th>
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
                                        <a href="${pageContext.request.contextPath }/board/market/detail?mkno=${m.MK_NO }" class="commContent">${m.MK_COMM_CONTENT }</a>
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