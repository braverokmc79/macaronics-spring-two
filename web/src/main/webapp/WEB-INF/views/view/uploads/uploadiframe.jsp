<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@ include file="../include/header.jsp" %>


<%@ include file="../include/topmenu.jsp" %>




<style type="text/css">

#aa-property-header {

  background-image: url("/resources/view/img/slider/1.jpg");

  
}
.rowTitle a:hover{

	background-color: #F0AD4E;
	color: #fff;
	padding: 5px;
	
	
	border-radius: 0.5em;
}
</style>


  <!-- Start Proerty header  -->
  <section id="aa-property-header">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-property-header-inner">
            <h2>Blog Page</h2>
            <ol class="breadcrumb">
            <li><a href="#">HOME</a></li>            
            <li class="active">Blog</li>
          </ol>
          </div>
        </div>
      </div>
    </div>
  </section> 
  <!-- End Proerty header  -->




<div class="row">
        <div class="col-xs-12">
     
        </div>
      </div>

  <!-- Start Blog  -->
  <section id="aa-blog">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-blog-area">
            <div class="row">
              <div class="col-md-8">
                <div class="aa-blog-content">
                  <div class="row">
                   <div class="box">
            <div class="box-header">
              <h3 class="box-title" style="margin-bottom: 10px;">Iframe 업로드 테스트</h3>


              <div class="box-tools">	
           
   				<hr>
   				
           		
           		<div>
           
           		<h5>업로드할 파일을 선택해 주세요.</h5>
           		<form action="/upload/uploadiframe" method="post" 
           		enctype="multipart/form-data" role='form1' target="zeroFrame" id="form1">
           			
           			<input type="file" name="file" class="form-control" id="fileName"> <br>
           		
           			<input type="submit" value="업로드" class="form-control" id="fileSubmit" >
           		
           		</form>
          		<h5 id="savedName"></h5>
          		<iframe name="zeroFrame" style="width: 0px; height: 0px; border: 0px;"></iframe>
          	
           			
           		</div>
			</div>

				<hr>
		
          	  </div>
             	
             	<hr>

             	
            
            </div>
 	
         	 </div>
                </div>
                  
               
                </div>
        
             
    
                 <!-- Start blog sidebar -->
				<%@ include  file="../include/blogsidebar.jsp" %>
          
          
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- / Blog  -->



<script>


$(document).ready(function(){
	
	
	$("#fileSubmit").click(function(event){
		
		event.preventDefault();
		
		var form=$("form[role='form1']");
		
	
	    var maxSize  = 7340032;    //7MB
	   
	    if($('#fileName').val().length < 1){
	    	alert("파일을 선택 해 주세요!");
	    	 return false;
	    }
	    
	    if ($('#fileName').val() != ""  ) { 
	        var size = document.getElementById("fileName").files[0].size;
	       
	         if(size > maxSize){
	               alert("첨부파일 사이즈는 7MB 이내로 등록 가능합니다.");
	               $('#fileName').val("");
	               $('#fileName').focus();
	                return false;
	            }
	    }
		
		form.submit();
			
		
	});

	
});



function addFilePath(msg){
	alert(msg);
	document.getElementById("form1").reset();
	$("#savedName").html(msg);
}

</script>


  
<%@ include file="../include/footer.jsp" %>
