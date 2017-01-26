<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>


<%@ include file="../include/header.jsp" %>

<%@ include file="../include/top_menu.jsp" %>
 
<%@ include file="../include/side_menu.jsp" %>   

<jsp:include page="../../session_check.jsp" />   
 
 
   
 
      <!--main content start-->
      <section id="main-content">
         
          <section class="wrapper">
          <form method="post" action="/users/memo/update" enctype="multipart/form-data" name="form1">
		  <div class="row">
				<div class="col-lg-12">
					<h3 class="page-header"><i class="fa fa-file-text-o"></i> 메모 수정하기 </h3>
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i><a href="index.html">Home</a></li>
						<li><i class="icon_document_alt"></i>memo</li>
						<li><i class="fa fa-file-text-o"></i>메모 수정</li>
					</ol>
				</div>
			</div>
              <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                            정보입력 (필수 사항 아님)
                          </header>
                          <div class="panel-body">
                              
                                  <div class="form-group" >
                                      <label class="col-sm-2 control-label">친구 이름</label>
                                      <div class="col-sm-10">
                                          <input type="text" class="form-control" name="friendName" value="${vo.friendName }">
                                      </div>
                                  </div>

       						  <hr>
                                  <div class="form-group">
                                      <label class="col-sm-2 control-label">이메일</label>
                                      <div class="col-sm-10">
                                          <input type="email" name="email" class="form-control round-input" value="${vo.email}">
                                      </div>
                                  </div>
                             
                           <hr style="border: 2px solid #fff;">   
                                  <div class="form-group">
                                      <label class="col-sm-2 control-label">전화번호</label>
                                      <div class="col-sm-10">
                                          <input class="form-control" name="phone"  type="text"  value="${vo.phone }">
                                      </div>
                                  </div>
                              
                            
                          </div>
                      </section>
              </div>
              </div>
                    
          
     
              <div class="row">
                  <div class="col-lg-12">                      

                      <div class="row">
                        
                         
                          <!-- CKEditor -->
                          <div class="col-lg-12">
                              <section class="panel">
                                  <header class="panel-heading">
                                      수정하기
                                  </header>
                                  <div class="panel-body">
                                      <div class="form">
                                          
                                              <div class="form-group">
                                                  <label class="control-label col-sm-2"></label>
                                                  <div class="col-sm-10">
                                                      <textarea class="form-control ckeditor" name="memo"  id="memo" rows="6">${vo.memo }</textarea>
                                                  </div>
                                              </div>
                                        <input type="hidden" value="${vo.idx }" name="idx">
                                         <input type="button" value="메모 수정하기" class="btn btn-primary" id="memoBtn" >
                                      </div>
                                  </div>
                              </section>
                          </div>
                      </div>
                  </div>
              </div>
              <!-- page end-->
        </form>
        
        
    <div class="text-right">
        <div class="credits">
      <a href="http://macaronics.comlu.com/">Macaronics</a> by <a href="http://macaronics.comlu.com/">JUNHO CHOI</a>
        </div>
    </div>
        
        
        
        
          </section>
     
     
     
      </section>
      <!--main content end-->
    
    


<script>
$(document).ready(function(){


	var errorMessage ="${errorMessage}";
	
	if(errorMessage.length > 1){
		alert(errorMessage);
	}
	
	$("#memoBtn").click(function(event){
		
		var ckeditor = CKEDITOR.instances['memo']; 
		
		if (ckeditor.getData()==""){
			 alert('내용을 입력 하세요');
		 	ckeditor.focus();
			 return;
		}
		
		if(ckeditor.getData().length >1000){
			alert('4000글자 이내로 내용을 입력 하세요');
		 	ckeditor.focus();
			 return;
		}
		
		document.form1.submit();
		
	});
	




	

	
});


</script>




 


    <!-- ck editor -->
    <script type="text/javascript" src="/resources/users/assets/ckeditor/ckeditor.js"></script>
    <!-- custom form component script for this page-->
    <script src="/resources/users/js/form-component.js"></script>
  
<%@ include file="../include/footer.jsp" %>








