<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 관리자 페이지 header -->   
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<c:import url="/WEB-INF/layout/admin/adminHeader.jsp"></c:import>
<style type="text/css">
#layoutSidenav_content{	
	background-color: #f3f3f3cc;
}
.card {
    border: none;
    margin-bottom: 24px;
    -webkit-box-shadow: 0 0 13px 0 rgba(236,236,241,.44);
    box-shadow: 0 0 13px 0 rgba(236,236,241,.44);
}

.avatar-xs {
    height: 2.3rem;
    width: 2.3rem;
}
</style>
            
<div id="title">게시판 
	<i class="fas fa-angle-right"></i>
	<a href="#">신고 내역 관리</a>
</div>

<main>
    <div id="content">
                    

		<div class="container">
		    <div class="row">
		        <div class="col-xl-3 col-md-6">
		            <div class="card bg-pattern">
		                <div class="card-body">
		                    <div class="float-right">
		                        <i class="fa fa-archive text-primary h4 ml-3"></i>
		                    </div>
		                    <h5 class="font-size-20 mt-0 pt-1">24</h5>
		                    <p class="text-muted mb-0">신청된 신고</p>
		                </div>
		            </div>
		        </div>
		        <div class="col-xl-3 col-md-6">
		            <div class="card bg-pattern">
		                <div class="card-body">
		                    <div class="float-right">
		                        <i class="fa fa-th text-primary h4 ml-3"></i>
		                    </div>
		                    <h5 class="font-size-20 mt-0 pt-1">18</h5>
		                    <p class="text-muted mb-0">처리 완료</p>
		                </div>
		            </div>
		        </div>
		        <div class="col-xl-3 col-md-6">
		            <div class="card bg-pattern">
		                <div class="card-body">
		                    <div class="float-right">
		                        <i class="fa fa-file text-primary h4 ml-3"></i>
		                    </div>
		                    <h5 class="font-size-20 mt-0 pt-1">06</h5>
		                    <p class="text-muted mb-0">반려</p>
		                </div>
		            </div>
		        </div>
		        <div class="col-xl-3 col-md-6">
		            <div class="card">
		                <div class="card-body">
		                    <form>
		                        <div class="form-group mb-0">
		                            <label>Search</label>
		                            <div class="input-group mb-0">
		                                <input type="text" class="form-control" placeholder="Search..." aria-describedby="project-search-addon" />
		                                <div class="input-group-append">
		                                    <button class="btn btn-danger" type="button" id="project-search-addon"><i class="fa fa-search search-icon font-12"></i></button>
		                                </div>
		                            </div>
		                        </div>
		                    </form>
		                </div>
		            </div>
		        </div>
		    </div>
		    <!-- end row -->
		
		    <div class="row">
		        <div class="col-lg-12">
		            <div class="card">
		                <div class="card-body">
		                    <div class="table-responsive project-list">
		                        <table class="table project-table table-centered table-nowrap">
		                            <thead>
		                                <tr>
		                                    <th scope="col">#</th>
		                                    <th scope="col">신고글</th>
		                                    <th scope="col">신고 사유</th>
		                                    <th scope="col">신고 날짜</th>
		                                    <th scope="col">신고인</th>
		                                    <th scope="col">처리 상태</th>
		                                    <th scope="col">Action</th>
		                                </tr>
		                            </thead>
		                            <tbody>
		                                <tr>
		                                    <th scope="row">1</th>
		                                    <td>New admin Design</td>
		                                    <td>New admin Design</td>
		                                    <td>02/5/2019</td>
		                                    <td>
		                                        <span class="text-success font-12"><i class="mdi mdi-checkbox-blank-circle mr-1"></i> Completed</span>
		                                    </td>
		                                    <td>
		                                        <div class="team">
		                                            <a href="javascript: void(0);" class="team-member" data-toggle="tooltip" data-placement="top" title="" data-original-title="Roger Drake">
		                                                <img src="https://bootdey.com/img/Content/avatar/avatar6.png" class="rounded-circle avatar-xs" alt="" />
		                                            </a>
		
		                                            <a href="javascript: void(0);" class="team-member" data-toggle="tooltip" data-placement="top" title="" data-original-title="Reggie James">
		                                                <img src="https://bootdey.com/img/Content/avatar/avatar7.png" class="rounded-circle avatar-xs" alt="" />
		                                            </a>
		
		                                            <a href="javascript: void(0);" class="team-member" data-toggle="tooltip" data-placement="top" title="" data-original-title="Gerald Mayberry">
		                                                <img src="https://bootdey.com/img/Content/avatar/avatar8.png" class="rounded-circle avatar-xs" alt="" />
		                                            </a>
		                                        </div>
		                                    </td>
		                                    <td>
		                                        <div class="action">
		                                            <a href="#" class="text-success mr-4" data-toggle="tooltip" data-placement="top" title="" data-original-title="Edit"> <i class="fa fa-pencil h5 m-0"></i></a>
		                                            <a href="#" class="text-danger" data-toggle="tooltip" data-placement="top" title="" data-original-title="Close"> <i class="fa fa-remove h5 m-0"></i></a>
		                                        </div>
		                                    </td>
		                                </tr>
		
		                                <tr>
		                                    <th scope="row">2</th>
		                                    <td>Landing page Design</td>
		                                    <td>Landing page Design</td>
		                                    <td>04/6/2019</td>
		                                    <td>
		                                        <span class="text-primary font-12"><i class="mdi mdi-checkbox-blank-circle mr-1"></i> Pending</span>
		                                    </td>
		                                    <td>
		                                        <div class="team">
		                                            <a href="javascript: void(0);" class="team-member" data-toggle="tooltip" data-placement="top" title="" data-original-title="Deborah Mixon">
		                                                <img src="https://bootdey.com/img/Content/avatar/avatar2.png" class="rounded-circle avatar-xs" alt="" />
		                                            </a>
		
		                                            <a href="javascript: void(0);" class="team-member" data-toggle="tooltip" data-placement="top" title="" data-original-title="Scott Jessie">
		                                                <img src="https://bootdey.com/img/Content/avatar/avatar1.png" class="rounded-circle avatar-xs" alt="" />
		                                            </a>
		                                        </div>
		                                    </td>
		                                    <td>
		                                        <div class="action">
		                                            <a href="#" class="text-success mr-4" data-toggle="tooltip" data-placement="top" title="" data-original-title="Edit"> <i class="fa fa-pencil h5 m-0"></i></a>
		                                            <a href="#" class="text-danger" data-toggle="tooltip" data-placement="top" title="" data-original-title="Close"> <i class="fa fa fa-remove h5 m-0"></i></a>
		                                        </div>
		                                    </td>
		                                </tr>
		
		                            </tbody>
		                        </table>
		                    </div>
		                    <!-- end project-list -->
		
		                    <div class="pt-3">
		                        <ul class="pagination justify-content-end mb-0">
		                            <li class="page-item disabled">
		                                <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
		                            </li>
		                            <li class="page-item"><a class="page-link" href="#">1</a></li>
		                            <li class="page-item active"><a class="page-link" href="#">2</a></li>
		                            <li class="page-item"><a class="page-link" href="#">3</a></li>
		                            <li class="page-item">
		                                <a class="page-link" href="#">Next</a>
		                            </li>
		                        </ul>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		    <!-- end row -->
		</div>
      </div>
</main>
                
                
<!-- 관리자 페이지 footer --> 
<c:import url="/WEB-INF/layout/admin/adminFooter.jsp"></c:import>
  