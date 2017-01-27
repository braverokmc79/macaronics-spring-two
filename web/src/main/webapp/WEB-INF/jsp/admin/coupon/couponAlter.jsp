<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
     
<%@ include file="../include/header.jsp" %>      
      
<%@ include file="../include/top_menu.jsp" %>

<%@ include file="../include/side_menu.jsp" %>      
      
<style>

</style> 
 
 
 
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">


    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        쿠폰 수정
      </h1>
      <ol class="breadcrumb">
        <li><a href="/admin/index"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">쿠폰 수정</li>
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
               
            </div>
            <!-- /.box-header -->
            <!-- form start -->
              <form action="/admin/coupon/couponUpdate" method="post" enctype="multipart/form-data" name="form1">
              <div class="box-body">
   
               <div class="form-group">
                  <label >제목 </label>	
   					<input type="text"  name="title" id="title"  value="${CouponVO.title }" class="form-control"  placeholder="제목" >  					
                </div>
                
                <div class="form-group">
   					<label>이미지  (1920 * 1280)</label>
   					<input type="file" name="files" id="files" class="form-control" >	
   					<input type="hidden" value="${CouponVO.img_url }" name="oldImg" > 
   					<input type="hidden" value="${CouponVO.idx }" name="idx" >	
                </div>
                
                <div class="form-gorup" style="margin-bottom: 10px;">
                <label >기존 이미지</label>	
                	<img src="/coupon/${CouponVO.img_url }" >
                </div>
                
               
               
               <div class="form-group">
   					<label>내용</label>		
                 <textarea class="form-control" name="content" id="content">${CouponVO.content }</textarea>
               </div>
    		 </div>
              <!-- /.box-body -->
               
               
              <div class="box-footer">
                  
            <button type="button" class="btn btn-primary" id="couponBtn">쿠폰 수정하기</button>   
   
              </div>
            
            </form>
          
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





<script>
  
$(document).ready(function(){

			
	$("#couponBtn").click(function(){
		
		var title =$("#title").val();
		var files =$("#files").val();
		
		var ckeditor = CKEDITOR.instances['content']; 
		var img =document.form1.oldImg.value;
	
		//alert(img);
		
		if($.trim(title).length < 1){
			alert("제목을 입력해 주세요");
			$("#title").focus();
			return false;
		}
		
		
		if(img.length < 1){
			
			//이미지 체크		
			var thumbext = document.getElementById('files').value; //파일을 추가한 input 박스의 값

			thumbext = thumbext.slice(thumbext.indexOf(".") + 1).toLowerCase(); //파일 확장자를 잘라내고, 비교를 위해 소문자로 만듭니다.

			if(thumbext != "jpg"&& thumbext != "jpeg" && thumbext != "png" &&  thumbext != "gif" &&  thumbext != "bmp"){ //확장자를 확인합니다.

				alert('썸네일은 이미지 파일(jpg, png, gif, bmp)만 등록 가능합니다.');

				return;

			}
			
		}
		
		
	

		//용량 체크		
		  //var maxSize  = 7340032;    //7MB
		  var maxSize  = 3072000   //1MB
	    if ($('#files').val() != ""  ) { 
	       var size = document.getElementById("files").files[0].size;
		       
		       if(size > maxSize){
		        alert("첨부파일 사이즈는 3MB 이내로 등록 가능합니다.");
		           $('#files').val("");
		           $('#files').focus();
		             return false;
		         }
		 }

		
		
		if (ckeditor.getData()==""){
			 alert('내용을 입력 하세요');
		 	ckeditor.focus();
			 return;
		}
		
		document.form1.submit();
		
	});
		
	
	
		
});	





</script>


<script src="/resources/admin/plugins/ckeditor/ckeditor.js"></script>

<script>
  $(function () {
    // Replace the <textarea id="editor1"> with a CKEditor
    // instance, using default configuration.
	  CKEDITOR.replace( 'content', {//해당 이름으로 된 textarea에 에디터를 적용 <-- 이거 이름 부분입니다.
          width:'100%',
          height:'600px',
      //    extraPlugins : 'youtube',
         //여기 경로로 파일을 전달하여 업로드 시킨다. 
          // JSP, PHP 공통입니다. 경로를 적당히 적어줍니다.
        
         filebrowserImageUploadUrl: '/ckeditor/couponpload?path=coupon'	
          	
      });
    
    
  });
</script>




<div class="modal modal-info" id="categoryModalOne">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">×</span></button>
                <h4 class="modal-title"></h4>
              </div>
              <div class="modal-body">
                      <input type="hidden" name="idx" id="idx"  class="form-control" >
			          <input type="hidden" name="bno" id="bno"  class="form-control" >
			          rno :<input type="text" name="rno" id="rno"  class="form-control" >
			          <input type="text" name="title" class="form-control" id="title">
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-outline" id="modalSave">수정하기</button>
                <button type="button" class="btn btn-outline" id="modalSave2" style="display: none;" >수정하기</button>
                <button type="button" class="btn btn-outline" id="modalSave3" style="display: none;">수정하기</button>
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
</div>
  
<%@ include file="../include/content_footer.jsp" %>

  
<%@ include file="../include/control_sidebar.jsp" %>
  
  
<%@ include file="../include/footer.jsp" %>  
  