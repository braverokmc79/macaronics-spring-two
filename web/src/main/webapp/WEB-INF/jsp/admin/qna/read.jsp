<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
     
<%@ include file="../include/header.jsp" %>      
      
<%@ include file="../include/top_menu.jsp" %>

<%@ include file="../include/side_menu.jsp" %>      
      

 
 
 
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">


    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Q & A
      </h1>
      <ol class="breadcrumb">
        <li><a href="/admin/index"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Q & A</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

<div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title"></h3>
           
            </div>
            <!-- /.box-header -->

            <div class="box-body" >
          
       
       
       
       <section class="content">
      <div class="row">
        <!-- left column -->
        <div class="col-md-12">
          <!-- general form elements -->
          <div class="box box-primary">
            <div class="box-header with-border">
               
      
            <!-- /.box-header -->
            <!-- form start -->
      
         
            <div class="box-body">
              <h3 class="box-title">Q & A</h3>
              
              
              <dl class="dl-horizontal">
				  <dt>제목</dt>
				  <dd>${vo.subject }</dd>
				  <dt>&nbsp;</dt>
				  <dd>&nbsp;</dd>
				  
				  <dt>유저</dt>
				  <dd>${vo.userid }</dd>
				   <dt>&nbsp;</dt>
				  <dd>&nbsp;</dd>
				  
				  <dt>내용</dt>
				  <dd>${vo.content }</dd>
			</dl>
				              
     
			<a href="/admin/qna/answerList" class="btn btn-success" >답변 목록 가기</a>	
			
     		  </div>
     
         
            
      
      
          </div>
          <!-- /.box -->
          
          <!-- /.box -->


        </div>
        <!--/.col (left) -->
        
        
 
      </div>
      <!-- /.row -->
    </section>
  	
       	
       		</div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
      </div>
    </section>











  
<%@ include file="../include/content_footer.jsp" %>

  
<%@ include file="../include/control_sidebar.jsp" %>
  
  
<%@ include file="../include/footer.jsp" %>  



  