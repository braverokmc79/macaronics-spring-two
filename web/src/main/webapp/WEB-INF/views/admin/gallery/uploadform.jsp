<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      
<%@ include file="../include/header.jsp" %>      
      
<%@ include file="../include/top_menu.jsp" %>

<%@ include file="../include/side_menu.jsp" %>      
      
<style>
.fileDrop{
	width:100%;
	height:300px;
	border:1px solid #DD4B39;
	background-color : rgba(221, 75, 57, 0.5);
	margin-top:50px;
}

small{
	margin-left:3px;
	font-weight:bold;
	color:gray;
}

.uploadedList{
	margin-top: 50px;
}
</style> 
 
 
 
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">


    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Gallery
        <small>이미지 업로드</small>
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
              <h3 class="box-title">이미지 업로드  - ( 370*220 ) : 7MB 이하</h3>

<div id="displayDiv7">

</div>


              <div class="box-tools">
                <div class="input-group input-group-sm" style="width: 150px;">
                 	
                </div>
              </div>
           <span style="text-align: center; margin-top:20px; color:red;">업로드할 이미지를 올려 주세요</span>
           
            </div>
            <!-- /.box-header -->
            <div class="fileDrop"></div>
       			
       		<div class="uploadedList">
       		<ul class="timeline">
	       		<li>
	              <i class="fa fa-camera bg-purple"></i>
	       		<div class="timeline-item">
                <span class="time"><i class="fa fa-clock-o"></i> 2 days ago</span>

                <h3 class="timeline-header"><a href="#">JUNHO CHOI</a> uploaded new photos</h3>
                   <div class="timeline-body"  id="galleryListId">
       			<c:forEach items="${list }" var="row">
       			
                  <img src="/gallery/displayFile?fileName=${row.filePath }" alt="${row.fileName }" class="margin">
                 
  	
       			
       			</c:forEach>
       			
       
       			
       		          </div>
    				</div> 
    			</li>	
    		 </ul>	      			
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



<script id="template6" type="text/x-handlebars-template">

<span>{{name}}</span>
<div>
	<span>{{userid}}</span>
	<span>{{addr}}</span>
</div>

   
</script>


<script>
  
$(document).ready(function(){
	

		$(".fileDrop").on("dragenter dragover", function(event){
       				event.preventDefault();
       	});
       		
       	$(".fileDrop").on("drop", function(event){
       				event.preventDefault();
       		
       				var files =event.originalEvent.dataTransfer.files;
       				
       				var file =files[0];
       				
       				var formData =new FormData();
       				formData.append("file", file);
       				$.ajax({
       					
       					url :"/gallery/uploadAjax",
       					data:formData,
       					dataType:'text',
       					processData :false,
       					contentType:false,
       					type:'POST',
       					success:function(result){
		
       						galleryList();	
       					}
       				});
       				
       	});

      
       	
       	function galleryList(){
       		      	   	
       		$.ajax({
       			
       			url :"/gallery/get_gallery_list",
       			type:"get",
       			dataType : "text",
       			contentType:"application/json",
       			complete:function(xhr, textSuccess){
       				if(textSuccess =='success')
       				{
       					
       				
       					window.location.reload(true);
       					
       					
       				}else{
       					alert("실패"+ xhr.responseText);
       				}
       			}
       			
       		});
       		
       	}
   	

});
   

</script>






<script id="template7" type="text/x-handlebars-template">
<span>{{name}}</span>
<div>
	<span>{{userid}}</span>
	<span>{{addr}}</span>
</div>

</script>


<script>


</script>



  
<%@ include file="../include/content_footer.jsp" %>

  
<%@ include file="../include/control_sidebar.jsp" %>
  
  
<%@ include file="../include/footer.jsp" %>  
  