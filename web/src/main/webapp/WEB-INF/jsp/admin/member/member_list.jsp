<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
    
<%@ include file="../include/header.jsp" %>      
      
<%@ include file="../include/top_menu.jsp" %>

<%@ include file="../include/side_menu.jsp" %>      
      
 
 
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">


    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        회원관리
        <small>회원목록</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">회원목록</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
     

<div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">회원상태 테이블</h3>

              <div class="box-tools">
                <div class="input-group input-group-sm" style="width: 150px;">
                  <input type="text" name="table_search" class="form-control pull-right" placeholder="Search">

                  <div class="input-group-btn">
                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                  </div>
                </div>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
              <table class="table table-hover">
                <tbody><tr>
                  <th>아이디</th>
                  <th>이름</th>
                  <th>이메일</th>
                  <th>상태 </th>
                  <th>가입일</th> 
                </tr>
   
   
   <c:forEach items="${list }" var="row">
		<tr class="memberInfoTr" data-userid="${row.userid }">
		<td>${row.userid }</td>
		<td><a href="/admin/memberInfo.do?userid=${ row.userid}" >${row.username }</a></td>
		<td>${row.email }</td>
		<td><span class="label label-success" data-toggle="modal" data-target="#checkPw" >패스워드 체크</span></td>
		<td>${row.regdate }</td>
		</tr>
	</c:forEach>
              
              </tbody>
              
              
              
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
       
       
        </div>
      </div>





    </section>





  <div class="modal modal-danger" id="checkPw">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span></button>
          <h4 class="modal-title">패스워드 입력</h4>
        </div>
        <div class="modal-body">
          <input type="hidden" name="userid" id="modal_Id"  class="form-control" >
          <input type="text" name="confirmPassword" class="form-control" id="confirmPassword">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-outline" id="confirmPwd">패스워드 확인</button>
        </div>
      </div>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>
   <!-- /.modal -->

<script type="text/javascript">

$(document).ready(function(){
	
	
	$(".memberInfoTr").on("click", function(){
		var userid=$(this).attr("data-userid");
		$("#confirmPassword").val("");
		
		$("#modal_Id").val(userid);	
			
	
	});
	
	$("#confirmPwd").click(function(){
		var userid=$("#modal_Id").val();	
		var confirmPassword=$("#confirmPassword").val();
		if(confirmPassword.trim().length <1 ){
			alert("패스워드를 입력 하세요!");
			return;
		}
		
		$.ajax({
			
			type:"POST",
			url:"/admin/checkPwd",
			data: {
				userid :userid,
				confirmPassword :confirmPassword
			},
			dataType:"text",
			success:function(result){
				alert(result);
				
				
				$("#confirmPassword").val("");
			}
		});
		
	});
	
	
	
});


</script>


  
<%@ include file="../include/content_footer.jsp" %>

  
<%@ include file="../include/control_sidebar.jsp" %>
  
  
<%@ include file="../include/footer.jsp" %>  
  