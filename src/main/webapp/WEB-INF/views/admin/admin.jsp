<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 관리자 페이지 header -->   
<c:import url="/WEB-INF/layout/admin/adminbeforeHeader.jsp"></c:import>


            <div id="layoutSidenav_content">
                <main>
                    <div id="content">
                    	<form action="/ss/admin/loginImpl" method="POST">
	                      <div class="lc-block col-md-4" id="l-login">
	                          <div class="form-group">
	                             <input type="text" id="adminId" name="adminId" class="form-control" placeholder="Username">
	                          </div>
	                          <div class="form-group">
	                             <input type="password" id="adminPw" name="adminPw" class="form-control" placeholder="Password">
	                          </div>
	                          <div class="clearfix"></div>
	                          <button class="btn btn-block btn-primary btn-float m-t-25" style="color: white;">로그인</button>
	                       </div>
                       	</form>
                    </div>
                    
                </main>
                
          <div style="margin-bottom: 310px;"></div>
                
<!-- 관리자 페이지 footer --> 
<c:import url="/WEB-INF/layout/admin/adminFooter.jsp"></c:import>
  