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
    
    	<!-- 상단바 -->
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        	<!-- 로고 -->
            <a class="navbar-brand" href="#">슬기로운<span style="color: #17B794;"> 과외생활</span></a>
            <!-- 메뉴 여닫기 버튼 -->
            <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
            <!-- 로그아웃 -->
            <div class="navbar-nav">
				<a href="#">관리자 로그아웃</a>
            </div>
            
        </nav>
        
        
        <div id="layoutSidenav">
        
        	<!-- 사이드바 -->
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                        
                            <div class="sb-sidenav-menu-heading">과외</div>
                            <a class="nav-link" href="#">
                              	 과외 조회
                        		<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-right"></i></div>
                            </a>
                            <a class="nav-link" href="#">
                               	 과외 검토
                               	<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-right"></i></div>
                            </a>
                            
                            <div class="sb-sidenav-menu-heading">회원</div>
                            <a class="nav-link" href="#">
                              	 학생 관리
                        		<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-right"></i></div>
                            </a>
                            <a class="nav-link" href="#">
                               	선생님 관리
                               	<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-right"></i></div>
                            </a>
                            <a class="nav-link" href="#">
                               	선생님 회원가입 관리
                               	<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-right"></i></div>
                            </a>
                            
                            <div class="sb-sidenav-menu-heading">수익</div>
                            <a class="nav-link" href="#">
                              	 수익 관리
	                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-right"></i></div>
                            </a>
                           
                            <div class="sb-sidenav-menu-heading">게시판</div>
                            <a class="nav-link" href="<%=request.getContextPath()  %>/admin/notice/list">
                               	공지사항
                               	<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-right"></i></div>
                            </a>
                            <a class="nav-link" href="#">
                              	 질문 게시판
                        		<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-right"></i></div>
                            </a>
                            <a class="nav-link" href="#">
                               	후기 게시판
                               	<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-right"></i></div>
                            </a>
                            <a class="nav-link" href="${pageContext.request.contextPath}/admin/blacklist">
                               	신고 내역 관리
                               	<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-right"></i></div>
                            </a>
                            
                            <div class="sb-sidenav-menu-heading">중고장터</div>
                            <a class="nav-link" href="#">
                               	중고장터 조회/삭제
                               	<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-right"></i></div>
                            </a>
                            <a class="nav-link" href="#">
                               	신고 내역 관리
                               	<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-right"></i></div>
                            </a>
                            <a class="nav-link"></a> <!-- 사이드바 맨아래 공백 한칸 위해 추가함 -->
                        </div>
                    </div>
                </nav>
            </div>
            
            <div id="layoutSidenav_content">
            