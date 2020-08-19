<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 2020.08.19 김헌일 수정 + 헤더 푸터 Import 작업-->

<jsp:include page="${pageContext.request.contextPath}/WEB-INF/layout/main/header.jsp"></jsp:include>

<style type="text/css">
 .displaynone {display: none !important;}
body.eMobilePopup{overflow:hidden;position:fixed;}
.ec-base-label{display:inline-block;margin-right:5px;}
.ec-base-label img{vertical-align:middle;}
.gridContainer .gridItem {min-width:0;}
.xans-member-findid{border:1px solid #d7d5d5;padding:30px 0;color:#2e2e2e;width:770px;margin:120px auto;}.xans-member-findid .findId{width:340px;margin:0 auto;}.xans-member-findid .findId h3{margin:0 0 30px 0;font-size:20px;text-align:center;font-family:Noto Sans KR,sans-serif;font-size:14px;}.xans-member-findid .findId p{margin:7px 0 0;}.xans-member-findid .findId strong{display:inline-block;margin:0 0 5px;padding:0 0 0 10px;width:140px;font-weight:normal;background:url("http://img.echosting.cafe24.com/skin/base/common/ico_arrow.png") no-repeat 0 4px;}.xans-member-findid .findId .check{margin-bottom:30px;margin-left:155px;color:#353535;}.xans-member-findid .findId .member select{width:177px;}.xans-member-findid .findId .ipin,.xans-member-findid .findId .mobileauth{position:relative;margin:10px 0 0 0;}.xans-member-findid .findId .ipin strong,.xans-member-findid .findId .mobileauth strong{width:120px;}.xans-member-findid .findId .ipin span,.xans-member-findid .findId .mobileauth span{display:block;margin:0 0 5px;padding:0 0 0 10px;color:#757575;}.xans-member-findid .findId .ipin a,.xans-member-findid .findId .mobileauth a{position:absolute;bottom:0;right:0;}.xans-member-findid .findId #name,.xans-member-findid .findId #email{width:172px;}
.xans-member-findid .findId #ssn1,.xans-member-findid .findId #ssn2{width:75px;}
.xans-member-findid .findId #mobile1{width:36px;}
.xans-member-findid .findId #mobile2,.xans-member-findid .findId #mobile3{width:45px;}html,body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,code,form,fieldset,legend,input,textarea,p,blockquote,th,td,img{margin:0;padding:0;}html{width:100%;height:100%;}body,code{font:12px Poppins,Lato,arial,Nanum Gothic,AppleGothic,sans-serif;font-weight:normal;color:#666;background:#fff;}body{min-width:1280px;}body#popup{min-width:0;}li{list-style:none;}img,fieldset{border:none;vertical-align:top;}table{width:100%;border:0;border-spacing:0;border-collapse:collapse;}caption{display:none;}th,td{border:0;vertical-align:top;}input,select,textarea{font-size:100%;color:#353535;vertical-align:middle;font-family:"돋움",Dotum;}input[type=radio],input[type=checkbox]{width:13px;height:13px;border:0;}input[type=text],input[type=password]{height:18px;line-height:20px;padding:2px 4px;border:1px solid #d5d5d5;color:#353535;font-size:12px;}input[type=radio] + label,input[type=checkbox] + label{margin:0 4px 0 2px;}select{height:24px;border:1px solid #d5d5d5;}textarea{padding:5px 6px;border:1px solid #d5d5d5;line-height:1.5;}legend{visibility:hidden;position:absolute;left:-9999px;top:-9999px;width:0;height:0;line-height:0;}button{overflow:visible;padding:0;margin:0;border:0;cursor:pointer;}hr.layout{display:none;}a{text-decoration:none;color:#000;}a:hover{text-decoration:underline;}a:active{text-decoration:none;}.objHidden{visibility:hidden;position:absolute;left:-1000px;top:-1000px;height:0;width:0;}table tr.radioType input,span.noBorder input{border:none !important;width:auto !important;height:auto !important;margin:0 3px 0 0 !important;vertical-align:middle !important;background:none !important;}#content_CONTAINER table,#bi_inquire_content_CONTAINER table{border:0;margin:0 0 -1px;}#content_CONTAINER table:before,#bi_inquire_content_CONTAINER table:before{display:none;}#content_CONTAINER td,#bi_inquire_content_CONTAINER td{width:auto !important;padding:0;}table.nneditor-table{width:auto !important;}.gLabel{display:inline-block;}.gLabel label{margin-right:20px;line-height:22px;}.fWidthFull input[type=text]{width:100%;height:24px;-webkit-box-sizing:border-box;-moz-webkit-box:border-box;box-sizing:border-box;}.fWidthFull textarea{width:100%;-webkit-box-sizing:border-box;-moz-webkit-box:border-box;box-sizing:border-box;}
.titleArea{min-height:30px;margin:10px 0 20px;text-align:center;}.titleArea h2{display:inline-block;color:#2e2e2e;font:400 14px 'Poppins',sans-serif;letter-spacing:1.9px;padding:6px 25px;border-left:0;border-right:0;border-bottom:1px solid #c8c8c8;border-top:1px solid #c8c8c8;}.titleArea p{display:inline-block;margin:0 0 0 6px;padding:0 0 0 10px;color:#939393;background:url("http://img.echosting.cafe24.com/skin/base/layout/ico_bar.gif") no-repeat 0 0;*display:inline;*zoom:1;}.titleArea ul{padding:5px 0;color:#939393;line-height:18px;}.titleArea ul li{padding:0 0 0 9px;background:url("http://img.echosting.cafe24.com/skin/base/common/ico_square2.gif") no-repeat 4px 7px;}.boardMain{overflow:hidden;*zoom:1;}.boardMain td img{vertical-align:middle;margin:1px;}.boardMain .board{position:relative;margin:0 0 65px;}.boardMain .leftArea{float:left;width:50%;}.boardMain .leftArea .board{margin:0 23px 65px 0;}.boardMain .rightArea{float:right;width:50%;}.boardMain .rightArea .board{margin:0 0 65px 23px;}.boardMain .board h3{margin:0 0 13px;height:28px;font-size:16px;color:#2e2e2e;border-bottom:2px solid #626672;}.boardMain .board .more{position:absolute;top:0;right:0;padding:2px;}.boardMain .board .galleryList{overflow:hidden;}.boardMain .board .galleryList ul{overflow:hidden;margin:0 -10px;}.boardMain .board .galleryList li{float:left;position:relative;width:20%;padding:0 0 12px 0;word-break:break-all;}.boardMain .board .galleryList li span{display:block;margin:0 10px;font-size:11px;color:#a4a4a4;}.boardMain .board .galleryList li .imgLink,.boardMain .board .galleryList li .imgLink:hover{display:block;margin:0 10px 5px;font-size:12px;}.boardMain .board .galleryList li .imgLink img{width:100%;max-height:110px;border:1px solid #ededed;}
.ec-base-button{padding:10px 0;text-align:center;}.ec-base-button.justify{position:relative;}.ec-base-button:after{display:block;content:"";clear:both;}.ec-base-button .gLeft{float:left;text-align:left;}.ec-base-button .gRight{float:right;text-align:right;}.ec-base-button.justify .gLeft{position:absolute;left:0;}.ec-base-button.justify .gRight{position:absolute;right:0;}.ec-base-button .text{margin:0 6px 0 10px;color:#353535;line-height:24px;}.ec-base-button.typeBorder{margin-top:-1px;padding:10px 0px;border:0px solid #d7d5d5;}.ec-base-button.typeBG{padding:10px 0px;border:0px solid #d7d5d5;background:#ffffff;}.btn_black_big a{line-height:100%;background:#464646;color:#ffffff;font-size:12px;font-family:Noto Sans KR,sans-serif;border:1px solid #363636;display:inline-block;margin-top:3px;line-height:14px;padding:10px 25px 10px;text-decoration:none;}.btn_black_big a:hover{border:1px solid #363636;background:#fff;color:#464646 !important;text-decoration:none;}.btn_gray_big a{line-height:100%;background:#7d7d7d;color:#ffffff;font-size:12px;font-family:Noto Sans KR,sans-serif;border:1px solid #7d7d7d;display:inline-block;margin-top:3px;line-height:14px;padding:10px 25px 10px;text-decoration:none;}.btn_gray_big a:hover{border:1px solid #7d7d7d;background:#fff;color:#464646 !important;text-decoration:none;}.btn_white_big a {line-height:100%;background:#ffffff;color:#464646;font-size:12px;font-family:Noto Sans KR,sans-serif;border:1px solid #c2c2c2;display:inline-block;margin-top:3px;line-height:14px;padding:10px 25px 10px;text-decoration:none;}.btn_white_big a:hover {background:#f5f5f5;color:#333!important;text-decoration:none;}.btn_white_big_input {line-height:120%;background:#ffffff;color:#464646;font-size:12px;font-family:Noto Sans KR,sans-serif;border:1px solid #c2c2c2;display:inline-block;margin-top:-4px;line-height:14px;padding:11px 25px 11px;text-decoration:none;}.btn_white_big_input:hover {background:#f5f5f5;color:#333!important;text-decoration:none;cursor:pointer;}

</style>

<body>
<div class="xans-element- xans-member xans-member-findid"><!--
        $returnURL = /member/id/find_id_result.html
     -->
<div class="findId">
        <h3>아이디 찾기</h3>
        <fieldset>
<legend>아이디 찾기</legend>
            <p class="member"><strong>회원유형</strong> <select id="searchType" name="searchType" >
<option value="student" selected="selected">학생</option>
<option value="teacher">선생님</option>
</select></p>
            <p id="name_view" class="name" ><strong id="name_lable">이름</strong> <input id="name" name="name" class="lostInput" type="text"></p>
            <p id="email_view" class="email" ><strong>이메일로 찾기</strong> <input id="email" name="email" class="lostInput" type="text"></p>
            <p class="ec-base-button ">
                <span class="btn_black_big"><a href="#none" onclick="">확인</a></span>
            </p>
        </fieldset>
</div>
</div>


</body>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/layout/main/footer.jsp"></jsp:include>