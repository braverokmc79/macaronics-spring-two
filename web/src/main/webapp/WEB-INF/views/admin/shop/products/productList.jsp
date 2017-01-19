<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
     
<%@ include file="../../include/header.jsp" %>      
      
<%@ include file="../../include/top_menu.jsp" %>

<%@ include file="../../include/side_menu.jsp" %>      
      
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 


<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>      
      
 
 
 
 
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">


    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        상품 목록  
      </h1>

      
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Gallery</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
     

<div class="row">
        <div class="col-xs-12">



          <div class="box">
            <div class="box-header">
              <h3 class="box-title">상품</h3>
      <p style="margin-bottom: 50px;"></p>
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
                  <th>등록번호</th>
                  <th style="max-width: 150px;">이미지</th>
                  <th>상품이름</th>
                  <th>이벤트 상태 :조회수 </th>
                  <th> 카테고리</th>
                  <th style="max-width: 150px;">등록일</th>  
                </tr>
   
   
   <c:forEach items="${list }" var="row">
		<tr >
		
		<td><span class="badge bg-purple">${row.product_id }</span>
		
		<a href="/shop/products/detail.do/${row.product_id }"><span class="label label-primary">상세보기</span></a>
		 <a href=""><span class="label label-warning">수정하기</span></a>
		<a href=""><span class="label label-danger"> 삭제하기</span></a>
		
		</td>
		
		<td><img src="/products/img${row.picture_url }"  style="max-height: 100px; max-width: 100px;"></td>
		
		<td><a href="" >${row.product_name }</a></td>
		
		<td>${row.product_state }   : <span class="label label-primary">${row.view_count }</span></td>
		
		<td><span class="label label-primary">${row.category1_title }</span> > 
		<span class="label label-success">${row.category2_title }</span> >
		<span class="label label-danger">${row.category3_title }</span> </td>
		
		
		<td><fmt:formatDate   value="${row.regdate }"  pattern="yyyy-MM-dd hh:mm"  /></td>
		
		
		</tr>
	</c:forEach>
            
              </tbody>
              
              <tfoot>
              
              </tfoot>
              
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
       
     



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






<script>
  
$(document).ready(function(){

	
	
});
</script>







  
<%@ include file="../../include/content_footer.jsp" %>

  
<%@ include file="../../include/control_sidebar.jsp" %>
  
  
<%@ include file="../../include/footer.jsp" %>  
  