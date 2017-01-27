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
        Mailbox
       <!--  <small>13 new messages</small> -->
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Mailbox</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-md-3">
          <a href="mailbox.html" class="btn btn-primary btn-block margin-bottom">보낸 메일함</a>

          <div class="box box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">폴더</h3>

              <div class="box-tools">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
            </div>
            <div class="box-body no-padding">
              <ul class="nav nav-pills nav-stacked">
                <li><a href="mailbox.html"><i class="fa fa-inbox"></i> 받은 편지함
                  <!-- <span class="label label-primary pull-right">12</span>--></a></li> 
                <li><a href="#"><i class="fa fa-envelope-o"></i> 보낸 이메일</a></li>
             
                <li><a href="#"><i class="fa fa-filter"></i>스펨처리<!--  <span class="label label-warning pull-right">65</span> --></a>
                </li>
                <li><a href="#"><i class="fa fa-trash-o"></i>삭제하기</a></li>
              </ul>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /. box -->
          <div class="box box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">라벨</h3>

              <div class="box-tools">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <ul class="nav nav-pills nav-stacked">
                <li><a href="#"><i class="fa fa-circle-o text-red"></i> 중요</a></li>
        <!--         <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> Promotions</a></li>
                <li><a href="#"><i class="fa fa-circle-o text-light-blue"></i> Social</a></li> -->
              </ul>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
         
          <div class="box box-primary">
           <form action="/admin/mail/send" method="post" enctype="multipart/form-data" name="form1">
            <div class="box-header with-border">
              <h3 class="box-title">새 메시지를 작성 </h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
           
           
          
              <div class="form-group">
                <label>발신자 이름 </label>
                <input class="form-control"  name="senderName">
              </div>
              
              <div class="form-group">
                <label>발신자 이메일 주소 </label>
                <input class="form-control"  name="senderMail" placeholder="from :">
              </div>
      
              <div class="form-group">
                <label>수신자 이메일 주소 </label>
                <input class="form-control" placeholder="To:" name="receiveMail" >
              </div>
              
              <div class="form-group">
                <label>제목 </label>
                <input class="form-control" placeholder="Subject:" name="subject">
              </div>
             
             
              <div class="form-group">
                 <label>내용 </label>
                    <textarea id="message" class="form-control" style="height: 300px" name="message"></textarea>

              
              
              </div>
              <div class="form-group">
                <div class="form-group">
                  <i class="fa fa-paperclip"></i> 파일첨부
                  <input type="file" name="files"  class="form-control" > 
                </div>
               <!--  <p class="help-block">Max. 32MB</p> -->
              </div>
             
            
            
            </div>
            <!-- /.box-body -->
            <div class="box-footer">
              <div class="pull-right">
                <button type="reset" class="btn btn-default" id="reset"><i class="fa fa-pencil"></i> 리셋</button>
                <button type="submit" class="btn btn-primary"><i class="fa fa-envelope-o"></i>보내기</button>
              </div>
  <!--             <button type="reset" class="btn btn-default"><i class="fa fa-times"></i> Discard</button> -->
            </div>
            <!-- /.box-footer -->
            
             </form>
          </div>
          <!-- /. box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  
  
<script src="/resources/admin/plugins/ckeditor/ckeditor.js"></script>
  
<script>

$(document).ready(function(){
	
	$("#reset").click(function(){
		
		
		document.form1.senderName.value("");
		document.form1.senderMail.value("");
		document.form1.receiveMail.value("");
		document.form1.subject.value("");
		
		
		
	});
	
	 // Replace the <textarea id="editor1"> with a CKEditor
    // instance, using default configuration.
	  CKEDITOR.replace( 'message', {//해당 이름으로 된 textarea에 에디터를 적용 <-- 이거 이름 부분입니다.
          width:'100%',
          height:'600px',
      //    extraPlugins : 'youtube',
         //여기 경로로 파일을 전달하여 업로드 시킨다. 
          // JSP, PHP 공통입니다. 경로를 적당히 적어줍니다.
        
         filebrowserImageUploadUrl: '/admin/mail/ckeditorupload'	
          	
      });
    
    
	
});


</script>




  
<%@ include file="../include/content_footer.jsp" %>

  
<%@ include file="../include/control_sidebar.jsp" %>
  
  
<%@ include file="../include/footer.jsp" %>  



  