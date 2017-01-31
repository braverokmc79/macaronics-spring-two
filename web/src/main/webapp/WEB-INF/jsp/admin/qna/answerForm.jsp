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
        관리자 답변 등록  
      </h1>
      <ol class="breadcrumb">
        <li><a href="/admin/index"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">답변 등록</li>
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
      
  

         <form method="post"  action="/admin/qna/answerWrite"  name="form1" >
           
            <div class="box-body">
              <h3 class="box-title">Question</h3>
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
			
			<hr>
			
		
				
				<div class="form-group"  style="margin-top: 100px;">
                	 <h3 class="box-title" style="margin-top: 20px;">관리자 답변</h3>
                  
                    <div class="form-group">
                    <label class="control-label col-sm-2">내용</label>
                     <div class="col-sm-10">
                     <textarea class="form-control" name="content"  id="content" rows="6" onkeyup="chkword(this, 3500)"></textarea>
                      </div>
                     </div>
                     
                     
                     <input type="hidden" value="${vo.idx }" name="idx">
                     <input type="hidden" value="${vo.userid }" name="userid">
                     <input type="hidden" value="Re : ${vo.subject }" name="subject">
                     <input type="hidden" value="${vo.secret }" name="secret">
                     <input type="hidden" value="${vo.content }" name="qcontent" > 
                     
                     <input type="hidden" value="${vo.ref }" name="ref">
                     <input type="hidden" value="${vo.depth }" name="depth">
                     <input type="hidden" value="${vo.reorder }" name="reorder" > 
                     
                     
                     <input type="hidden" value="check" name="answer" > 
                     <input type="button" value="답변 등록하기" class="btn btn-success" id="btnRegister">
                     
   
                 </div>
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












<form action="/admin/shop/products/prodductDelete" method="post" name="deleteForm">

 <input type="hidden" name="product_id" id="hidden_product_id" >
</form>


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


	var errorMessage ="${errorMessage}";
	
	if(errorMessage.length > 1){
		alert(errorMessage);
	}
	
	
	$("#btnRegister").click(function(event){


		var content= $("#content");

		

		
		if(content.val()==""){
			alert("내용을 입력해주세요.");
			content.focus();
			return;
		}
		
		

		
		document.form1.submit();
	});
	


	
});


function chkword(obj, maxByte) {
	 
    var strValue = obj.value;
    var strLen = strValue.length;
    var totalByte = 0;
    var len = 0;
    var oneChar = "";
    var str2 = "";

    for (var i = 0; i < strLen; i++) {
        oneChar = strValue.charAt(i);
        if (escape(oneChar).length > 4) {
            totalByte += 2;
        } else {
            totalByte++;
        }

        // 입력한 문자 길이보다 넘치면 잘라내기 위해 저장
        if (totalByte <= maxByte) {
            len = i + 1;
        }
    }

    // 넘어가는 글자는 자른다.
    if (totalByte > maxByte) {
        alert(maxByte + "자를 초과 입력 할 수 없습니다.");
        str2 = strValue.substr(0, len);
        obj.value = str2;
        chkword(obj, 3500);
    }
}
</script>





  
<%@ include file="../include/content_footer.jsp" %>

  
<%@ include file="../include/control_sidebar.jsp" %>
  
  
<%@ include file="../include/footer.jsp" %>  



  