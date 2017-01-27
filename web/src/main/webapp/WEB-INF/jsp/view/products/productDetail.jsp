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
                 <li>공유</li>
                 <li><a href="https://ko-kr.facebook.com/" target="_blank"><i class="fa fa-facebook"></i></a></li>
                 <li><a href="https://twitter.com/?lang=ko" target="_blank"><i class="fa fa-twitter"></i></a></li>
                 <li><a href="https://plus.google.com/" target="_blank"><i class="fa fa-google-plus"></i></a></li>
                 <li><a href="https://kr.pinterest.com/" target="_blank"><i class="fa fa-pinterest"></i></a></li>
               </ul>
             </div>
            
             <!-- Nearby properties -->
             <div class="aa-nearby-properties">
               <div class="aa-title">
                 <h2>다른 고객님들이 이 상품과 함께 구매하신 상품</h2>
                 <span></span>
               </div>
               <div class="aa-nearby-properties-area">
                 <div class="row">
                 
                 <c:forEach items="${trp }"  var="row">
                   <div class="col-md-6">
                     <article class="aa-properties-item">
                        <a class="aa-properties-item-img" href="#">
                          <img alt="img" src="/products/img/${row.picture_url.substring(0,12) }${row.picture_url.substring(14)}" 
                          style="max-height:345px ;min-height:345px ; max-height: 345px; min-width: 345px;">
                        </a>
                     <c:if test="${row.product_state !='보통' }" >
                       	<c:choose>
                       		<c:when test="${row.product_state =='Best' }">
									<div class="aa-tag sold-out">
                     				베스트
                   	 			</div>
                       		</c:when>
                       		<c:when test="${row.product_state =='빅이벤트'}">
                       			<div class="aa-tag for-rent">
                     				빅이벤트
                   	 			</div>
                       		</c:when>
                       		<c:when test="${row.product_state =='Sale'}">
	                       	   <div class="aa-tag for-sale">
	                         		 세일
	                            </div>
                            </c:when>
                       	</c:choose>              	
                   	 
                    </c:if>
                        <div class="aa-properties-item-content">
                          <div class="aa-properties-info">
                        <span class="label label-warning">${row.product_state}</span>
                        <span>기본 배송비 : <fmt:formatNumber value="${row.deliver_money }" pattern="#,###"/>원</span>
                        <span>조회 : ${row.view_count}</span>
                        <span>남은 수량 :${ row.amount } EA</span>
                          </div>
                          <div class="aa-properties-about">
                            <h3><a href="/shop/products/detail.do/${row.product_id }">${row.product_name }</a></h3>
                      <c:choose>
				           <c:when test="${fn:length(row.description) > 14}">
				            <c:out value="${fn:substring(row.description, 0, 150)}"/>....
				           </c:when>
				           <c:otherwise>
				            <c:out value="${row.description}"/>
				           </c:otherwise> 
         			 </c:choose>
                                                  
                          </div>
                          <div class="aa-properties-detial">
                            <span class="aa-price">
                                   	￦<fmt:formatNumber value="${row.price }" pattern="#,###"/>
                            </span>
                            <a class="aa-secondary-btn" href="/shop/products/detail.do/${row.product_id }">상세보기</a>
                          </div>
                        </div>
                      </article>
                   </div>
                </c:forEach>  
                
                
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
              <h3>상품 검색</h3>
              <form action="">
                <div class="aa-single-advance-search">
                  <input type="text" placeholder="">
                </div>
                <div class="aa-single-advance-search">
                
                
                   <select class="form-control" id="categoryOne" onchange="CategoryOneChange()">
                    <c:forEach items="${ categoryOne}" var="row">
                    	<option value="${row.idx }" >${row.title }</option>
					</c:forEach>
                  </select>
                
                
                </div>
                <div class="aa-single-advance-search">
                  <select class="form-control" id="categoryTwo" onchange="categoryTwoChange()">

                  </select>
                </div>
                <div class="aa-single-advance-search">
                  <select class="form-control" id="categoryThree" >

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
                  <span>PRICE (원)</span>
                  <span>FROM</span>
                  <span id="skip-value-lower2" class="example-val">1,000</span>
                  <span>TO</span>
                  <span id="skip-value-upper2" class="example-val">2,000,000</span>
                  <div id="aa-price-range" class="noUi-target noUi-ltr noUi-horizontal noUi-background">
                  </div>      
                </div>
                <div class="aa-single-advance-search">
                  <input type="submit" value="검색" class="aa-search-btn">
                </div>
              </form>
            </div> 
           
           
            <!-- Start Single properties sidebar -->
            <div class="aa-properties-single-sidebar">
              <h3>인기 상품</h3>
             
             
             <c:forEach items="${vbp }" var="row">
             
              <div class="media">
                <div class="media-left">
                  <a href="/shop/products/detail.do/${row.product_id }">
                    <img class="media-object" src="/products/img/${row.picture_url}" alt="img">
                  </a>
                </div>
                <div class="media-body">
                  <h4 class="media-heading"><a href="/shop/products/detail.do/${row.product_id }">${row.product_name }</a></h4>
                    <c:choose>
				           <c:when test="${fn:length(row.description) > 14}">
				            <c:out value="${fn:substring(row.description, 0, 50)}"/>....
				           </c:when>
				           <c:otherwise>
				            <c:out value="${row.description}"/>
				           </c:otherwise> 
         			 </c:choose>              
                  <span class="label label-danger">￦<fmt:formatNumber value="${row.price }" pattern="###,###"/></span>
                </div>              
              </div>
     
     
		     </c:forEach>
     
           
           
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



<script>

$(document).ready(function(){
	
	
	//2차 카테고리 호출
	CategoryOneChange();
	
	
});


//1 카테고리 체인지
function CategoryOneChange(){
	
	var idx =$("#categoryOne").val();
	//2차카테고리 idx
	$("#categoryTwoIdx").val(idx);
	//3차카테고리 idx
	$("#categoryThreeIdx").val(idx);
	
	
	var categoryOenText =$("#categoryOne option:selected").text();
	if(categoryOenText.length<1){
		$("#categoryTwoP").text("1차 카테고리 먼저 입력 해 주세요.");
	}else{
		//2차카테고리 텍스트
		$("#categoryTwoP").text(categoryOenText);
		//3차카테고리 텍스트
		$("#categoryThreeP").text(categoryOenText);
	}
	//모달에 idx 전송
	$("#idx").val(idx);
	
	//2차 카테고리 목록 불러오기
	CategoryTowList(idx);
	

}

//2차 카테고리 목록 불러오기
function CategoryTowList(idx){
	
	
	$.getJSON("/categoryTwoList/"+idx , function(data){
		var str ="";
		
		$(data).each(function(){
			str +="<option value="+this.bno+" >"+this.title+"</option>";
			
		});
		$("#categoryTwo").html(str);
		$("#showCategoryTwo").html(str);
		
		//사이즈 호출
		//alert("2차 사이즈  :" +$("#categoryTwo option").size());
		//3차 카테고리 체인지
		var twoSize=$("#categoryTwo option").size();
		
		if(twoSize==0){
			//3차 숨김
			$("#list3").css("display","none");
			$("#showCategoryThree").html("");
		}else{
			//3차 보임
			$("#list3").css("display","");
		}
		categoryTwoChange();
		
		
	});
	
}


// 2차카테고리 체인지
function categoryTwoChange(){
		
	var bno =$("#categoryTwo").val();
	var bnoText=$("#categoryTwo option:selected").text();
	//alert("2차 체인지" +bno + "   :   "+ bnoText);
	//3차에 값 삽입
	$("#categoryThreeBno").val(bno);
	$("#categoryThreePtext").text(bnoText);
	
	CategoryThreeList(bno);
}



//3차 카테고리 목록 불러오기
function CategoryThreeList(bno){
	
	
	$.getJSON("/categoryThreeList/"+bno , function(data){
		var str ="";
		
		$(data).each(function(){
			str +="<option value="+this.rno+" >"+this.title+"</option>";
			
		});
		$("#categoryThree").html(str);
		$("#showCategoryThree").html(str);
		
		
	});
	
}




</script>


  
<%@ include file="../include/footer.jsp" %>
