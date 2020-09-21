<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지::학생찾기 상세보기</title>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!-- jQuery 2.2.4.min -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 3.3.2 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- w3schools css 라이브러리 -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


<script type="text/javascript">

function findStuDelete(FIND_STU_NO){                   

	var no = FIND_STU_NO; 
	
	alert('삭제하시겠습니까?')
	
	$(location).attr("href", "${pageContext.request.contextPath}/admin/lesson/findstudent/delete?no="+no);
	
	close();
	opener.parent.location.reload();
	
}

</script>



<style type="text/css">

 .row, table tr th { 
 	margin: 20px; 
 	text-align: center;	
}

.table > tbody > tr> th.info { vertical-align: middle; }

.table>tbody>tr>td { 
	line-height: 2.42857143; 
	text-align: left;
}

 #content { text-align: left; }
 
 .table caption {
	
	font-size: 20px;
	font-weight: bold;
	text-align: center;
	margin-bottom: 5px;
}
 
.buttonD { /* 삭제버튼 */
		background-color: #777777;
	    border: none;
	    color: white;
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    font-size: 18px;
	    border-radius: 4px;
	    cursor: pointer;
	    padding: 5px;
	    width: 70px;
	    margin-top: 20px;
}

.buttonD:hover { background-color: #888888; }

</style>


</head>
<body>


<div class="row">
    
    
	<table class="table table-bordered">
		<caption>학생 찾기 상세</caption>
	
		<tr>
			<th class="info" style="width: 25%">번호</th>
			<td style="width: 25%">${findStu.FIND_STU_NO}</td>
			<th class="info" style="width: 25%">작성일</th>
			<td style="width: 25%">${findStu.FIND_STU_DATE}</td>
		</tr>
		
		<tr>
			  <th class="info" style="width: 25%">지역</th>
	          <td style="width: 25%">${findStu.FIND_STU_LOC}</td>
	          <th class="info" style="width: 25%">과목</th>
	          <td style="width: 25%">${findStu.FIND_STU_SUBJECT}</td>
		</tr>
		
		<tr>
			<th class="info">제목</th>
			<td colspan="4" id="content">${findStu.FIND_STU_TITLE}</td>
		</tr>
		
		<tr>
			<th class="info">내용</th>
			<td colspan="4" id="content">${findStu.FIND_STU_CONTENT}</td>
		</tr>

	</table>
	
	<button onclick="findStuDelete(${findStu.FIND_STU_NO})" class="buttonD">삭제</button>
	
</div>
 





</body>
</html>