<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!-- jQuery 2.2.4.min -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 3.3.2 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- w3schools css 라이브러리 -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


<style type="text/css">

 .row, table tr th { 
 	margin: 20px; 
 	text-align: center;	
 }

 #content { text-align: left; }
 
 
</style>


</head>
<body>


<div class="row">
    
    
	<table class="table table-bordered">
	
		<tr>
			<th class="info">번호</th>
			<td>${lessonDetail.LESSON_NO }</td>
			<th class="info">과외명</th>
			<td>${lessonDetail.LESSON_TITLE }</td>
		</tr>
		
		<tr>
			  <th class="info">작성자</th>
	          <td>${lessonDetail.USER_ID }</td>
	          <th class="info">작성일</th>
	          <td>${lessonDetail.LESSON_DATE }</td>
		</tr>
		
		<tr>
			<th class="info">지역</th>
	        <td>${lessonDetail.LESSON_LOC }</td>
	        <th class="info">과목</th>
	        <td>${lessonDetail.LESSON_SUBJECT }</td>
		</tr>
		
		<tr>
			<th class="info">대상</th>
	        <td>${lessonDetail.LESSON_AGE }</td>
	        <th class="info">금액</th>
	        <td>${lessonDetail.LESSON_PRICE }</td>
		</tr>
		
		<tr>
			<th class="info">내용</th>
			<td colspan="4" id="content">${lessonDetail.LESSON_CONTENT }</td>
		</tr>
		
		<tr>
		</tr>
	
	</table>
	
</div>
 





</body>
</html>