<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>
<c:import url="/WEB-INF/layout/teacher/teaHeader.jsp"></c:import>
<link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
<style type="text/css">
.listBox{
	width: 100%;
	text-align: center;
}
.tickets-container .tickets-list .ticket-item .ticket-state i {
    font-size: 13px;
    color: #fff;
    line-height: 20px;
}
.tickets-container .tickets-list .ticket-item .ticket-state {
    position: absolute;
    top: 13px;
    right: -12px;
    height: 24px;
    width: 24px;
    -webkit-border-radius: 50%;
    -webkit-background-clip: padding-box;
    -moz-border-radius: 50%;
    -moz-background-clip: padding;
    border-radius: 50%;
    background-clip: padding-box;
    background-color: #e5e5e5;
    text-align: center;
    -webkit-box-shadow: 0 0 3px rgba(0,0,0,.5);
    -moz-box-shadow: 0 0 3px rgba(0,0,0,.5);
    box-shadow: 0 0 3px rgba(0,0,0,.5);
    border: 2px solid #fff;
}
.bg-palegreen {
    background-color: #a0d468!important;
}
.tickets-container .tickets-list .ticket-item .ticket-type .type {
    color: #999;
    font-size: 11px;
    text-transform: uppercase;
}
.tickets-container .tickets-list .ticket-item .ticket-type {
    line-height: 30px;
    height: 50px;
    padding: 10px;
}
.tickets-container .tickets-list .ticket-item .ticket-time i {
    color: #ccc;
    width:50px;
}

.tickets-container .tickets-list .ticket-item .divider {
    position: absolute;
    top: 0;
    left: 0;
    height: 50px;
    width: 1px;
    background-color: #eee;
    display: inline-block;
}
.tickets-container .tickets-list .ticket-item .ticket-time {
    line-height: 30px;
    height: 50px;
    padding: 10px;
}
.tickets-container .tickets-list .ticket-item .ticket-user .user-company {
    margin-left: 2px;
    color: #999;
}
.tickets-container .tickets-list .ticket-item .ticket-user .user-at {
    margin-left: 2px;
    color: #ccc;
    font-size: 13px;
}
.tickets-container .tickets-list .ticket-item .ticket-user .user-name {
    margin-left: 5px;
    font-size: 13px;
}
.tickets-container .tickets-list .ticket-item .ticket-user .user-avatar {
    width: 30px;
    height: 30px;
    -webkit-border-radius: 3px;
    -webkit-background-clip: padding-box;
    -moz-border-radius: 3px;
    -moz-background-clip: padding;
    border-radius: 3px;
    background-clip: padding-box;
}
.tickets-container .tickets-list .ticket-item .ticket-user {
    height: 50px;
    padding: 10px;
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
}
.tickets-container .tickets-list .ticket-item {
    position: relative;
	background-color: #fff;
    -webkit-box-shadow: 0 0 3px rgba(0,0,0,.5);
    -moz-box-shadow: 0 0 3px rgba(0,0,0,.5);
    box-shadow: 0 0 3px rgba(0,0,0,.5);
    -webkit-border-radius: 3px;
    -webkit-background-clip: padding-box;
    -moz-border-radius: 3px;
    -moz-background-clip: padding;
    border-radius: 3px;
    background-clip: padding-box;
    margin-bottom: 8px;
    padding: 0 15px;
    vertical-align: top;
}
.tickets-container .tickets-list {
    list-style: none;
    padding: 0;
    margin-bottom: 0;
}
.tickets-container {
    position: relative;
    padding: 25px 25px;
/*     background-color: #f5f5f5; */
}
.widget-main.no-padding {
    padding: 0;
}
.widget-main {
    padding: 12px;
}
.no-padding {
    padding: 0!important;
}
.widget-body {
/*     background-color: #fbfbfb; */
}

.widget-header>.widget-caption {
    line-height: 33px;
    padding: 0;
    margin: 0;
    float: left;
    text-align: left;
    font-weight: 400!important;
    font-size: 13px;
}

.widget-header .widget-icon {
    display: block;
    width: 30px;
    height: 32px;
    position: relative;
    float: left;
    font-size: 111%;
    line-height: 32px;
    text-align: center;
    margin-left: -10px;
}
.themesecondary {
    color: #17B794 !important;
}
.widget-header.bordered-bottom {
    border-bottom: 3px solid #fff;
}
.widget-header {
    position: relative;
    min-height: 35px;
    background: #fff;
    -webkit-box-shadow: 0 0 4px rgba(0,0,0,.5);
    -moz-box-shadow: 0 0 4px rgba(0,0,0,.5);
    box-shadow: 0 0 4px rgba(0,0,0,.5);
    color: #555;
    padding-left: 12px;
    text-align: right;
}
.bordered-themesecondary {
    border-color: #17B794 !important;
}
.widget-box {
    padding: 0;
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
    box-shadow: none;
    margin: 3px 0 30px 0;
}                   


</style>
	<div class="listBox">
	
    	<div class="row">
			<div>
				<h4 style="font-family: 'Segoe UI',Arial,sans-serif">과외 연결 관리 > 학생 신청 내역 </h4>
			</div>
			<hr>
		    <div class="col-md-12">
		            <div class="widget-body">
		                <div class="widget-main no-padding">
		                    <div class="tickets-container">
		                        <ul class="tickets-list">
		                            <li class="ticket-item">
		                                <div class="row">
		                                    <div class="ticket-user col-md-3 col-sm-12">
		                                        <img src="https://bootdey.com/img/Content/user_1.jpg" class="user-avatar">
		                                        <span class="user-name">Adam Johnson</span>
		                                        <span class="user-at">at</span>
		                                        <span class="user-company">Microsoft</span>
		                                    </div>
		                                    <div class="ticket-time  col-md-4 col-sm-6 col-xs-12">
		                                        <div class="divider hidden-md hidden-sm hidden-xs"></div>
		                                        <i class="fa fa-clock-o"></i>
		                                        <span class="time">1 Hours Ago</span>
		                                    </div>
		                                    <div class="ticket-type  col-md-2 col-sm-6 col-xs-12">
		                                        <span class="divider hidden-xs"></span>
		                                        <span class="type">Issue</span>
		                                    </div>
		                                    <div class="ticket-state bg-palegreen">
		                                        <i class="fa fa-check"></i>
		                                    </div>
		                                </div>
		                            </li>
		                            <li class="ticket-item">
		                                <div class="row">
		                                    <div class="ticket-user col-md-6 col-sm-12">
		                                        <img src="https://bootdey.com/img/Content/user_2.jpg" class="user-avatar">
		                                        <span class="user-name">Divyia Phillips</span>
		                                        <span class="user-at">at</span>
		                                        <span class="user-company">Dribbble</span>
		                                    </div>
		                                    <div class="ticket-time  col-md-4 col-sm-6 col-xs-12">
		                                        <div class="divider hidden-md hidden-sm hidden-xs"></div>
		                                        <i class="fa fa-clock-o"></i>
		                                        <span class="time">3 Hours Ago</span>
		                                    </div>
		                                    <div class="ticket-type  col-md-2 col-sm-6 col-xs-12">
		                                        <span class="divider hidden-xs"></span>
		                                        <span class="type">Payment</span>
		                                    </div>
		                                    <div class="ticket-state bg-palegreen">
		                                        <i class="fa fa-check"></i>
		                                    </div>
		                                </div>
		                            </li>
		                            <li class="ticket-item">
		                                <div class="row">
		                                    <div class="ticket-user col-md-6 col-sm-12">
		                                        <img src="https://bootdey.com/img/Content/user_3.jpg" class="user-avatar">
		                                        <span class="user-name">Nicolai Larson</span>
		                                        <span class="user-at">at</span>
		                                        <span class="user-company">Google</span>
		                                    </div>
		                                    <div class="ticket-time  col-md-4 col-sm-6 col-xs-12">
		                                        <div class="divider hidden-md hidden-sm hidden-xs"></div>
		                                        <i class="fa fa-clock-o"></i>
		                                        <span class="time">18 Hours Ago</span>
		                                    </div>
		                                    <div class="ticket-type  col-md-2 col-sm-6 col-xs-12">
		                                        <span class="divider hidden-xs"></span>
		                                        <span class="type">Issue</span>
		                                    </div>
		                                    <div class="ticket-state bg-darkorange">
		                                        <i class="fa fa-times"></i>
		                                    </div>
		                                </div>
		                            </li>
		                            <li class="ticket-item">
		                                <div class="row">
		                                    <div class="ticket-user col-md-6 col-sm-12">
		                                        <img src="https://bootdey.com/img/Content/user_1.jpg" class="user-avatar">
		                                        <span class="user-name">Bill Jackson</span>
		                                        <span class="user-at">at</span>
		                                        <span class="user-company">Mabna</span>
		                                    </div>
		                                    <div class="ticket-time  col-md-4 col-sm-6 col-xs-12">
		                                        <div class="divider hidden-md hidden-sm hidden-xs"></div>
		                                        <i class="fa fa-clock-o"></i>
		                                        <span class="time">2 days Ago</span>
		                                    </div>
		                                    <div class="ticket-type  col-md-2 col-sm-6 col-xs-12">
		                                        <span class="divider hidden-xs"></span>
		                                        <span class="type">Payment</span>
		                                    </div>
		                                    <div class="ticket-state bg-palegreen">
		                                        <i class="fa fa-check"></i>
		                                    </div>
		                                </div>
		                            </li>
		                            <li class="ticket-item">
		                                <div class="row">
		                                    <div class="ticket-user col-md-6 col-sm-12">
		                                        <img src="https://bootdey.com/img/Content/user_2.jpg" class="user-avatar">
		                                        <span class="user-name">Eric Clapton</span>
		                                        <span class="user-at">at</span>
		                                        <span class="user-company">Musicker</span>
		                                    </div>
		                                    <div class="ticket-time  col-md-4 col-sm-6 col-xs-12">
		                                        <div class="divider hidden-md hidden-sm hidden-xs"></div>
		                                        <i class="fa fa-clock-o"></i>
		                                        <span class="time">2 days Ago</span>
		                                    </div>
		                                    <div class="ticket-type  col-md-2 col-sm-6 col-xs-12">
		                                        <span class="divider hidden-xs"></span>
		                                        <span class="type">Info</span>
		                                    </div>
		                                    <div class="ticket-state bg-yellow">
		                                        <i class="fa fa-info"></i>
		                                    </div>
		                                </div>
		                            </li>
		                        </ul>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>


<c:import url="/WEB-INF/layout/teacher/teaFooter.jsp"></c:import>
<c:import url="/WEB-INF/layout/teacher/teaFooter2.jsp"></c:import>



