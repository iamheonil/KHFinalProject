<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>
<c:import url="/WEB-INF/layout/teacher/teaHeader.jsp"></c:import>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<script type="text/javascript"> 
function alert(){
	var message = '${msg}'; 
	alert(message); 
}

</script>

<style>
.menu-item#lessonM ul {
   height: 93px;  
}

#writeLessonM{
  background: #eee;
}


body{
    margin-top:20px;
    background:#f5f5f5;
}
/**
 * Panels
 */
/*** General styles ***/
.panel {
  box-shadow: none;
}
.panel-heading {
  border-bottom: 0;
}
.panel-title {
  font-size: 17px;
}
.panel-title > small {
  font-size: .75em;
  color: #999999;
}
.panel-body *:first-child {
  margin-top: 0;
}
.panel-footer {
  border-top: 0;
}

.panel-default > .panel-heading {
    color: #333333;
    background-color: transparent;
    border-color: rgba(0, 0, 0, 0.07);
}

form label {
    color: #999999;
    font-weight: 400;
}

.form-horizontal .form-group {
  margin-left: -15px;
  margin-right: -15px;
}
@media (min-width: 768px) {
  .form-horizontal .control-label {
    text-align: right;
    margin-bottom: 0;
    padding-top: 7px;
  }
}

.profile__contact-info-icon {
    float: left;
    font-size: 18px;
    color: #999999;
}
.profile__contact-info-body {
    overflow: hidden;
    padding-left: 20px;
    color: #999999;
}
.profile-avatar {
  width: 200px;
  position: relative;
  margin: 0px auto;
  margin-top: 196px;
  border: 4px solid #f3f3f3;
}
#stumax{
	width: 100px;
	display: inline-block;
}
#title{
	width: 100%;
	font-weight: bold;
}
#title a {
	color: #17B794; /* 청록색 */
}
.form-group #submitbutton{
	text-align: center;
	padding-left: 130px;
}
</style>
             
<script>
var lessonLocDetail0 = new Array("-선택-","");
var lessonLocDetail1 = new Array("강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구");
var lessonLocDetail2 = new Array("고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "여주시", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시", "포천시", "하남시", "화성시");//경기
var lessonLocDetail3 = new Array("중구","서구","동구","영도구","부산진구","동래구","남구","북구","강서구","해운대구","사하구","금정구","연제구","수영구","사상구","기장군");
var lessonLocDetail4 = new Array("중구","동구","서구","남구","수성구","달서구","달성군");//대구
var lessonLocDetail5 = new Array("중구", "동구", "미추홀구", "연수구", "남동구", "부평구", "계양구", "서구", "강화군", "옹진군");//인천
var lessonLocDetail6 = new Array("중구", "동구", "서구", "유성구", "대덕구");//대전
var lessonLocDetail7 = new Array("중구", "남구", "동구", "북구", "울주군");//울산
var lessonLocDetail8 = new Array("동구","서구","남구","북구","광산구"); //광주광역시
var lessonLocDetail9 = new Array("세종특별자치시"); //세종
var lessonLocDetail10 = new Array("강릉시","동해시","삼척시","양구군","양양군","원주시","인제군","칠원군","춘천시","평창군", "홍천군", "횡성군"); //강원
var lessonLocDetail11 = new Array("경산시","고령군","구미시","김천시","문경시","상주시","성주군","영덕군","영양군","영천시","예천군","울진군","의성군","청송군","칠곡군","포항시 남구","포항시 북구"); //경북
var lessonLocDetail12 = new Array("거제시", "고성군", "김해시", "밀양시", "사천시", "양산시", "의령군", "창년군", "창원시", "창원시 마산회원구", "창원시 성산구", "창원시 의창구", "창원시 진해구", "통영시", "함안군", "함양군"); //경남
var lessonLocDetail13 = new Array("괴산군", "보은군", "영동군", "음성군", "제천시", "진천군", "청원군", "청주시 상당구", "청주시 서원구", "청주시 흥덕구", "충주시"); //충북
var lessonLocDetail14 = new Array("계룡시", "금산군", "논산시", "보령시", "부여군", "서천군", "아산시", "예산군", "천안시", "천안시 서북구", "청양군", "홍성군"); //충남
var lessonLocDetail15 = new Array("고창군", "김제시", "남원시", "부안군", "순창군", "익산시", "임실군", "전주시", "전주시 덕진구", "진안군"); //전북
var lessonLocDetail16 = new Array("강진군", "목포시", "여수시", "순천시", "나주시", "광양시", "담양군", "곡성군", "구례군", "고흥군", "보성군", "화순군", "해남군", "무안군", "신안군", "진도군", "완도군", "장흥군"); //전남
var lessonLocDetail17 = new Array("애월읍", "조천읍", "한림읍", "구좌읍", "한경면", "추자면", "우도면", "건입동", "노형동", "도두동", "봉개동", "삼도1동", "삼도2동", "삼양동", "아라동", "연동", "아라동", "오라동", "외도동", "용담1동", "용담2동", "이도1동", "이도2동", "외도동", "이호동", "일도1동	", "일도2동	", "화북동"); //제주

function lessonLocDetailchange(item){
    var temp, i=0, j=0;
    var ccount, cselect;

    temp = document.signform.lessonLocDetail;

    for (i=(temp.options.length-1) ; i>0 ; i--){ temp.options[i] = null; }
    eval('ccount = lessonLocDetail' + item + '.length');
    for (j=0 ; j<ccount ; j++) {
        eval('cselect = lessonLocDetail' + item + '[' + j + '];');
        temp.options[j]= new Option(cselect,cselect);
    }
    temp.options[0].selected=true;
    return true;
}

function cancel(){
	
	var res = confirm('글 작성을 취소하시겠습니까?\n작성된 글은 저장되지 않습니다.');
	
	if(res){
		location.href='${pageContext.request.contextPath}/teacher/caution';
	}else {
        return false;
    }

}
</script>

 <script type="text/javascript">

function inputDisabled(){
    $('#stumax').attr("readonly", "readonly");
    $('#stumax').val('1');
}
function inputEnabled(){
    $('#stumax').removeAttr("readonly");
	$('#stumax').focus();
}
// $("#plus").click(function(){
function addlocation(){
	console.log('plus클릭')
	$("#addLocation").html(
            '<label class="col-sm-2 control-label">지역</label>' +
            '<div class="col-sm-10">' +
              '<select class="form-control" name="lessonLoc" onChange="javascript:lessonLocDetailchange(document.signform.lessonLoc.options.selectedIndex);" required>' +
				'<option selected value="">-선택-</option>' +
				'<option value=서울>서울</option>' +
				'<option value=경기>경기</option>' +
				'<option value=부산>부산</option>' +
				'<option value=대구>대구</option>' +
				'<option value=인천>인천</option>' +
				'<option value=대전>대전</option>' +
				'<option value=울산>울산</option>' +
				'<option value=광주>광주</option>' +
				'<option value=세종>세종</option>' +
				'<option value=강원>강원</option>' +
				'<option value=경북>경북</option>' +
				'<option value=경남>경남</option>' +
				'<option value=충북>충북</option>' +
				'<option value=충남>충남</option>' +
				'<option value=전북>전북</option>' +
				'<option value=전남>전남</option>' +
				'<option value=제주>제주</option>' +
              '</select>' +
            '<select class="form-control" name=lessonLocDetail size=1 style="margin-top: 10px;" required>' +
				'<option selected value="">-선택-</option>' +
				'<option value=""></option>' +
			'</select>' +
            '</div>' +
          '</div>' +
          '<div class="form-group">' +
            '<label class="col-sm-2 control-label">상세 위치</label>' +
            '<div class="col-sm-10">' +
              '<input type="text" name="dong" class="form-control" placeholder="ex) 봉천동" required>' +
            '</div>'
    )
}    
</script>        

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

<div class="container bootstrap snippets bootdeys" style="margin-left: 30px;">
<div id="title">과외
	<i class="glyphicon glyphicon-menu-right"></i>
	<a href="">과외 등록</a>
</div>
<div class="row">
  <div class="col-xs-12 col-sm-9">
    <form name=signform class="form-horizontal" action="${pageContext.request.contextPath}/teacher/insertlesson" method="post" enctype="multipart/form-data">
        <div class="panel panel-default">
          <div class="panel-body text-center">
<%--            <img src="<spring:url value='/upload/${TCH_FILE_RENAME }'/>" class="img-circle profile-avatar" alt="User avatar"/> --%>
	        <c:if test="${not empty file.tchFileRename }">
	        	<img class="img-circle profile-avatar" alt="teacherFile" src="<%= request.getContextPath() %>/resources/upload/${file.tchFileRename }">
			</c:if>
			<c:if test="${empty file.tchFileRename }">
				<img src="${pageContext.request.contextPath}/resources/images/profile.png"/>
			</c:if>

          </div>
        </div>
        
        
      <div class="panel panel-default">
        <div class="panel-heading">
        <h4 class="panel-title">Contact info</h4>
        </div>
        <div class="panel-body">
          <div class="form-group">
            <label class="col-sm-2 control-label">과외명</label>
            <div class="col-sm-10">
              <input type="tel" class="form-control" name="lessonTitle" required>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">인사말</label>
            <div class="col-sm-10">
              <textarea rows="4" class="form-control" name="lessonContent" required></textarea>
            </div>
          </div>
        </div>
      </div>
        
      <div class="panel panel-default">
        <div class="panel-heading">
        <h4 class="panel-title">선생님 정보</h4>
        </div>
        <div class="panel-body">
          <div class="form-group">
            <label class="col-sm-2 control-label">이름</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" readonly="readonly"  value="${userInfo.userName }" />
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">전화번호</label>
            <div class="col-sm-10">
              <input type="tel" class="form-control" readonly="readonly" value="${userInfo.userPhone }">
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">E-mail</label>
            <div class="col-sm-10">
              <input type="email" class="form-control" readonly="readonly" value="${userInfo.userEmail }">
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">이력서</label>
            <div class="col-sm-10">
<!--               <textarea rows="3" class="form-control" ></textarea> -->
              <input type="file" name="files" required="required">
            </div>
          </div>
        </div>
      </div>
      
      
        
      <div class="panel panel-default">
        <div class="panel-heading">
        <h4 class="panel-title">과외 정보</h4>
        </div>
        <div class="panel-body">
	      <div class="form-group">
	          <label class="col-sm-2 control-label">최대 인원</label>
	          <div class="col-sm-2">
	            <label><input type="radio" name="stunum" onclick="inputDisabled();" checked="checked"> 1:1</label>&ensp;
	            <label><input type="radio" name="stunum" onclick="inputEnabled();"> 1:다</label>
	          </div>
	            <input type="number" id="stumax" name="maxPeople" class="form-control" readonly="readonly" value="1"> 명
	      </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">지역</label>
            <div class="col-sm-10">
              <select class="form-control" name="lessonLoc" onChange="javascript:lessonLocDetailchange(document.signform.lessonLoc.options.selectedIndex);" required>
				<option selected value="">-선택-</option>
				<option value=서울>서울</option>
				<option value=경기>경기</option>
				<option value=부산>부산</option>
				<option value=대구>대구</option>
				<option value=인천>인천</option>
				<option value=대전>대전</option>
				<option value=울산>울산</option>
				<option value=광주>광주</option>
				<option value=세종>세종</option>
				<option value=강원>강원</option>
				<option value=경북>경북</option>
				<option value=경남>경남</option>
				<option value=충북>충북</option>
				<option value=충남>충남</option>
				<option value=전북>전북</option>
				<option value=전남>전남</option>
				<option value=제주>제주</option>
              </select>
            <select class="form-control" name=lessonLocDetail size=1 style="margin-top: 10px;" required>
				<option selected value="">-선택-</option>
				<option value=""></option>
			</select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">상세 위치</label>
            <div class="col-sm-10">
              <input type="text" name="dong" class="form-control" placeholder="ex) 봉천동" required>
            </div>
          </div>
          
<!-- x 클릭 시 부모태그 삭제됨 -->
<!--           <div id="selectloc"> -->
<!--           	<div> -->
<!--           	  <p></p> -->
<!-- 			  <span onclick="this.parentElement.style.display='none'" class="close">X</span>  -->
<!-- 			</div> -->
<!--           </div> -->


<!--           <div class="form-group"> -->
<!--             <label class="col-sm-2 control-label"></label> -->
<!--             <div class="col-sm-10"> -->
<!-- 	          	<p id="plus" onclick="addlocation();">+ 위치 추가</p> -->
<!--             </div> -->
<!--           </div> -->
          
<!--           <div class="form-group" id="addLocation"> -->

<!--           </div> -->
          
          <div class="form-group">
            <label class="col-sm-2 control-label">과목</label>
            <div class="col-sm-10">
            	<select class="form-control" name="lessonSubject" required>
					<option selected value="">-선택-</option>
					<option value=수학>수학</option>
					<option value=국어>국어</option>
					<option value=영어>영어</option>
					<option value=과학>과학</option>
					<option value=논술>논술</option>
					<option value=사회>사회</option>
					<option value=예체능>예체능</option>
					<option value=제2외국어>제2외국어</option>
					<option value=컴퓨터(IT)>컴퓨터(IT)</option>
					<option value=자격증>자격증</option>
					<option value=대학전공>대학전공</option>
					<option value=기타>기타</option>
            	</select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">과외비</label>
            <div class="col-sm-2">
              <input type="number" max="500" min="0" class="form-control" name="lessonPrice" required />
            </div>
             원
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">학생 연령대</label>
            <div class="col-sm-10">
            	<select class="form-control" name="lessonAge">
					<option selected value="">-선택-</option>
					<option value="10대">초등</option>
					<option value="10대">중등</option>
					<option value="10대">고등</option>
					<option value="20대">20대</option>
					<option value="30대">30대</option>
					<option value="30대">40대</option>
					<option value="30대">50대</option>
					<option value="30대">60대</option>
					<option value="30대">70대</option>
            	</select>
            </div>
          </div>
        </div>
      </div>
		
      
          <div class="form-group">
            <div id="submitbutton" class="col-sm-10 col-sm-offset-2" style="margin: 0 auto;">
              <button type="submit" class="btn" style="background: #17B794; color: white;" >등록</button>
              <button type="reset" class="btn" onclick="cancel();">취소</button>
            </div>
          </div>
      
    </form>
  </div>
</div>
</div>

<c:import url="/WEB-INF/layout/teacher/teaFooter.jsp"></c:import>
<c:import url="/WEB-INF/layout/teacher/teaFooter2.jsp"></c:import>