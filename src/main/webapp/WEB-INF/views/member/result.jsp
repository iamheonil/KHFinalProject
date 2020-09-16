<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>&mdash; 슬기로운 과외생활</title>
</head>
<body>
<script type="text/javascript">

function init(){
	<c:if test="${alertMsg != null}">
		alert("<c:out value='${alertMsg}'/>")
	</c:if>

	<c:if test="${back != null}">
		history.back();
	</c:if>

	<c:if test="${url != null}">
		location.href="<c:out value='${url}'/>";
	</c:if>
}


init();



</script>

</body>
</html>