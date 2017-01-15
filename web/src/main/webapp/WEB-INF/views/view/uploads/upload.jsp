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
              <h3 class="box-title" style="margin-bottom: 10px;">업로드 테스트</h3>


              <div class="box-tools">	
           
   				<hr>
   				
           		
           		<div>
           		
           		<h5>업로드할 파일을 선택해 주세요.</h5>
           		<form action="/upload/uploadForm" method="post" enctype="multipart/form-data" role='form1'>
           			
           			<input type="file" name="file" class="form-control" id="fileName"> <br>
           		
           			<input type="submit" value="업로드" class="form-control" id="fileSubmit" >
           		
           		</form>
           		<c:if test="${not empty realName }">
           			<h3>업로드 된 파일 명 : ${realName }</h3>
           		
           		</c:if>	
           			
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
              <div class="col-md-4">
                <aside class="aa-blog-sidebar">
                  <!-- Start single sidebar -->
                  <div class="aa-blog-sidebar-single">
                    <form action="">
                      <div class="aa-blog-search">
                        <input class="aa-search-text" type="text" placeholder="Search...">
                        <button class="aa-search-submit" type="submit">
                          <i class="fa fa-search"></i>
                        </button>
                      </div>
                    </form>
                  </div>
                  <!-- Start single sidebar -->
                  <div class="aa-blog-sidebar-single">
                    <h3>Categories</h3>
                    <ul class="aa-blog-catg">
                      <li>Properties <span>15000</span></li>
                      <li>Apartment <span>5000</span></li>
                      <li>Office  <span>3000</span></li>
                      <li>Residential <span>4500</span></li>
                      <li>Commercial <span>1000</span>
                          <ul>
                            <li>category 2.1 <span>50</span></li>
                            <li>category 2.2 <span>100</span></li>
                          </ul>
                      </li>
                      <li>Villa <span>800</span></li>
                      <li>Bungalow  <span>200</span></li>
                      <li>News <span>375</span></li>
                      <li>Reviews <span>458</span></li>
                    </ul>
                  </div>
                  <!-- Start single sidebar -->
                  <div class="aa-blog-sidebar-single">
                    <h3>Tags</h3>
                    <div class="tag-cloud">
                      <a href="#">Apartment</a>
                      <a href="#">Propery</a>
                      <a href="#">Residential</a>
                      <a href="#">Commercial</a>
                      <a href="#">Office</a>
                      <a href="#">Rent</a>
                      <a href="#">Sale</a>
                      <a href="#">Villa</a>
                    </div>                    
                  </div>
                  <!-- Start single sidebar -->
                  <div class="aa-blog-sidebar-single">
                    <h3>Recent Post</h3>
                    <div class="aa-blog-recent-post">
                      <div class="media">
                        <div class="media-left">
                          <a href="#">
                            <img alt="img" src="img/blog-img-3.jpg" class="media-object">
                          </a>
                        </div>
                        <div class="media-body">
                          <h4 class="media-heading"><a href="#">This is Title</a></h4>
                          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>                
                          <span>15 April, 16</span>
                        </div>              
                      </div>
                      <div class="media">
                        <div class="media-left">
                          <a href="#">
                            <img alt="img" src="img/blog-img-2.jpg" class="media-object">
                          </a>
                        </div>
                        <div class="media-body">
                          <h4 class="media-heading"><a href="#">This is Title</a></h4>
                          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>                
                          <span>15 April, 16</span>
                        </div>              
                      </div>
                      <div class="media">
                        <div class="media-left">
                          <a href="#">
                            <img alt="img" src="img/blog-img-1.jpg" class="media-object">
                          </a>
                        </div>
                        <div class="media-body">
                          <h4 class="media-heading"><a href="#">This is Title</a></h4>
                          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>                
                          <span>15 April, 16</span>
                        </div>              
                      </div>
                    </div>                    
                  </div>
                  <!-- Start single sidebar -->
                  <div class="aa-blog-sidebar-single">                    
                    <div class="aa-banner-ads">
                      <a href="#">
                        <img src="img/banner-ads.jpg" alt="banner img">
                      </a>
                    </div>                    
                  </div>
                </aside>
              </div>
          
          
          
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



</script>


  
<%@ include file="../include/footer.jsp" %>
