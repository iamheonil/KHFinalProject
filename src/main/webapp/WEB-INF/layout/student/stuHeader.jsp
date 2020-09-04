<!-- 이인주 20200818 : 선생님 마이페이지  header  -->

<%@page import="com.privateplaylist.www.member.vo.Member"%>
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

<!-- 	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
<!-- 	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script> -->
<!-- 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script> -->

<!-- 	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" /> -->
        
<style type="text/css">
#main{
    width: 960px;
    height: 90%;
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
}



/*Menu Header Styles*/
.menu-item h4 {
  border-bottom: 1px solid rgba(0,0,0,0.3);
  border-top: 1px solid rgba(255,255,255,0.2);
  color: #fff;
  font-size: 15px;
  font-weight: 500;
  background: #17B794; 
  height:50px;
  text-align: center;
  margin:0px;
  padding : 15px 0px; 

}

.menu-item h4:hover {  }

.menu-item h4 a {
  color: white;
  display: block;
  text-decoration: none;
  width: 200px;
}

/*ul Styles*/
.menu-item#four ul {
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

.menu-item#three ul {
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
.menu-item.two ul {
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

.menu-item#four:hover ul {
   height: 124px; 
}

.menu-item#three:hover ul {
   height: 93px; 
}
.menu-item.two:hover ul {
   height: 62px; 
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
   height: 600px;
   margin: 0px;
}

#profile{
    width:200px;
    background-color: #17B794; 
    height: 170px;
    border-radius: 6%;
    text-align: center;
    color: white;
    margin-bottom:10px;
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
   font-weight: bold;
   color: #565656;
    width: 960px;
    height: 90%;
    float: right;
}

#teaprofileimg{
/*    border: 1px solid red; */
   border-radius: 50%;
   width: 100px;
   height: 100px; 
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
<%
 String userID="test06";
if(session.getAttribute("loginUser") !=null){
	userID=((Member)session.getAttribute("loginUser")).getUserId();//사용자의 정보가져오기
	
}
String toID=null;
if(request.getAttribute("toID") !=null){
	toID=(String)request.getAttribute("toID");//채팅하는 대상의 정보 가져오기
}

if(userID==null){
	
	String url=request.getContextPath()+"/member/login";
	session.setAttribute("messageContent", "로그인이 되어있지 않습니다");
	session.setAttribute("messageType", "오류메시지");
	/* response.sendRedirect(url); */
}
%>




<!-- 로그아웃이 되면 로그인 페이지로 이동시킴  -->

<%
	String messageContent = null;
	if (session.getAttribute("messageContent") != null) {
		messageContent = (String) session.getAttribute("messageContent");
	}
	String messageType = null;
	if (session.getAttribute("messageType") != null) {
		messageType = (String) session.getAttribute("messageType");
	}
	if (messageContent != null) {
%>

<script type="text/javascript">
	/* $("#messageModal").modal("show"); */
	alert("로그인이 되어있지 않습니다")
	window.location.href = "${pageContext.request.contextPath}/member/login";
</script>
<%
	session.removeAttribute("messageContent");
		session.removeAttribute("messageType");
	}
%>


<script type="text/javascript">
//안읽은 메시지 데이터 가져오기
function getUnread(){
	
	var userID='<%=userID%>';
	
	$.ajax({
		type:"POST",
		url:"${pageContext.request.contextPath}/chat/unread",
		data:{
			userID:encodeURIComponent(userID)
		},
		success:function(data){
			
			$("#chkUnread").html(data);
		}
	});
	
}

//3초마다 안읽은 데이터가 있는지 확인
function getInfiniteBox(){
	setInterval(function(){
		getUnread();
	},3000);
}

</script>
<body>

<br>

<div id="wrapper"> <!-- 가운데 오게 하기  -->

<br>
<br>
<br>
<br>

<a href="" class="anone"><h2 id="mypageid">Student Page</h2></a>

<br>
<br>

<div id="sidenav">

<div id="profile">

<br>

<img alt="학생프로필사진" src="${pageContext.request.contextPath}/resources/images/profile.png" id="teaprofileimg">

<h4>${loginUser.userId } 님</h4>

</div>





      <nav>
          <div class="menu-item" id="four">
            <h4><a href="#">과외</a></h4>
            <ul>
              <li id="studentWL"><a href="${pageContext.request.contextPath}/student/wishlist">찜한 과외</a></li>
              <li><a href="#">과외 신청 내역</a></li>
              <li><a href="${pageContext.request.contextPath}/student/connectedlesson">수강 중인 과외 </a></li>
              <li><a href="#">수강 완료 과외</a></li>
            </ul>
          </div>
          
           <div class="menu-item">
            <h4><a href="${pageContext.request.contextPath}/student/findStu/list">학생 찾기</a></h4>
          </div>
          
          <div class="menu-item">
            <h4><a href="${pageContext.request.contextPath}/student/chat">1:1 문의<span class="label label-info" id="chkUnread"></span></a></h4>
          </div>
          
          <div class="menu-item" id="three">
            <h4><a href="#">커뮤니티</a></h4>
	            <ul>
	             <li><a href="#">질문 게시판</a></li>
	             <li><a href="#">후기 게시판</a></li>
	             <li id="studentMK"><a href="${pageContext.request.contextPath}/student/market">중고장터</a></li>
	            </ul>
          </div>

           <div class="menu-item">
            <h4><a href="${pageContext.request.contextPath }/student/blacklist">신고 내역</a></h4>
          </div>

          <div class="menu-item">
            <h4><a href="${pageContext.request.contextPath}/student/profile/chkpassword">회원정보 수정</a></h4>
          </div>
          
          
          
      </nav>
      
</div>


<script type="text/javascript">
 $(document).ready(function(){
	
	getUnread();
	
}) 
</script>

<div id="main"> 
