<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 관리자 페이지 header -->   
<c:import url="/WEB-INF/layout/admin/adminHeader.jsp"></c:import>



            <div id="layoutSidenav_content">
            
                
                <main>
                    <div id="content">
                    
                      <div class="lc-block col-md-4" id="l-login">
                          <div class="form-group">
                             <input type="text" class="form-control" placeholder="Username">
                          </div>
                          <div class="form-group">
                             <input type="password" class="form-control" placeholder="Password">
                          </div>
                          <div class="clearfix"></div>
                          <a href="#"
                             class="btn btn-block btn-primary btn-float m-t-25" style="color: white;">로그인</a>
                       </div>
                       	
                    </div>
                    
                </main>
                
                
<!-- 관리자 페이지 footer --> 
<c:import url="/WEB-INF/layout/admin/adminFooter.jsp"></c:import>
  