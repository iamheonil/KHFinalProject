<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>
<c:import url="/WEB-INF/layout/teacher/teaHeader.jsp"></c:import>

<script type="text/javascript"> 
function alert(){
	var message = '${msg}'; 
	alert(message); 
}

</script>

<style>


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
</style>
             
<script>
var lessonLocDetail0 = new Array("-선택-","");
var lessonLocDetail1 = new Array("강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구");
var lessonLocDetail2 = new Array("헹글라이딩","패러글라이딩","스카이다이빙","스쿠버다이빙","수상스키","카누/카약","래프팅(급류타기)","하이킹","사냥","번지점프","캠핑","등산","승마","스키","스노우보드","연날리기","R/C","낚시","서바이벌게임","드라이브");
var lessonLocDetail3 = new Array("독서","영화/연극","사진","미술","악기연주","음악감상");
var lessonLocDetail4 = new Array("골프", "농구", "댄스", "무예", "배구", "수영", "스노우보드", "승마", "스쿼시", "스키", "야구", "에어로빅","조깅","족구","테니스","헬스","카누/카약","축구");
var lessonLocDetail5 = new Array("공예","사진","그림","문예","모형/프라모델","인형만들기");
var lessonLocDetail6 = new Array("바둑","장기","체스","오델로","오목","컴퓨터 게임","서바이벌게임","카드");
var lessonLocDetail7 = new Array("서예","수예/자수","꽃꽂이","요리","인형만들기","다도(차)","수족관","모형/프라모델","댄스","인터넷서핑");
var lessonLocDetail8 = new Array("애완동물","분재","유머","천체관측","댄스","마술","아마추어 무선","로켓","운세/심리","원예","R/C","쇼핑","단전호흡","요요","요가","헬스");

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
				'<option value=부산>부산</option>' +
				'<option value=대구>대구</option>' +
				'<option value=인천>인천</option>' +
				'<option value=대전>대전</option>' +
				'<option value=울산>울산</option>' +
				'<option value=광주>광주</option>' +
				'<option value=세종>세종</option>' +
				'<option value=경남>강원</option>' +
				'<option value=경북>경북</option>' +
				'<option value=전남>경남</option>' +
				'<option value=전북>충북</option>' +
				'<option value=광주>충남</option>' +
				'<option value=부산>전북</option>' +
				'<option value=제주>전남</option>' +
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
    <form name=signform class="form-horizontal" action="${pageContext.request.contextPath}/teacher/insertlesson" method="post">
        <div class="panel panel-default">
          <div class="panel-body text-center">
           <img src="https://bootdey.com/img/Content/avatar/avatar6.png" class="img-circle profile-avatar" alt="User avatar">
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
<!--               <textarea rows="3" class="form-control"></textarea> -->
              <input type="file" disabled="disabled">
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
				<option value=부산>부산</option>
				<option value=대구>대구</option>
				<option value=인천>인천</option>
				<option value=대전>대전</option>
				<option value=울산>울산</option>
				<option value=광주>광주</option>
				<option value=세종>세종</option>
				<option value=경남>강원</option>
				<option value=경북>경북</option>
				<option value=전남>경남</option>
				<option value=전북>충북</option>
				<option value=광주>충남</option>
				<option value=부산>전북</option>
				<option value=제주>전남</option>
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
              <input type="number" max="500" min="0" class="form-control" name="lessonPrice" required/>
            </div>
             만원
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
            <div class="col-sm-10 col-sm-offset-2">
              <button type="submit" class="btn btn-primary">Submit</button>
              <button type="reset" class="btn btn-default">Cancel</button>
            </div>
          </div>
      
    </form>
  </div>
</div>
</div>

<c:import url="/WEB-INF/layout/teacher/teaFooter.jsp"></c:import>
<c:import url="/WEB-INF/layout/teacher/teaFooter2.jsp"></c:import>