<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@ include file="../include/header.jsp" %>


<%@ include file="../include/topmenu.jsp" %>




<style type="text/css">

#aa-property-header {

  background-image: url("/coupon/${coupon.img_url.substring(0, 12)}${coupon.img_url.substring(14)}");

  
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
            <h2>${coupon.title }</h2>
            <ol class="breadcrumb">
            <li><a href="/">HOME</a></li>            
            <li class="active">COUPON</li>
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
              <h2>Coupon  ${coupon.title }</h2>
              

              
              <span></span>
              <p></p>
            </div>
            <!-- Start gallery -->
            <div class="aa-gallery-content" style="text-align: center;">
              
              
              ${coupon.content }
            </div>
          
          
          </div>
          
          <hr>
          <div style="text-align: center;">
           <c:if test="${sessionScope.loginUser.userid ==vo.writer   || sessionScope.loginUser.member_level >=15}"> 	
           			<input type="hidden"  name="bno" value="${vo.bno }">
              			<a type="button" class="btn btn-warning" href="/admin/coupon/couponUpdateForm/${coupon.idx}">수정하기</a>
            <form action="/admin/coupon/coupondelete" method="post" class="form">
		 	<input type="hidden" value="${row.idx }"  name="idx">
		 	 <button class="label label-danger"  type="button" id="couponDelete">삭제하기</button>
		 	</form>
		
          	</c:if>
          </div>
        </div>
      </div>
    </div>
  </section>


  

<script>
$(document).ready(function(){
	
	$("#couponDelete").click(function(event){
		event.preventDefault();
		if(confirm("정말 삭제 하시겠습니까?")){
			
			$(this).parent(".form").submit();
			
		}
		
	});
		

});

</script>


  
<%@ include file="../include/footer.jsp" %>
