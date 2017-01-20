<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/topmenu.jsp" %>


<style type="text/css">

#aa-property-header {

 
  background-image: url("/resources/view/img/submenu/3.jpg");

  
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
            <h2>Product Page</h2>
            <ol class="breadcrumb">
            <li><a href="#">HOME</a></li>            
            <li class="active">Products</li>
          </ol>
          </div>
        </div>
      </div>
    </div>
  </section> 
  <!-- End Proerty header  -->



  <!-- Start Properties  -->
  <section id="aa-properties">
    <div class="container">
      <div class="row">
        <div class="col-md-8">
          <div class="aa-properties-content">            
            <!-- Start properties content body -->
            <div class="aa-properties-details">
             <div class="aa-properties-details-img">
               <c:forEach items="${fullName }" var="img">
              	 <img src="/products/img/${img}" alt="img">
               </c:forEach>
               
             </div>
             <div class="aa-properties-info">
               <h2>${productDetail.product_name }</h2>
              	
            	 <c:if test="${productDetail.product_state !='보통' }" >
                       	<span class="btn btn-info" >${productDetail.product_state }</span>
                 </c:if>
              <span class="aa-price">&nbsp;&nbsp;&nbsp;￦<fmt:formatNumber value="${productDetail.price }"  pattern="#,###"/></span>
              <hr>
               <div class="row" style="margin-bottom: 30px;">
              <form method="post" action="/shop/cart/insert.do" name="form1">
             
               <input type="hidden" value="${ productDetail.product_id}" name="product_id" >
              
              <div class="col-md-4"><label>수량</label></div>
              <div class="col-md-4">
              	
               <c:choose>
               			<c:when test="${productDetail.amount >0 }">
							<select name=amount class="form-control">
               				<c:forEach begin="1" end="${productDetail.amount }" step="1" var="i">
               					<option value="${i}">${i}</option>
               					</c:forEach>
              				</select>
               			</c:when>
               			<c:otherwise>
               				<span class="label label-danger">품절</span>
               			</c:otherwise>
              	</c:choose>

               </div>
               <div class="col-md-4">
               <button class="btn btn-warning" type="button" onclick="cartAdd();">장바구니에 담기</button>
               <button class="btn btn-danger" type="button">구매하기</button>
               </div>
              
              </form>
              </div>
              <hr>
               
               <div class="col-md-12">${productDetail.description }
               <hr>
               <c:if test="${ not empty loginUser || not empty loginAdmin }">
                <a class="btn btn-warning" type="button" href="/admin/shop/products/productUpdateform/${productDetail.product_id}">(관리자) 상품 수정하기</a>
<a class="btn btn-danger" type="button" onclick="deleteProduct(${productDetail.product_id })"  href="#">(관리자) 상품 삭제하기</a>
              	 <hr>
               </c:if>
             
               <h4>상세정보</h4>
              
   
              <c:if test='${ request.getRequestURL().contains("50")}'>
               <ul>       
                 <%@ include file="deal.jsp" %>
               </ul>
             </c:if>
     			
     			
     			<p>
     			${productDetail.big_description }
     			</p>
     
     		</div>

             </div>
             <!-- Properties social share -->
             <div class="aa-properties-social">
               <ul>
                 <li>Share</li>
                 <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                 <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                 <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                 <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
               </ul>
             </div>
             <!-- Nearby properties -->
             <div class="aa-nearby-properties">
               <div class="aa-title">
                 <h2>Nearby Properties</h2>
                 <span></span>
               </div>
               <div class="aa-nearby-properties-area">
                 <div class="row">
                   <div class="col-md-6">
                     <article class="aa-properties-item">
                        <a class="aa-properties-item-img" href="#">
                          <img alt="img" src="img/item/1.jpg">
                        </a>
                        <div class="aa-tag for-sale">
                          For Sale
                        </div>
                        <div class="aa-properties-item-content">
                          <div class="aa-properties-info">
                            <span>5 Rooms</span>
                            <span>2 Beds</span>
                            <span>3 Baths</span>
                            <span>1100 SQ FT</span>
                          </div>
                          <div class="aa-properties-about">
                            <h3><a href="#">Appartment Title</a></h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim molestiae vero ducimus quibusdam odit vitae.</p>                      
                          </div>
                          <div class="aa-properties-detial">
                            <span class="aa-price">
                              $35000
                            </span>
                            <a class="aa-secondary-btn" href="#">View Details</a>
                          </div>
                        </div>
                      </article>
                   </div>
                   <div class="col-md-6">
                     <article class="aa-properties-item">
                      <a class="aa-properties-item-img" href="#">
                        <img alt="img" src="img/item/2.jpg">
                      </a>
                      <div class="aa-tag for-sale">
                        For Sale
                      </div>
                      <div class="aa-properties-item-content">
                        <div class="aa-properties-info">
                          <span>5 Rooms</span>
                          <span>2 Beds</span>
                          <span>3 Baths</span>
                          <span>1100 SQ FT</span>
                        </div>
                        <div class="aa-properties-about">
                          <h3><a href="#">Appartment Title</a></h3>
                          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim molestiae vero ducimus quibusdam odit vitae.</p>                      
                        </div>
                        <div class="aa-properties-detial">
                          <span class="aa-price">
                            $35000
                          </span>
                          <a class="aa-secondary-btn" href="#">View Details</a>
                        </div>
                      </div>
                    </article>
                   </div>
                 </div>
               </div>

             </div>

            </div>           
          </div>
        </div>
        <!-- Start properties sidebar -->
        <div class="col-md-4">
          <aside class="aa-properties-sidebar">
            <!-- Start Single properties sidebar -->
            <div class="aa-properties-single-sidebar">
              <h3>Properties Search</h3>
              <form action="">
                <div class="aa-single-advance-search">
                  <input type="text" placeholder="Type Your Location">
                </div>
                <div class="aa-single-advance-search">
                  <select id="" name="">
                   <option selected="" value="0">Category</option>
                    <option value="1">Flat</option>
                    <option value="2">Land</option>
                    <option value="3">Plot</option>
                    <option value="4">Commercial</option>
                  </select>
                </div>
                <div class="aa-single-advance-search">
                  <select id="" name="">
                    <option selected="" value="0">Type</option>
                    <option value="1">Flat</option>
                    <option value="2">Land</option>
                    <option value="3">Plot</option>
                    <option value="4">Commercial</option>
                  </select>
                </div>
                <div class="aa-single-advance-search">
                  <select id="" name="">
                    <option selected="" value="0">Type</option>
                    <option value="1">Flat</option>
                    <option value="2">Land</option>
                    <option value="3">Plot</option>
                    <option value="4">Commercial</option>
                  </select>
                </div>
                <div class="aa-single-filter-search">
                  <span>AREA (SQ)</span>
                  <span>FROM</span>
                  <span id="skip-value-lower" class="example-val">30.00</span>
                  <span>TO</span>
                  <span id="skip-value-upper" class="example-val">100.00</span>
                  <div id="aa-sqrfeet-range" class="noUi-target noUi-ltr noUi-horizontal noUi-background">
                  </div>                  
                </div>
                <div class="aa-single-filter-search">
                  <span>PRICE ($)</span>
                  <span>FROM</span>
                  <span id="skip-value-lower2" class="example-val">30.00</span>
                  <span>TO</span>
                  <span id="skip-value-upper2" class="example-val">100.00</span>
                  <div id="aa-price-range" class="noUi-target noUi-ltr noUi-horizontal noUi-background">
                  </div>      
                </div>
                <div class="aa-single-advance-search">
                  <input type="submit" value="Search" class="aa-search-btn">
                </div>
              </form>
            </div> 
            <!-- Start Single properties sidebar -->
            <div class="aa-properties-single-sidebar">
              <h3>Populer Properties</h3>
              <div class="media">
                <div class="media-left">
                  <a href="#">
                    <img class="media-object" src="img/item/1.jpg" alt="img">
                  </a>
                </div>
                <div class="media-body">
                  <h4 class="media-heading"><a href="#">This is Title</a></h4>
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>                
                  <span>$65000</span>
                </div>              
              </div>
              <div class="media">
                <div class="media-left">
                  <a href="#">
                    <img class="media-object" src="img/item/1.jpg" alt="img">
                  </a>
                </div>
                <div class="media-body">
                  <h4 class="media-heading"><a href="#">This is Title</a></h4>
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>                
                  <span>$65000</span>
                </div>              
              </div>
              <div class="media">
                <div class="media-left">
                  <a href="#">
                    <img class="media-object" src="img/item/1.jpg" alt="img">
                  </a>
                </div>
                <div class="media-body">
                  <h4 class="media-heading"><a href="#">This is Title</a></h4>
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>                
                  <span>$65000</span>
                </div>              
              </div>
            </div>
          </aside>
        </div>
      </div>
    </div>
  </section>
  <!-- / Properties  -->




<!-- Modal -->
<div class="modal fade"   id="myModal"  tabindex="-1"   role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog"  >
    <div class="modal-content" style="background-color: #F0AD4E;">
      <div class="modal-header">
     	 <div style="text-align:center; color:white;">
        <h4 class="modal-title" >장바구니에 담았습니다.</h4>
        </div>
      </div>
      <div class="modal-body" >
       <div style="text-align: center; ">
        <button type="button" class="btn btn-success" data-dismiss="modal">쇼핑계속하기</button>
        <button type="button" class="btn btn-primary" onclick="cartListGo()">장바구니 목록가기</button>
       </div>
      </div>

    </div>
  </div>
</div>



<script>
$(document).ready(function(){
	

	
	
});


function cartAdd(){
	
	var userid='${loginUser.userid}';
	var amount =document.form1.amount.value;
	var product_id=document.form1.product_id.value;
	//alert(userid + " : " +amount + " : " + product_id );
	if(userid.length <2){	
		alert("로그인을 먼저 하세요");
		return ;
	}

	$.ajax({
		
		url :"/shop/cart/insert.do/",
		type:"POST",
		dataType:"text",
		contentType:"application/json",
		data :JSON.stringify({
			amount:amount,
			product_id:product_id
		}),
		success:function(result){
				//alert(result);	
				
				$("#myModal").modal("show");
		}
		
	});
	
	
}


function cartListGo(){
	
	location.href="/shop/cart/list.do";
	
}
</script>




<form action="/admin/shop/products/prodductDelete" method="post" name="deleteForm">

 <input type="hidden" name="product_id" id="hidden_product_id" >
</form>




<script>

/* 삭제하기 */
$(document).ready(function(){
	var deleteErrorMessage ="${deleteErrorMessage}";
	if($.trim(deleteErrorMessage).length >1){
		alert(deleteErrorMessage);
	}	
	
});

function deleteProduct(product_id){
	//$(this).preventDefault();
	
	//alert(product_id);
	
	if(confirm("정말 삭제 하시겠습니까?")){
		
		$("#hidden_product_id").val(product_id);
		document.deleteForm.submit();
	}
	
}
</script>


  
<%@ include file="../include/footer.jsp" %>
