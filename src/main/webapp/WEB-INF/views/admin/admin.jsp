<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 관리자 페이지 header -->   
<c:import url="/WEB-INF/layout/admin/adminbeforeHeader.jsp"></c:import>


<style type="text/css">

#content {
	
	width: 970px;
	margin: 0 auto;
	text-align: center;
}

#content input { width: 300px; }

#content img {

	width: 300px; 
	height: 300px;
	margin-bottom: 30px;
}

.buttonL { 
	background-color: #17B794; 
	border: none;
	color: white;
	text-align: center;
	text-decoration: none;
	display: inline-block;
    font-size: 16px;
    padding: 10px;
    border-radius: 5px;
    cursor: pointer;
    margin-right: 1px;
    width: 300px; 
}

.buttonL:hover { 
	background-color: #11d0a6; 

}

</style>




<div id="content">

	<div>
		<img alt="logo" src="${pageContext.request.contextPath}/resources/images/footer_logo.png">	
	</div>

	<form action="/ss/admin/loginImpl" method="POST">
	   <div class="" id="l-login">
	   
		<div class="form-group">
		   <input type="text" id="adminId" name="adminId" class="form-control" placeholder="Admin ID">
		</div>
		<div class="form-group">
			<input type="password" id="adminPw" name="adminPw" class="form-control" placeholder="Admin PW">
		</div>
		<div class="form-group">
			<button class="buttonL">관리자 로그인</button>
		</div>
	       
	    </div>
   	</form>
</div>

      
<div style="margin-bottom: 310px;"></div>
                
<!-- 관리자 페이지 footer --> 
<c:import url="/WEB-INF/layout/admin/adminFooter.jsp"></c:import>
  