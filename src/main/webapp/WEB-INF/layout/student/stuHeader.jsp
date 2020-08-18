<!-- 이인주 20200818 : 학생 마이페이지  header  -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>슬기로운 과외생활::학생 마이페이지</title>

<!-- jQuery 2.2.4.min -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 3.3.2 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- w3schools css 라이브러리 -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        
<style type="text/css">
#main{
    width: 960px;
    height: 80%;
    float: right;
/*    border: 1px solid green; */
/*    padding-right: 100px; */
}


* {
  margin: 0px;
  padding: 0px;
}

body {
/*   background: #e5e5e7; */
}

nav {
  font-family: Helvetica, Arial, "Lucida Grande", sans-serif;
  font-size: 13px;
  line-height: 1.5;
  margin:100px 0px; 
  margin-top:0px;
  
  width: 200px;
  -webkit-box-shadow: 2px 2px 5px rgba(0,0,0,0.2);
     -moz-box-shadow: 2px 2px 5px rgba(0,0,0,0.2);
          box-shadow: 2px 2px 5px rgba(0,0,0,0.2);
}

.menu-item {
  background: #fff;
  width: 200px; 
/*   height:100%; */
}

/*Menu Header Styles*/
.menu-item h4 {
  border-bottom: 1px solid rgba(0,0,0,0.3);
  border-top: 1px solid rgba(255,255,255,0.2);
  color: #fff;
  font-size: 15px;
  font-weight: 500;
  padding: 10px 0px;
  background: #17B794; 
  margin:0px;
  height:50px;
  text-align: center;

}

.menu-item h4:hover {  }

.menu-item h4 a {
  color: white;
  display: block;
  text-decoration: none;
  width: 200px;
}

/*ul Styles*/
.menu-item ul {
  background: #fff;
  font-size: 13px;
  line-height: 30px;
  height: 0px;
  list-style-type: none;
  overflow: hidden;
  padding: 0px;
  margin:0px;
  /*Animation*/
  -webkit-transition: height 1s ease;
     -moz-transition: height 1s ease;
       -o-transition: height 1s ease;
      -ms-transition: height 1s ease;
          transition: height 1s ease;
}

.menu-item:hover ul {
  height: 93px;
}

.menu-item ul a {
  margin-left: 20px;
  text-decoration: none;
  color: #aaa;
  display: block;
  width: 200px;
}

/*li Styles*/
.menu-item li {
  border-bottom: 1px solid #eee;
}

.menu-item li:hover {
  background: #eee;
}


/*First Item Styles*/
.alpha p {
   padding: 8px 12px;
   color: #aaa;
}

.alpha p a {
   color: #aaa;
   font-style: italic;
  
}

.alpha p a:hover {
   color: #ccc;
}

#sidenav{
	margin-top:100px;
	float : left;
   width:210px;
/*    background-color: #CCC;  */
   height: 500px;
   margin: 0px;
}

#profile{
    width:200px;
    background-color: #17B794; 
    height: 170px;
    border-radius: 10%;
    text-align: center;
    color: white;
    margin-bottom:10px;
}

#teaprofileimg{
/*    border: 1px solid red; */
   border-radius: 10%;
   width: 100px;
   height: 100px; 
}

#wrapper{
   width: 1200px;
   margin: 20px auto;
   position: relative;
/*    border: 1px solid #ccc; */
}

#mypageid{
   text-align: center;
   font-style: italic;
}

.anone{
	text-decoration: none;
	color: black;
}

.anone:hover{
	text-decoration: none;
	color: black;
}

</style>
</head>
<body>

<br>

<div id="wrapper"> <!-- 가운데 오게 하기  -->

<br>
<br>
<br>

<div id="sidenav">

<div id="profile">

<br>

<img alt="학생" src="${pageContext.request.contextPath}/resources/images/profile.png" id="teaprofileimg">

<h4>userId 님</h4>

</div>

      <nav>
          <div class="menu-item">
            <h4><a href="#">수강내역</a></h4>
            <ul>
              <li><a href="#">찜한 과외</a></li>
              <li><a href="#">수강중인 과외</a></li>
              <li><a href="#">수강한 과외</a></li>
            </ul>
          </div>
            
          <div class="menu-item">
            <h4><a href="#">게시판</a></h4>
            <ul>
              <li><a href="#">질문게시판</a></li>
              <li><a href="#">후기게시판</a></li>
              <li><a href="#">신고내역</a></li>
            </ul>
          </div>
            
          <div class="menu-item">
            <h4><a href="#">자료실</a></h4>
          </div>
      
      <div class="menu-item">
            <h4><a href="#">중고장터</a></h4>
            <ul>
              <li><a href="#">물건올리기</a></li>
              <li><a href="#">글 수정/삭제</a></li>
              <li><a href="#">신고내역</a></li>
            </ul>
          </div>

          <div class="menu-item">
            <h4><a href="#">개인정보수정</a></h4>
            <ul>
              <li><a href="#">개인정보 확인</a></li>
              <li><a href="#">개인정보 수정</a></li>
              <li><a href="#">회원탈퇴</a></li>
            </ul>
          </div>
          
      </nav>
      
</div>



<div id="main"> 

<a href="" class="anone"><h3 id="mypageid">Student Mypage</h3></a>