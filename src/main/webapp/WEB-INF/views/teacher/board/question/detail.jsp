<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>
<c:import url="/WEB-INF/layout/teacher/teaHeader.jsp"></c:import>













<div id="divbtn">
		<a href="${pageContext.request.contextPath}/teacher/question/list" class="anone"><button type="button" class="btn btn-default" id="listbtn">목록</button></a>
<button type="button" class="button button2" id="updatebtn">수정</button>
<button type="button" class="button button3" id="deletebtn">삭제</button>
	</div> 

<c:import url="/WEB-INF/layout/teacher/teaFooter.jsp"></c:import>
<c:import url="/WEB-INF/layout/teacher/teaFooter2.jsp"></c:import>