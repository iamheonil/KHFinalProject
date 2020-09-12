<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<!-- jQuery 2.2.4.min -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
	
	<!-- 부트스트랩 3.3.2 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	
	<!-- w3schools css 라이브러리 -->
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />	
        <title>슬기로운 과외생활::관리자페이지</title>
        <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    
    <body class="sb-nav-fixed">
    	<br><br><br>
    	<div style="margin-top: 150px;"></div>
    	<!-- 상단바 -->
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        	<!-- 로고 -->
            <a class="navbar-brand" href="#">슬기로운<span style="color: #17B794;"> 과외생활</span></a>
            <!-- 로그인 -->
            <div class="navbar-nav">
				<a href="/ss/admin/login">관리자 로그인</a>
            </div>
            
        </nav>