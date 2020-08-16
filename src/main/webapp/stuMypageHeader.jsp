<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OneDayClass</title>
<!-- jQuery 2.2.4.min -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<!-- 부트스트랩 3.3.2 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- w3schools css 라이브러리 -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        
<!-- 사이드 메뉴바 -->
<style type="text/css">
body {
    margin:20px auto;
    padding: 0;
    font-family:sans-serif; 
}
ul#navi {
    width: 200px;
    text-indent: 10px;
    border: 1px solid #ccc;
}
ul#navi, ul#navi ul {
    margin:0;
    padding:0;
    list-style:none;
}
li.group {
    margin-bottom: 3px;
}
li.group div.title {
    height: 35px;
    line-height: 35px;
    background: thistle;
    cursor:pointer;
    font-weight: bold;
}
ul.sub li {
    margin-bottom: 2px;
    height:35px;
    line-height:35px;
    background:white;
    cursor:pointer;
}
ul.sub li a {
    display: block;
    width: 100%;
    height:100%;
    text-decoration:none;
    color:#000;
}
ul.sub li:hover {
    background:#ecdfec;
}
</style>

<style type="text/css">
#sidenav {
/* 	background-color: blue; */
 	width: 200px;
 	height: 100%;
 	float: left;

}

#main{
 	width: 960px;
 	height: 100%;
 	float: right;
/*  border: 1px solid green */
}

</style>


<style type="text/css">
.aTagStyleNone {
    text-decoration : none;
    color : black;
}

#wrapper{
   width: 1200px;
   margin: 20px auto;
   position: relative;

/*    border: 1px solid #ccc; */

}

#minilist{

list-style: none;
 font-weight: bold;
 white-space:nowrap;
 width:400px;
}
#minilist > li{
	float:left;
	color:gray;
	
}

#stumyimg{
 	background-color: blue; 
 	height: 120px;
 	border-radius: 10%;
 	text-align: center;
 	line-height: 110px;
}

/* 메뉴 항목 영역 */
#navi > li> ul{
	/* 수평으로 일렬로 배치하기 */
	float:left;
	padding:20px 0;
	line-height: 5px;
	
	border-right: 1px solid white;
	/*내용물이 <li>항목보다 크면 보이지 않도록 잘라내기  */
/* 	overflow:hidden; */
	/* 외부여백 링크클릭 안되는 영역, 다른 a와 구분되도록 만든다 */
	margin:0 1px;
	/* 자식요소의 기준위치로 설정하기 */
	position:relative;
	padding:10px 15px;
	z-index: 999;
}

#navi > li> ul{
	/*Html 계층구조에서 빼는 설정  */
	/* 부모요소인 li태그의 컨텐츠영역을 차지하지 않도록 만들기 */
	position:absolute;
	/* 서브메뉴의 위치 조절 */
	left:0;
	list-style-type: none;
	padding:0;
	width:200px;
	margin-left: 200px;
	top : 205px;
}
#navi > li >ul >li{
	background: white;
	/* 서브메뉴는 평소에 안보이도록 설정하기 */
	/* 방법1.display하지 않는다 */
/* 	display: none; */
	/* 방법2.내용물의 글자크기 높이를 모두0 으로 한다 */
 	line-height:0;
	height:0;
	font-size:0; 
	padding-left:10px;
}
#navi>li:hover>ul>li{
	/* 방법1에 대한 처리 */
	/* display:list-item; */
	/*방법 2에대한 처리  */
	line-height:40px;
	height: 40px;
	font-size: 14px;
	transition:height 1s;
}
/* 서브메뉴의 링크 텍스트 */
#navi>li>ul>li>a{
	background: white;
	color:gray;
	text-decoration:none;
	display:block;
/* 	margin:1px; */
}
#navi>li>ul>li>a:hover {
	color:gray;
	font-weight: bolder; 
	transition:color 1s,background-color 1s;
}

</style>
</head>
<body>

<div id="wrapper"> <!-- 가운데 오게 하기  -->
<a href="/student/mypage"><h3>마이 페이지</h3></a>
<hr>

<div id="sidenav">
<h4 id="stumyimg">userId 님</h4>
	
<ul id="navi">
        <li class="group">
            <div class="title">회원 관리</div>
            <ul class="sub">
                <li><a href="/admin/userlist">회원 정보</a></li>
            </ul>
        </li>
        <li class="group">
            <div class="title">사업자 관리</div>
            <ul class="sub">
                <li><a href="/admin/artlist">사업자 정보</a></li>
            </ul>
        </li>
        <li class="group">
            <div class="title">클래스 관리</div>
            <ul class="sub">              

                <li><a href="/admin/class/check" id="SnvClassCheck">클래스 검토</a></li>                
                <li><a href="/admin/class/post" id="SnvClassPost">클래스 정보</a></li>                
            </ul>
        </li>
        <li class="group">
            <div class="title">수익 관리</div>
            <ul class="sub">
                <li><a href="/admin/artsales/list">사업자 수익 관리</a></li>                
                <li><a href="/admin/adminsales/list">관리자 수익 관리</a></li>    
            </ul>
        </li>   
        <li class="group">
            <div class="title">기부 관리</div>
            <ul class="sub">
                <li><a href="/admin/talent">재능기부 클래스</a></li>                
                <li><a href="/admin/donation">작가 후원 내역</a></li>    
            </ul>
        </li> 
        <li class="group">
            <div class="title">게시판 관리</div>
            <ul class="sub">
                <li id="SnvNotice"><a href="/admin/noticelist" >공지사항 관리</a></li>                
                <li><a href="/admin/reviewlist">후기게시판 관리</a></li>    
            </ul>
        </li> 
    </ul>
</div>


<div id="main">