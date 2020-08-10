<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	/* welcome : contextPath  */
	/* location.href="/welcome/member/login.do" */
	
	/* 
		request.getContextPath()
		jsp가 제공해주는 request객체의
		getContextPath()메서드를 활용해 ContextPath를
		동적으로 지정
	*/
	location.href = "<%= request.getContextPath()%>/main";
	
	
</script>






</body>
</html>