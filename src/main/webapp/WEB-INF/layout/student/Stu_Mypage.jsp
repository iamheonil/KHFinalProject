<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>슬기로운생활</title>

<style rel="stylesheet">
* {
  margin: 0px;
  padding: 0px;
}

body {
  background: #e5e5e7;
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
  padding: 7px 12px;
  
  
  background: #17B794; 

}

.menu-item h4:hover {  


}

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
}
#stumyimg{
	width:200px;
    background-color: #17B794; 
    height: 120px;
    border-radius: 10%;
    text-align: center;
    line-height: 110px;
}



</style>
</head>
<body>

<div id="sidenav">
<h4 id="stumyimg">userId 님</h4>

		<nav>
      
		    <div class="menu-item">
		      <h4><a href="#">수강내역</a></h4>
		      <ul>
		        <li><a href="#">영어</a></li>
		        <li><a href="#">수학</a></li>
		        <li><a href="#">일본어</a></li>
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
		      <h4><a href="#">개인정보수정</a></h4>
		      <ul>
		        <li><a href="#">개인정보 수정</a></li>
		        <li><a href="#">회원탈퇴</a></li>
		      </ul>
		    </div>
		    
		     <div class="menu-item">
		      <h4><a href="#">중고장터</a></h4>
		      <ul>
		        <li><a href="#">물건올리기</a></li>
		        <li><a href="#">글 수정/삭제</a></li>
		        <li><a href="#">신고내역</a></li>
		      </ul>
		    </div>
		</nav>
		
</div>

</body>
</html>
