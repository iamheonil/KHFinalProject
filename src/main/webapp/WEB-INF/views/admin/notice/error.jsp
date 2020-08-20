<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function init() {
	<c:if test="${alertMsg != null}">
		alert("<c:out value="${alertMsg}"/>");
	</c:if>
	
	<c:if test="${back != null}">
		histroy.back();
	</c:if>

	<c:if test="${url != null}">
		location.href="<c:out value='${url}'/>"
	</c:if>
}

init();
</script>
</head>
<body>



</body>
</html>