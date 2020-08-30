
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 메인 헤더 -->   
<c:import url="/WEB-INF/layout/main/header.jsp"></c:import>

<!-- 선생님 마이페이지 헤더 -->
<c:import url="/WEB-INF/layout/teacher/teaHeader.jsp"></c:import>




<style type="text/css">

#title{

	width: 100%;
	font-weight: bold;
}

#title a {
	color: #17B794; /* 청록색 */
}

</style>

<style type="text/css">

body{
    background:#f5f5f5;
    margin-top:20px;
}
.card {
    border: none;
    -webkit-box-shadow: 1px 0 20px rgba(96,93,175,.05);
    box-shadow: 1px 0 20px rgba(96,93,175,.05);
    margin-bottom: 30px;
}
.table th {
    font-weight: 500;
    color: #262626;
}
.table thead {
    background-color: #f3f3f3cc;
}
.table>tbody>tr>td, .table>tfoot>tr>td, .table>thead>tr>td {
    padding: 14px 12px;
    vertical-align: middle;
}
.table tr td {
    color: #262626;
}
.thumb-sm {
    height: 32px;
    width: 32px;
}
.badge-soft-warning {
    background-color: rgba(248,201,85,.2);
    color: #f8c955;
}

.badge {
    font-weight: 500;
}
.badge-soft-primary {
    background-color: rgba(96,93,175,.2);
    color: #605daf;
}

</style>


<!-- <div id="title">과외  -->
<!-- 	<i class="glyphicon glyphicon-menu-right"></i> -->
<!-- 	<a href="">과외 조회</a> -->
<!-- </div> -->
<div id="title">
	<i class="glyphicon glyphicon-menu-right"></i>
	<a href="">자료실</a>
</div>

	<br>

	<div class="container" style="width: 960px; height: 100%;">
	    <div class="row">
	        <div class="col-xl-12">
	            <div class="card">
	                <div class="card-body">
	                    <div class="table-responsive">
	                        <table class="table table-hover mb-0">
	                            <thead>
	                                <tr class="align-self-center">
	                                    <th>Project Name</th>
	                                    <th>Client Name</th>
	                                    <th>Payment Type</th>
	                                    <th>Paid Date</th>
	                                    <th>Amount</th>
	                                    <th>Transaction</th>
	                                </tr>
	                            </thead>
	                            <tbody>
	                                <tr>
	                                    <td>Product Devlopment</td>
	                                    <td><img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" class="thumb-sm rounded-circle mr-2"> Kevin Heal</td>
	                                    <td>Paypal</td>
	                                    <td>5/8/2018</td>
	                                    <td>$15,000</td>
	                                    <td><span class="badge badge-boxed badge-soft-warning">panding</span></td>
	                                </tr>
	                                <tr>
	                                    <td>New Office Building</td>
	                                    <td><img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="" class="thumb-sm rounded-circle mr-2"> Frank M. Lyons</td>
	                                    <td>Paypal</td>
	                                    <td>15/7/2018</td>
	                                    <td>$35,000</td>
	                                    <td><span class="badge badge-boxed badge-soft-primary">Success</span></td>
	                                </tr>
	                                <tr>
	                                    <td>Market Research</td>
	                                    <td><img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt="" class="thumb-sm rounded-circle mr-2"> Angelo Butler</td>
	                                    <td>Pioneer</td>
	                                    <td>30/9/2018</td>
	                                    <td>$45,000</td>
	                                    <td><span class="badge badge-boxed badge-soft-warning">Panding</span></td>
	                                </tr>
	                                <tr>
	                                    <td>Website &amp; Blog</td>
	                                    <td><img src="https://bootdey.com/img/Content/avatar/avatar4.png" alt="" class="thumb-sm rounded-circle mr-2"> Phillip Morse</td>
	                                    <td>Paypal</td>
	                                    <td>2/6/2018</td>
	                                    <td>$70,000</td>
	                                    <td><span class="badge badge-boxed badge-soft-warning">Success</span></td>
	                                </tr>
	                                <tr>
	                                    <td>Product Devlopment</td>
	                                    <td><img src="https://bootdey.com/img/Content/avatar/avatar6.png" alt="" class="thumb-sm rounded-circle mr-2"> Kevin Heal</td>
	                                    <td>Paypal</td>
	                                    <td>5/8/2018</td>
	                                    <td>$15,000</td>
	                                    <td><span class="badge badge-boxed badge-soft-primary">panding</span></td>
	                                </tr>
	                                <tr>
	                                    <td>New Office Building</td>
	                                    <td><img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="" class="thumb-sm rounded-circle mr-2"> Frank M. Lyons</td>
	                                    <td>Paypal</td>
	                                    <td>15/7/2018</td>
	                                    <td>$35,000</td>
	                                    <td><span class="badge badge-boxed badge-soft-primary">Success</span></td>
	                                </tr>
	                            </tbody>
	                        </table>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>





<!-- 선생님 마이페이지 푸터 -->
<c:import url="/WEB-INF/layout/teacher/teaFooter.jsp"></c:import>
<c:import url="/WEB-INF/layout/teacher/teaFooter2.jsp"></c:import>


