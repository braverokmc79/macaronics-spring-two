<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
      
      
<%@ include file="../include/header.jsp" %>      
      
<%@ include file="../include/top_menu.jsp" %>

<%@ include file="../include/side_menu.jsp" %>      
      
 
 
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">


    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        회원관리
        <small>회원정보</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">회원상세 정보</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
     
<div class="row">
        <!-- left column -->
        <div class="col-md-12">
          <!-- general form elements -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">${dto.username } 정보</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form"  method="post"  action="/admin/memberUpdate.do">
              <div class="box-body">
                                
                <div class="form-group">
                  <label for="userid">아이디 : </label>
                  <input type="text" required="required" aria-required="true"  value="${dto.userid }" class="form-control" readonly="readonly"   id="userid" name="userid">
                </div>
          
                
                <div class="form-group">
                  <label for="username">이름 : </label>
                 <input type="text" required="required" aria-required="true" value="${dto.username }" class="form-control"   id="username" name="username">
               
                </div>
          
          		<div class="form-group">
                  <label for="email">이메일 :</label>
                  <input type="email" required="required" aria-required="true" value="${dto.email }" class="form-control"   id="email" name="email">
                  
                </div>
          	
          		 <div class="form-group">
                  <label for="exampleInputEmail1">가입일 : </label>
                
                <fmt:formatDate  value='${dto.regdate }' pattern="yyyy-MM-dd HH:mm:ss"   />

                </div>
          
          
               <div class="form-group">
                  <label for="exampleInputEmail1">수정일 :</label>
                
          		 <fmt:formatDate  value="${dto.updatedate }"  pattern="yyyy-MM-dd HH:mm:ss"  />  
              
                </div>
          


              <div class="box-footer">
                <button type="submit" class="btn btn-success">수정하기</button>
                <button type="button" class="btn btn-danger" id="btnDelete">삭제하기</button>
                <a href="/admin/memberList.do"  class="btn btn-primary">회원 목록 보기</a>
              </div>
                
              </div>
            </form>
          </div>
          <!-- /.box -->


        </div>
        <!--/.col (left) -->
        
 </div>



    </section>
 


<script>

$(document).ready(function(){
	
	var message ='${message}';	
	
	if(message.length >3){
		alert(message);
	}
	
	
	$("#btnDelete").click(function(){
		
		if(confirm("정말 삭제 하시겠습니까?")){
			
			var form =$("form[role='form']");
			
			form.attr("action", "/admin/memberDelete.do");
			form.submit();
		}
		
	});
	
	
	
});


</script> 
   

  
<%@ include file="../include/content_footer.jsp" %>

  
<%@ include file="../include/control_sidebar.jsp" %>
  
  
<%@ include file="../include/footer.jsp" %>  
  
  
  




  