<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@ include file="../include/header.jsp" %>


<%@ include file="../include/topmenu.jsp" %>




<style type="text/css">

#aa-property-header {

  background-image: url("/resources/view/img/submenu/sub05.jpg");

  
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
            <h2>Gallery Page</h2>
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



 <section id="aa-gallery">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-gallery-area">
            <div class="aa-title">
              <h2>Gallery View</h2>
              <span></span>
              <p></p>
            </div>
            <!-- Start gallery -->
            <div class="aa-gallery-content">
              
              <!-- Start gallery image -->
              <div class="aa-gallery-body">
              

			<c:forEach items="${galleryList }" var="row">
			
			
                <!-- start single gallery image -->
                <div class="aa-single-gallery">                  
                  <div class="aa-single-gallery-item">
                    <div class="aa-single-gallery-img">
                      <a href="#"><img src="/gallery/displayFile?fileName=${row.filePath }" alt="img"></a>
                    </div>
                    <div class="aa-single-gallery-info">
                      <a href="#"><span class="fa fa-search"></span></a>
                    </div>  
                    <div class="portfolio-detail">
	                    <a href="#" class="modal-close-btn"><span class="fa fa-times"></span></a>
	                    <img src="/gallery/displayFile?fileName=${row.filePath }" alt="img-2" />
	                    <h2>Mobile Application</h2>
	                    <p>	Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
	                    <a href="#" class="view-project-btn">${row.fileName}</a>
	                </div>               
                  </div>
                </div>
                
  			</c:forEach>
          
          
              
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>


  

<script>
$(document).ready(function(){
	
	

});

</script>


  
<%@ include file="../include/footer.jsp" %>
