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
        메인 배너 등록  
      </h1>
      <ol class="breadcrumb">
        <li><a href="/admin/index"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">메인 배너 등록</li>
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
              <h3 class="box-title">현재 메인 배너 상품 등록 코드 &nbsp;  <span class="label pull-right bg-red" id="currentProductId">${vo.proudct_Id} </span> </h3> 
               
            </div>
            <!-- /.box-header -->
            <!-- form start -->
           
              <div class="box-body">
        
              
              
               <div class="form-group">
                  <label >상품 코드를 입력해 주세요</label>	
   					<input type="text"  numberonly="true" name="product_confirm_id" id="product_confirm_id" class="form-control"  placeholder="상품코드">
   					
                </div>
                   <div class="form-group">
   					<button type="button" class="btn btn-success" id="confirmBtn">상품코드 확인</button>	
                </div>
               
    		
    		      </div>
              <!-- /.box-body -->
               <form role="form2" method="post" action="/admin/mainBanner/update" enctype="multipart/form-data" >
                <div class="form-group">
                  <label for="categoryOneTitle">상품 번호</label>
                  
                   <input type="text" class="form-control"  name="proudct_Id"   id="proudct_Id" readonly="readonly" value="${vo.proudct_Id }">
                </div>
               
                 <div class="form-group">
                  <label for="categoryOneTitle">매인배너 텍스트 보이기</label>
                  
                  <select class="form-control"  name="display" id="dispaly">
                   	 <option value="show" <c:if test="${vo.display=='show' }" >selected</c:if> >show</option>
                   	 <option value="hide" <c:if test="${vo.display=='hide' }" >selected</c:if>>hide</option>
                   </select>
                </div>
               
                <div class="form-group">
                  <label for="categoryOneTitle">현재 배너 이미지</label>
                  
                  <img src="/mainbanner/${vo.img_url }"  class="form-control" style="max-width: 678px; min-height:200px; ; max-height: 452px">
               
                </div>
               
         
                <div class="form-group">
                  <label for="categoryOneTitle">배너 이미지 (1920 * 1280)</label>
                  
                   <input type="file" class="form-control"  name="file"   id="file" readonly="readonly">
                </div>
           
              <div class="box-footer">
              	 <input type="hidden" class="form-control"  name="oldImg"   id="oldImg" readonly="readonly" value="${vo.img_url}">
                <input type="hidden" class="form-control"  name="idx"   id="idx" readonly="readonly" value="${vo.idx }">
                <button type="submit" class="btn btn-primary" id="mainBannerSubmitBtn">메인 배너 수정</button>
   
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

	

		$(document).on("keyup", "input:text[numberOnly]", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});

		$(document).on("keyup", "input:text[datetimeOnly]", function() {$(this).val( $(this).val().replace(/[^0-9:\-]/gi,"") );});

		
		$("#confirmBtn").click(function(){
			var product_confirm_id =$("#product_confirm_id").val();
			
			if(product_confirm_id.length <1 ){
				alert("상품 코드를 입력해 주세요.");
				$("#product_confirm_id").focus();
				return false;
			}
			$.ajax({
				
				url :"/admin/recommended/confirmProductId",
				type:"post",
				data :{
					product_id:product_confirm_id
				},
				success:function(result){
					
					if(result=="SUCCESS"){
						alert("등록 가능한 상품 코드 입니다.");
						$("#product_confirm_id").val("");
						$("#proudct_Id").val(product_confirm_id);
						$("#currentProductId").html(product_confirm_id);
					}else if(result=="NOT"){
						alert("등록 할수 없는 상품 코드 입니다.");
						$("#product_confirm_id").val("");
						$("#product_confirm_id").focus();
					}
					
					
				},
			
			});
		
		});
		
		
		$("#mainBannerSubmitBtn").click(function(event){
			
			event.preventDefault();
			
			var product_id =$("#proudct_Id").val();
			var form=$("form[role='form2']");
			var file=$("#file").val();
			
			if(product_id==""){
				
				alert("상품 코드를 설정해 주세요!");
				
				return
			}
			
					
			
			if(file!=""){

			
				//이미지 체크		
				var thumbext = document.getElementById('file').value; //파일을 추가한 input 박스의 값

				thumbext = thumbext.slice(thumbext.indexOf(".") + 1).toLowerCase(); //파일 확장자를 잘라내고, 비교를 위해 소문자로 만듭니다.

				if(thumbext != "jpg"&& thumbext != "jpeg" && thumbext != "png" &&  thumbext != "gif" &&  thumbext != "bmp"){ //확장자를 확인합니다.

					alert('메인 배너 이미지 파일(jpg, png, gif, bmp)만 등록 가능합니다.');

					return;

				}	
			
			
			} 
			


			//용량 체크		
			  //var maxSize  = 7340032;    //7MB
			  var maxSize  = 3072000   //1MB
		    if ($('#file').val() != ""  ) { 
		       var size = document.getElementById("file").files[0].size;
			       
			       if(size > maxSize){
			        alert("첨부파일 사이즈는 3MB 이내로 등록 가능합니다.");
			           $('#file').val("");
			           $('#file').focus();
			             return false;
			         }
			 }

			
			form.submit();
			
		});
		
		
		
		
});	

</script>





  
<%@ include file="../include/content_footer.jsp" %>

  
<%@ include file="../include/control_sidebar.jsp" %>
  
  
<%@ include file="../include/footer.jsp" %>  
  