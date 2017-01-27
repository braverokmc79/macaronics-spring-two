<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
     
<%@ include file="../../include/header.jsp" %>      
      
<%@ include file="../../include/top_menu.jsp" %>

<%@ include file="../../include/side_menu.jsp" %>      
      
<style>

</style> 
 
 
 
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">


    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        오늘의 추천 상품 등록  
      </h1>
      <ol class="breadcrumb">
        <li><a href="/admin/index"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">오늘의 추천 상품</li>
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
              <h3 class="box-title">현재 오늘의 추천 상품 등록 코드 &nbsp; <span class="label pull-right bg-red"> ${currentId }</span> </h3>
               
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
               <form role="form2" method="post" action="/admin/recommended/register" >
                <div class="form-group">
                  <label for="categoryOneTitle"></label>
                  
                   <input type="text" class="form-control"  name="product_id"   id="product_id" readonly="readonly">
                </div>
             
              <div class="box-footer">
                <button type="submit" class="btn btn-primary" id="categoryOneSubmitBtn">오늘의 추천 상품으로 등록</button>
   
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
						$("#product_id").val(product_confirm_id);
					}else if(result=="NOT"){
						alert("등록 할수 없는 상품 코드 입니다.");
						$("#product_confirm_id").val("");
						$("#product_confirm_id").focus();
					}
					
					
				},
			
			});
		
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
  
<%@ include file="../../include/content_footer.jsp" %>

  
<%@ include file="../../include/control_sidebar.jsp" %>
  
  
<%@ include file="../../include/footer.jsp" %>  
  