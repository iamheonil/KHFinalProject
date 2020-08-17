<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 구동영 20200817 : 프론트 작업 -->
<!-- nav include  -->
<jsp:include
	page="${pageContext.request.contextPath}/WEB-INF/layout/main/header.jsp"></jsp:include>


<style type="text/css">
	
h1, h2, h3, h4, h5, h6, .h1, .h2, .h3, .h4, .h5, .h6 {
    font-weight: 600;
}
	
.card {
   position: relative;
   display: flex;
   flex-direction: column;
   min-width: 0;
   word-wrap: break-word;
   background-color: #fff;
   background-clip: border-box;
   border: 0 solid transparent;
   border-radius: 0;
   margin-bottom: 30px;
}
.card-body {
    flex: 1 1 auto;
    padding: 1.57rem;
}

.card p{
	font-family: "Raleway", Arial, sans-serif;
    margin-bottom: 20px;
    font-weight: 400;
    font-size: 16px;
    line-height: 1.7;
}
 .note-has-grid .nav-link {
     padding: .5rem
 }
 .note-has-grid .single-note-item .card {
     border-radius: 10px;
 }
 .note-has-grid .single-note-item .favourite-note {
     cursor: pointer
 }
 .note-has-grid .single-note-item .side-stick {
     position: absolute;
     width: 3px;
     height: 70px;
     left: 0;
     background-color: #17B794;
 }
 .note-has-grid .single-note-item .category-dropdown.dropdown-toggle:after {
     display: none
 }
 .note-has-grid .single-note-item .category [class*=category-] {
     height: 15px;
     width: 15px;
     display: none
 }
 .note-has-grid .single-note-item .category [class*=category-]::after {
     content: "\f0d7";
     font: normal normal normal 14px/1 FontAwesome;
     font-size: 12px;
     color: #fff;
     position: absolute
 }
 .note-has-grid .single-note-item.note-business .category .category-business {
     display: inline-block
 }
 .note-has-grid .single-note-item.note-social .category .category-social {
     display: inline-block
 }
 .note-has-grid .single-note-item.note-important .category .category-important {
     display: inline-block
 }
 .note-has-grid .single-note-item.all-category .more-options,
 .note-has-grid .single-note-item.all-category.note-favourite .more-options {
     display: block
 }
 .note-has-grid .single-note-item.all-category.note-business .more-options,
 .note-has-grid .single-note-item.all-category.note-favourite.note-business .more-options,
 .note-has-grid .single-note-item.all-category.note-favourite.note-important .more-options,
 .note-has-grid .single-note-item.all-category.note-favourite.note-social .more-options,
 .note-has-grid .single-note-item.all-category.note-important .more-options,
 .note-has-grid .single-note-item.all-category.note-social .more-options {
     display: none
 }
 @media (max-width:767.98px) {
     .note-has-grid .single-note-item {
         max-width: 100%
     }
 }
 @media (max-width:991.98px) {
     .note-has-grid .single-note-item {
         max-width: 216px
     }
 }
                              
</style>
	<!-- 후기게시판 -->
<script type="text/javascript">
	$(function() {
	    $('#add-notes').on('click', function(event) {
	        $('#addnotesmodal').modal('show');
	        $('#btn-n-save').hide();
	        $('#btn-n-add').show();
	    })
	    // Button add
	    $("#btn-n-add").on('click', function(event) {
	        event.preventDefault();
	        /* Act on the event */
	        var today = new Date();
	      var dd = String(today.getDate()).padStart(2, '0');
	      var mm = String(today.getMonth()); //January is 0!
	      var yyyy = today.getFullYear();
	      var monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" ];
	      today = dd + ' ' + monthNames[mm]  + ' ' + yyyy;
	        var $_noteTitle = document.getElementById('note-has-title').value;
	        var $_noteDescription = document.getElementById('note-has-description').value;
	        $html =     '<div class="col-md-4 single-note-item all-category"><div class="card card-body">' +
	                                '<span class="side-stick"></span>' +
	                                '<h5 class="note-title text-truncate w-75 mb-0" data-noteHeading="'+$_noteTitle+'">'+$_noteTitle+'</h5>' +
	                                '<p class="note-date font-12 text-muted">'+today+'</p>' +
	                                '<div class="note-content">' +
	                                    '<p class="note-inner-content text-muted" data-noteContent="'+$_noteDescription+'">'+$_noteDescription+'</p>' +
	                                '</div>' +
	                                '<div class="d-flex align-items-center">' +
	                                    '<div class="ml-auto">' +
	                                    '</div>' +
	                                '</div>' +
	                            '</div></div> ';
	        $("#note-full-container").prepend($html);
	        $('#addnotesmodal').modal('hide');
	    });
	    $('#addnotesmodal').on('hidden.bs.modal', function (event) {
	        event.preventDefault();
	        document.getElementById('note-has-title').value = '';
	        document.getElementById('note-has-description').value = '';
	    })
// 	    $('#btn-n-add').attr('disabled', 'disabled'); 
	})
	 $('#note-has-title').keyup(function() {
	      var empty = false;
	      $('#note-has-title').each(function() {
	          if ($(this).val() == '') {
	                  empty = true;
	          }
	      });
	      if (empty) {
	          $('#btn-n-add').attr('disabled', 'disabled'); 
	      } else {
	          $('#btn-n-add').removeAttr('disabled');
	      }
	}); 
</script>
<!-- 검색바 -->
    <script>
//       var btnDelete = document.getElementById('clear');
//       var inputFocus = document.getElementById('inputFocus');
//       //- btnDelete.on('click', function(e) {
//       //-   e.preventDefault();
//       //-   inputFocus.classList.add('isFocus')
//       //- })
//       //- inputFocus.addEventListener('click', function() {
//       //-   this.classList.add('isFocus')
//       //- })
//       document.addEventListener('click', function(e)
//       {
//         if (document.getElementById('first').contains(e.target))
//         {
//           inputFocus.classList.add('isFocus')
//         }
//         else
//         {
//           // Clicked outside the box
//           inputFocus.classList.remove('isFocus')
//         }
//       });
    </script>


<body>
	<div class="gtco-services gtco-section" style="background-color: #eee;">
			<div class="gtco-container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 gtco-heading text-center">
						<h2>후기게시판</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus placerat enim et urna sagittis, rhoncus euismod erat tincidunt. Donec tincidunt volutpat erat.</p>
					</div>
				</div>
		
	<!-- 검색바 -->		
	 <div class="s128">
      <form>
        <div class="inner-form">
          <div class="row">
            <div class="input-field first" id="first">
              <input class="input" id="inputFocus" type="text" placeholder="선생님 이름으로 검색" />
            </div>
          </div>
        </div>
      </form>
    </div>

			<div class="container">
			<div class="row bootstrap snippets bootdeys">
		    <div class="page-content container note-has-grid">
    <ul class="nav nav-pills p-3 bg-white mb-3 rounded-pill align-items-center">  
        <li class="nav-item ml-auto">
            <a href="javascript:void(0)" class="nav-link btn-primary rounded-pill d-flex align-items-center px-3" id="add-notes"><span class="d-none d-md-block font-14">후기 쓰기</span></a>
        </li>
    </ul>
    
    <br><br>
    <div class="tab-content bg-transparent">
        <div id="note-full-container" class="note-has-grid row">
            <div class="col-md-4 single-note-item all-category" style="">
                <div class="card card-body">
                    <span class="side-stick"></span>
                    <h5 class="note-title text-truncate w-75 mb-0" data-noteheading="Book a Ticket for Movie">Book a Ticket for Movie</h5>
                    <p class="note-date font-12 text-muted">11 March 2009</p>
                    <div class="note-content">
                        <p class="note-inner-content text-muted" data-notecontent="Blandit tempus porttitor aasfs. Integer posuere erat a ante venenatis.">Blandit tempus porttitor aasfs. Integer posuere erat a ante venenatis.</p>
                    </div>
                </div>
            </div>

            <div class="col-md-4 single-note-item all-category" style="">
                <div class="card card-body">
                    <span class="side-stick"></span>
                    <h5 class="note-title text-truncate w-75 mb-0" data-noteheading="Book a Ticket for Movie">Book a Ticket for Movie</h5>
                    <p class="note-date font-12 text-muted">11 March 2009</p>
                    <div class="note-content">
                        <p class="note-inner-content text-muted" data-notecontent="Blandit tempus porttitor aasfs. Integer posuere erat a ante venenatis.">Blandit tempus porttitor aasfs. Integer posuere erat a ante venenatis.</p>
                    </div>
                </div>
            </div>
            
                        <div class="col-md-4 single-note-item all-category" style="">
                <div class="card card-body">
                    <span class="side-stick"></span>
                    <h5 class="note-title text-truncate w-75 mb-0" data-noteheading="Book a Ticket for Movie">Book a Ticket for Movie</h5>
                    <p class="note-date font-12 text-muted">11 March 2009</p>
                    <div class="note-content">
                        <p class="note-inner-content text-muted" data-notecontent="Blandit tempus porttitor aasfs. Integer posuere erat a ante venenatis.">Blandit tempus porttitor aasfs. Integer posuere erat a ante venenatis.</p>
                    </div>
                </div>
            </div>

            <div class="col-md-4 single-note-item all-category" style="">
                <div class="card card-body">
                    <span class="side-stick"></span>
                    <h5 class="note-title text-truncate w-75 mb-0" data-noteheading="Book a Ticket for Movie">Book a Ticket for Movie</h5>
                    <p class="note-date font-12 text-muted">11 March 2009</p>
                    <div class="note-content">
                        <p class="note-inner-content text-muted" data-notecontent="Blandit tempus porttitor aasfs. Integer posuere erat a ante venenatis.">Blandit tempus porttitor aasfs. Integer posuere erat a ante venenatis.</p>
                    </div>
                </div>
            </div>
            
                        <div class="col-md-4 single-note-item all-category" style="">
                <div class="card card-body">
                    <span class="side-stick"></span>
                    <h5 class="note-title text-truncate w-75 mb-0" data-noteheading="Book a Ticket for Movie">Book a Ticket for Movie</h5>
                    <p class="note-date font-12 text-muted">11 March 2009</p>
                    <div class="note-content">
                        <p class="note-inner-content text-muted" data-notecontent="Blandit tempus porttitor aasfs. Integer posuere erat a ante venenatis.">Blandit tempus porttitor aasfs. Integer posuere erat a ante venenatis.</p>
                    </div>
                </div>
            </div>

            <div class="col-md-4 single-note-item all-category" style="">
                <div class="card card-body">
                    <span class="side-stick"></span>
                    <h5 class="note-title text-truncate w-75 mb-0" data-noteheading="Book a Ticket for Movie">Book a Ticket for Movie</h5>
                    <p class="note-date font-12 text-muted">11 March 2009</p>
                    <div class="note-content">
                        <p class="note-inner-content text-muted" data-notecontent="Blandit tempus porttitor aasfs. Integer posuere erat a ante venenatis.">Blandit tempus porttitor aasfs. Integer posuere erat a ante venenatis.</p>
                    </div>
                </div>
            </div>
            
                        <div class="col-md-4 single-note-item all-category" style="">
                <div class="card card-body">
                    <span class="side-stick"></span>
                    <h5 class="note-title text-truncate w-75 mb-0" data-noteheading="Book a Ticket for Movie">Book a Ticket for Movie</h5>
                    <p class="note-date font-12 text-muted">11 March 2009</p>
                    <div class="note-content">
                        <p class="note-inner-content text-muted" data-notecontent="Blandit tempus porttitor aasfs. Integer posuere erat a ante venenatis.">Blandit tempus porttitor aasfs. Integer posuere erat a ante venenatis.</p>
                    </div>
                </div>
            </div>

            <div class="col-md-4 single-note-item all-category" style="">
                <div class="card card-body">
                    <span class="side-stick"></span>
                    <h5 class="note-title text-truncate w-75 mb-0" data-noteheading="Book a Ticket for Movie">Book a Ticket for Movie</h5>
                    <p class="note-date font-12 text-muted">11 March 2009</p>
                    <div class="note-content">
                        <p class="note-inner-content text-muted" data-notecontent="Blandit tempus porttitor aasfs. Integer posuere erat a ante venenatis.">Blandit tempus porttitor aasfs. Integer posuere erat a ante venenatis.</p>
                    </div>
                </div>
            </div>
            
                        <div class="col-md-4 single-note-item all-category" style="">
                <div class="card card-body">
                    <span class="side-stick"></span>
                    <h5 class="note-title text-truncate w-75 mb-0" data-noteheading="Book a Ticket for Movie">Book a Ticket for Movie</h5>
                    <p class="note-date font-12 text-muted">11 March 2009</p>
                    <div class="note-content">
                        <p class="note-inner-content text-muted" data-notecontent="Blandit tempus porttitor aasfs. Integer posuere erat a ante venenatis.">Blandit tempus porttitor aasfs. Integer posuere erat a ante venenatis.</p>
                    </div>
                </div>
            </div>

            <div class="col-md-4 single-note-item all-category" style="">
                <div class="card card-body">
                    <span class="side-stick"></span>
                    <h5 class="note-title text-truncate w-75 mb-0" data-noteheading="Book a Ticket for Movie">Book a Ticket for Movie</h5>
                    <p class="note-date font-12 text-muted">11 March 2009</p>
                    <div class="note-content">
                        <p class="note-inner-content text-muted" data-notecontent="Blandit tempus porttitor aasfs. Integer posuere erat a ante venenatis.">Blandit tempus porttitor aasfs. Integer posuere erat a ante venenatis.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Add notes -->
    <div class="modal fade" id="addnotesmodal" tabindex="-1" role="dialog" aria-labelledby="addnotesmodalTitle" style="display: none;" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content border-0">
                <div class="modal-header bg-info text-white">
                    <h5 class="modal-title text-white">후기 작성</h5>
                    <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="notes-box">
                        <div class="notes-content">
                            <form action="javascript:void(0);" id="addnotesmodalTitle">
                                <div class="row">
                                    <div class="col-md-12 mb-3">
                                        <div class="note-title">
                                            <label>한 줄 후기</label>
                                            <input type="text" id="note-has-title" class="form-control" minlength="25" placeholder="Title" />
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="note-description">
                                            <label>별점</label>
                                            <textarea id="note-has-description" class="form-control" minlength="60" placeholder="Description" rows="3"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button id="btn-n-save" class="float-left btn btn-success" style="display: none;">Save</button>
                    <button class="btn btn-danger" data-dismiss="modal">Discard</button>
                    <button id="btn-n-add" class="btn btn-info">Add</button>
                </div>
            </div>
        </div>
    </div>
</div>

			    
			</div>
			</div>
				
			</div>
		</div>
		<!-- END .gtco-services -->

<!-- footer include  -->
	<jsp:include
		page="${pageContext.request.contextPath}/WEB-INF/layout/main/footer.jsp"></jsp:include>


	</div>

	<div class="gototop js-top">
		<a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
	</div>
	
	<!-- jQuery -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
	<!-- countTo -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.countTo.js"></script>
	<!-- Carousel -->
	<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<!-- Magnific Popup -->
	<script src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/magnific-popup-options.js"></script>
	
	<!-- Main -->
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

	</body>
</html>