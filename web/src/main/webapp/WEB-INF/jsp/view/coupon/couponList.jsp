<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
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
            <h2>Coupon Page</h2>
            <ol class="breadcrumb">
            <li><a href="/">HOME</a></li>            
            <li class="active">Coupon</li>
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
              <h2>Coupon List</h2>
              <span></span>
              <p></p>
            </div>
            <!-- Start gallery -->
            <div class="aa-gallery-content">
              
              <!-- Start gallery image -->
              <div class="aa-gallery-body" id="aa-body">
              

			<c:forEach items="${couponList }" var="row">
			    <!-- start single gallery image -->
                <div class="aa-single-gallery" data-href="/coupon/read.do/${row.idx }">                  
                  <div class="aa-single-gallery-item">
                    <div class="aa-single-gallery-img"  >
                      <a href="/coupon/read.do/${row.idx }">
                      <img src="/coupon/${row.img_url.substring(0, 12)}${row.img_url.substring(14)}" 
                     
                      alt="${row.title}"></a>
                    </div>
                    <div class="aa-single-gallery-info" style="background-color: rgba(83, 83, 83, 0.3 ); width:380px; 
                    height:220px; top:-5px; left:-3px;">
                      <a href="#"><span class="fa fa-search"></span></a>
                    </div>  
                    <div class="portfolio-detail">
	                    <a href="#" class="modal-close-btn"><span class="fa fa-times"></span></a>
	                     <img src="/coupon/${row.img_url.substring(0, 12)}${row.img_url.substring(14)}" alt="${row.title}" />
	                    <h2>Macaronics Coupon</h2>
	                    <p>	${row.title}</p>
	                    <a href="/coupon/read.do/${row.idx }" class="view-project-btn">${row.title}</a>
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
	
	var couponview ="${param.couponview}";
	
	if(couponview=="main"){
		
		//alert("메인");
		var div =$("#aa-body:first") // body 에 선언된 첫번째 div
			
		var href=$(div).find(".aa-single-gallery").attr("data-href");
		//alert(href);
		location.href=href;
	}

});

</script>


  
<%@ include file="../include/footer.jsp" %>
