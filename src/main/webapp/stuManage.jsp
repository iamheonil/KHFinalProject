<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- 관리자 페이지 header -->
<c:import url="/WEB-INF/layout/admin/adminHeader.jsp"></c:import>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">




<style type="text/css">
body {
	margin-top: 20px;
}
/* USER LIST TABLE */
.user-list tbody td>img {
	position: relative;
	max-width: 50px;
	float: left;
	margin-right: 15px;
}
.user-list tbody td .user-link {
	display: block;
	font-size: 1.25em;
	padding-top: 3px;
	margin-left: 60px;
}
.user-list tbody td .user-subhead {
	font-size: 0.875em;
	font-style: italic;
}
/* TABLES */
.table {
	border-collapse: separate;
}
.table-hover>tbody>tr:hover>td, .table-hover>tbody>tr:hover>th {
	background-color: #eee;
}
.table thead>tr>th {
	border-bottom: 1px solid #C2C2C2;
	padding-bottom: 0;
}
.table tbody>tr>td {
	font-size: 0.875em;
	background: #f5f5f5;
	border-top: 10px solid #fff;
	vertical-align: middle;
	padding: 12px 8px;
}
.table tbody>tr>td:first-child, .table thead>tr>th:first-child {
	padding-left: 20px;
}
.table thead>tr>th span {
	border-bottom: 2px solid #C2C2C2;
	display: inline-block;
	padding: 0 5px;
	padding-bottom: 5px;
	font-weight: normal;
}
.table thead>tr>th>a span {
	color: #344644;
}
.table thead>tr>th>a span:after {
	content: "\f0dc";
	font-family: FontAwesome;
	font-style: normal;
	font-weight: normal;
	text-decoration: inherit;
	margin-left: 5px;
	font-size: 0.75em;
}
.table thead>tr>th>a.asc span:after {
	content: "\f0dd";
}
.table thead>tr>th>a.desc span:after {
	content: "\f0de";
}
.table thead>tr>th>a:hover span {
	text-decoration: none;
	color: #2bb6a3;
	border-color: #2bb6a3;
}
.table.table-hover tbody>tr>td {
	-webkit-transition: background-color 0.15s ease-in-out 0s;
	transition: background-color 0.15s ease-in-out 0s;
}
.table tbody tr td .call-type {
	display: block;
	font-size: 0.75em;
	text-align: center;
}
.table tbody tr td .first-line {
	line-height: 1.5;
	font-weight: 400;
	font-size: 1.125em;
}
.table tbody tr td .first-line span {
	font-size: 0.875em;
	color: #969696;
	font-weight: 300;
}
.table tbody tr td .second-line {
	font-size: 0.875em;
	line-height: 1.2;
}
.table a.table-link {
	margin: 0 5px;
	font-size: 1.125em;
}
.table a.table-link:hover {
	text-decoration: none;
	color: #2aa493;
}
.table a.table-link.danger {
	color: #fe635f;
}
.table a.table-link.danger:hover {
	color: #dd504c;
}
.table-products tbody>tr>td {
	background: none;
	border: none;
	border-bottom: 1px solid #ebebeb;
	-webkit-transition: background-color 0.15s ease-in-out 0s;
	transition: background-color 0.15s ease-in-out 0s;
	position: relative;
}
.table-products tbody>tr:hover>td {
	text-decoration: none;
	background-color: #f6f6f6;
}
.table-products .name {
	display: block;
	font-weight: 600;
	padding-bottom: 7px;
}
.table-products .price {
	display: block;
	text-decoration: none;
	width: 50%;
	float: left;
	font-size: 0.875em;
}
.table-products .price>i {
	color: #8dc859;
}
.table-products .warranty {
	display: block;
	text-decoration: none;
	width: 50%;
	float: left;
	font-size: 0.875em;
}
.table-products .warranty>i {
	color: #f1c40f;
}
.table tbody>tr.table-line-fb>td {
	background-color: #9daccb;
	color: #262525;
}
.table tbody>tr.table-line-twitter>td {
	background-color: #9fccff;
	color: #262525;
}
.table tbody>tr.table-line-plus>td {
	background-color: #eea59c;
	color: #262525;
}
.table-stats .status-social-icon {
	font-size: 1.9em;
	vertical-align: bottom;
}
.table-stats .table-line-fb .status-social-icon {
	color: #556484;
}
.table-stats .table-line-twitter .status-social-icon {
	color: #5885b8;
}
.table-stats .table-line-plus .status-social-icon {
	color: #a75d54;
}
</style>

<!--////////////////////////////////////////////////////////////////////////  -->

<style type="text/css">
.widget-26 {
  color: #3c4142;
  font-weight: 400;
}
.widget-26 tr:first-child td {
  border: 0;
}
.widget-26 .widget-26-job-emp-img img {
  width: 35px;
  height: 35px;
  border-radius: 50%;
}
.widget-26 .widget-26-job-title {
  min-width: 200px;
}
.widget-26 .widget-26-job-title a {
  font-weight: 400;
  font-size: 0.875rem;
  color: #3c4142;
  line-height: 1.5;
}
.widget-26 .widget-26-job-title a:hover {
  color: #68CBD7;
  text-decoration: none;
}
.widget-26 .widget-26-job-title .employer-name {
  margin: 0;
  line-height: 1.5;
  font-weight: 400;
  color: #3c4142;
  font-size: 0.8125rem;
  color: #3c4142;
}
.widget-26 .widget-26-job-title .employer-name:hover {
  color: #68CBD7;
  text-decoration: none;
}
.widget-26 .widget-26-job-title .time {
  font-size: 12px;
  font-weight: 400;
}
.widget-26 .widget-26-job-info {
  min-width: 100px;
  font-weight: 400;
}
.widget-26 .widget-26-job-info p {
  line-height: 1.5;
  color: #3c4142;
  font-size: 0.8125rem;
}
.widget-26 .widget-26-job-info .location {
  color: #3c4142;
}
.widget-26 .widget-26-job-salary {
  min-width: 70px;
  font-weight: 400;
  color: #3c4142;
  font-size: 0.8125rem;
}
.widget-26 .widget-26-job-category {
  padding: .5rem;
  display: inline-flex;
  white-space: nowrap;
  border-radius: 15px;
}
.widget-26 .widget-26-job-category .indicator {
  width: 13px;
  height: 13px;
  margin-right: .5rem;
  float: left;
  border-radius: 50%;
}
.widget-26 .widget-26-job-category span {
  font-size: 0.8125rem;
  color: #3c4142;
  font-weight: 600;
}
.widget-26 .widget-26-job-starred svg {
  width: 20px;
  height: 20px;
  color: #fd8b2c;
}
.widget-26 .widget-26-job-starred svg.starred {
  fill: #fd8b2c;
}
.bg-soft-base {
  background-color: #e1f5f7;
}
.bg-soft-warning {
    background-color: #fff4e1;
}
.bg-soft-success {
    background-color: #d1f6f2;
}
.bg-soft-danger {
    background-color: #fedce0;
}
.bg-soft-info {
    background-color: #d7efff;
}
.search-form {
  width: 80%;
  margin: 0 auto;
  margin-top: 1rem;
}
.search-form input {
  height: 100%;
  background: transparent;
  border: 0;
  display: block;
  width: 100%;
  padding: 1rem;
  height: 100%;
  font-size: 1rem;
}
.search-form select {
  background: transparent;
  border: 0;
  padding: 1rem;
  height: 100%;
  font-size: 1rem;
  padding-left: 4rem;
}
.search-form select:focus {
  border: 0;
}
.search-form button {
  height: 100%;
  width: 100%;
  font-size: 1rem;
}
.search-form button svg {
  width: 24px;
  height: 24px;
}
.search-body {
  margin-bottom: 5.5rem;
}
.search-body .search-filters .filter-list {
  margin-bottom: 1.3rem;
}
.search-body .search-filters .filter-list .title {
  color: #3c4142;
  margin-bottom: 1rem;
}
.search-body .search-filters .filter-list .filter-text {
  color: #727686;
}
.search-body .search-result .result-header {
  margin-bottom: 2rem;
}
.search-body .search-result .result-header .records {
  color: #3c4142;
}
.search-body .search-result .result-header .result-actions {
  text-align: right;
  display: flex;
  align-items: center;
  justify-content: space-between;
}
.search-body .search-result .result-header .result-actions .result-sorting {
  display: flex;
  align-items: center;
}
.search-body .search-result .result-header .result-actions .result-sorting span {
  flex-shrink: 0;
  font-size: 0.8125rem;
}
.search-body .search-result .result-header .result-actions .result-sorting select {
  color: #68CBD7;
}
.search-body .search-result .result-header .result-actions .result-sorting select option {
  color: #3c4142;
}
@media (min-width: 700px) and (max-width: 900.98px) {
  .search-body .search-filters {
    display: flex;
  }
  .search-body .search-filters .filter-list {
    margin-right: 1rem;
  }
}
.card-margin {
    margin-bottom: 1.875rem;
}
@media (min-width: 992px){
.col-lg-2 {
    flex: 0 0 16.66667%;
    max-width: 16.66667%;
}
}
.card-margin {
    margin-bottom: 1.875rem;
}
.card {
    border: 0;
    box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
    -webkit-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
    -moz-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
    -ms-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
}
.card {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #ffffff;
    background-clip: border-box;
    border: 1px solid #e6e4e9;
    border-radius: 8px;
}
</style>


<div id="layoutSidenav_content">

	<div id="title">
		회원 <i class="fas fa-angle-right"></i> <a href="#">학생 관리</a>
	</div>

	<main>
		<div id="content">





			<div class="container">
				<div class="row">
					<div class="col-lg-12 card-margin">
						<div class="card search-form">
							<div class="card-body p-0">
								<form id="search-form">
									<div class="row">
										<div class="col-12">
											<div class="row no-gutters">
												<div class="col-lg-3 col-md-3 col-sm-12 p-0">
													<select class="form-control" id="exampleFormControlSelect1">
														<option>Location</option>
														<option>London</option>
														<option>Boston</option>
														<option>Mumbai</option>
														<option>New York</option>
														<option>Toronto</option>
														<option>Paris</option>
													</select>
												</div>
												<div class="col-lg-8 col-md-6 col-sm-12 p-0">
													<input type="text" placeholder="Search..."
														class="form-control" id="search" name="search">
												</div>
												<div class="col-lg-1 col-md-3 col-sm-12 p-0">
													<button type="submit" class="btn btn-base">
														<svg xmlns="http://www.w3.org/2000/svg" width="24"
															height="24" viewBox="0 0 24 24" fill="none"
															stroke="currentColor" stroke-width="2"
															stroke-linecap="round" stroke-linejoin="round"
															class="feather feather-search">
															<circle cx="11" cy="11" r="8"></circle>
															<line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
													</button>
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<br><br>
				<div class="row">
					<div class="col-lg-12">
						<div class="main-box clearfix">
							<div class="table-responsive">
								<table class="table user-list">
									<thead>
										<tr>
											<th><span>User</span></th>
											<th><span>생년월일</span></th>
											<th class="text-center"><span>Status</span></th>
											<th><span>Email</span></th>
											<th>&nbsp;</th>
										</tr>
									</thead>
									<tbody>
<%-- 										<c:forEach items="${list}" var="emp"> --%>
<!-- 											<tr> -->
<%-- 												<td>${emp.empno }</td> --%>
<%-- 												<td><a href="/emp/detail?empno=${emp.empno}">${emp.ename }</a></td> --%>
<%-- 												<td>${emp.job }</td> --%>
<%-- 												<td>${emp.mgr }</td> --%>
<!-- 												<td> -->
<%-- 												<fmt:formatDate value="${emp.hiredate }" pattern="yyyyMMdd" /> --%>
<!-- 												</td> -->
<%-- 												<td>${emp.sal }</td> --%>
<%-- 												<td>${emp.comm }</td> --%>
<%-- 												<td>${emp.deptno }</td> --%>
<!-- 											</tr> -->
<%-- 											</c:forEach> --%>
										<tr>
											<td><img
												src="https://bootdey.com/img/Content/avatar/avatar1.png"
												alt=""> <a href="#" class="user-link">Mila Kunis</a> <span
												class="user-subhead">Admin</span></td>
											<td>2013/08/08</td>
											<td class="text-center"><span
												class="label label-default">Inactive</span></td>
											<td><a href="#">mila@kunis.com</a></td>
											<td style="width: 20%;"><a href="#"
												class="table-link danger"> <span class="fa-stack">
														<i class="fa fa-square fa-stack-2x"></i> <i
														class="fa fa-trash fa-stack-1x fa-inverse "></i>
												</span>
											</a></td>
										</tr>
										<tr>
											<td><img
												src="https://bootdey.com/img/Content/avatar/avatar2.png"
												alt=""> <a href="#" class="user-link">George
													Clooney</a> <span class="user-subhead">Member</span></td>
											<td>2013/08/12</td>
											<td class="text-center"><span
												class="label label-success">Active</span></td>
											<td><a href="#">marlon@brando.com</a></td>
											<td style="width: 20%;"><a href="#"
												class="table-link danger"> <span class="fa-stack">
														<i class="fa fa-square fa-stack-2x"></i> <i
														class="fa fa-trash fa-stack-1x fa-inverse"></i>
												</span>
											</a></td>
										</tr>
										<tr>
											<td><img
												src="https://bootdey.com/img/Content/avatar/avatar3.png"
												alt=""> <a href="#" class="user-link">Ryan
													Gossling</a> <span class="user-subhead">Registered</span></td>
											<td>2013/03/03</td>
											<td class="text-center"><span class="label label-danger">Banned</span>
											</td>
											<td><a href="#">jack@nicholson</a></td>
											<td style="width: 20%;"><a href="#"
												class="table-link danger"> <span class="fa-stack">
														<i class="fa fa-square fa-stack-2x"></i> <i
														class="fa fa-trash fa-stack-1x fa-inverse"></i>
												</span>
											</a></td>
										</tr>
										<tr>
											<td><img
												src="https://bootdey.com/img/Content/avatar/avatar4.png"
												alt=""> <a href="#" class="user-link">Emma Watson</a>
												<span class="user-subhead">Registered</span></td>
											<td>2004/01/24</td>
											<td class="text-center"><span
												class="label label-warning">Pending</span></td>
											<td><a href="#">humphrey@bogart.com</a></td>
											<td style="width: 20%;"><a href="#"
												class="table-link danger"> <span class="fa-stack">
														<i class="fa fa-square fa-stack-2x"></i> <i
														class="fa fa-trash fa-stack-1x fa-inverse"></i>
												</span>
											</a></td>
										</tr>
										<tr>
											<td><img
												src="https://bootdey.com/img/Content/avatar/avatar5.png"
												alt=""> <a href="#" class="user-link">Robert
													Downey Jr.</a> <span class="user-subhead">Admin</span></td>
											<td>2013/12/31</td>
											<td class="text-center"><span
												class="label label-success">Active</span></td>
											<td><a href="#">spencer@tracy</a></td>
											<td style="width: 20%;"><a href="#"
												class="table-link danger"> <span class="fa-stack">
														<i class="fa fa-square fa-stack-2x"></i> <i
														class="fa fa-trash fa-stack-1x fa-inverse"></i>
												</span>
											</a></td>
										</tr>
										<tr>
											<td><img
												src="https://bootdey.com/img/Content/avatar/avatar6.png"
												alt=""> <a href="#" class="user-link">Mila Kunis</a> <span
												class="user-subhead">Admin</span></td>
											<td>2013/08/08</td>
											<td class="text-center"><span
												class="label label-default">Inactive</span></td>
											<td><a href="#">mila@kunis.com</a></td>
											<td style="width: 20%;"><a href="#"
												class="table-link danger"> <span class="fa-stack">
														<i class="fa fa-square fa-stack-2x"></i> <i
														class="fa fa-trash fa-stack-1x fa-inverse"></i>
												</span>
											</a></td>
										</tr>
										<tr>
											<td><img
												src="https://bootdey.com/img/Content/avatar/avatar7.png"
												alt=""> <a href="#" class="user-link">George
													Clooney</a> <span class="user-subhead">Member</span></td>
											<td>2013/08/12</td>
											<td class="text-center"><span
												class="label label-success">Active</span></td>
											<td><a href="#">marlon@brando.com</a></td>
											<td style="width: 20%;"><a href="#"
												class="table-link danger"> <span class="fa-stack">
														<i class="fa fa-square fa-stack-2x"></i> <i
														class="fa fa-trash fa-stack-1x fa-inverse"></i>
												</span>
											</a></td>
										</tr>
										<tr>
											<td><img
												src="https://bootdey.com/img/Content/avatar/avatar1.png"
												alt=""> <a href="#" class="user-link">Ryan
													Gossling</a> <span class="user-subhead">Registered</span></td>
											<td>2013/03/03</td>
											<td class="text-center"><span class="label label-danger">Banned</span>
											</td>
											<td><a href="#">jack@nicholson</a></td>
											<td style="width: 20%;"><a href="#"
												class="table-link danger"> <span class="fa-stack">
														<i class="fa fa-square fa-stack-2x"></i> <i
														class="fa fa-trash fa-stack-1x fa-inverse"></i>
												</span>
											</a></td>
										</tr>
										<tr>
											<td><img
												src="https://bootdey.com/img/Content/avatar/avatar1.png"
												alt=""> <a href="#" class="user-link">Emma Watson</a>
												<span class="user-subhead">Registered</span></td>
											<td>2004/01/24</td>
											<td class="text-center"><span
												class="label label-warning">Pending</span></td>
											<td><a href="#">humphrey@bogart.com</a></td>
											<td style="width: 20%;"><a href="#"
												class="table-link danger"> <span class="fa-stack">
														<i class="fa fa-square fa-stack-2x"></i> <i
														class="fa fa-trash fa-stack-1x fa-inverse"></i>
												</span>
											</a></td>
										</tr>
										<tr>
											<td><img
												src="https://bootdey.com/img/Content/avatar/avatar6.png"
												alt=""> <a href="#" class="user-link">Robert
													Downey Jr.</a> <span class="user-subhead">Admin</span></td>
											<td>2013/12/31</td>
											<td class="text-center"><span
												class="label label-success">Active</span></td>
											<td><a href="#">spencer@tracy</a></td>
											<td style="width: 20%;"><a href="#"
												class="table-link danger"> <span class="fa-stack">
														<i class="fa fa-square fa-stack-2x"></i> <i
														class="fa fa-trash fa-stack-1x fa-inverse"></i>
												</span>
											</a></td>
										</tr>
									</tbody>
								</table>
							</div>
							<ul class="pagination pull-right">
								<li><a href="#"><i class="fa fa-chevron-left"></i></a></li>
								<li><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#"><i class="fa fa-chevron-right"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>

		</div>

		<hr>
	</main>


	<!-- 관리자 페이지 footer -->
	<c:import url="/WEB-INF/layout/admin/adminFooter.jsp"></c:import>