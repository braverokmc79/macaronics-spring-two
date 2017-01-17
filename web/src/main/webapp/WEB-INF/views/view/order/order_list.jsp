<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ include file="../include/header.jsp" %>
<%@ include file="../include/topmenu.jsp" %>


<style type="text/css">

#aa-property-header {

 
  background-image: url("/resources/view/img/submenu/5.jpg");

  
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
            <h2>Payment Page</h2>
            <ol class="breadcrumb">
            <li><a href="/">HOME</a></li>            
            <li class="active">결제대기</li>
          </ol>
          </div>
        </div>
      </div>
    </div>
  </section> 
  <!-- End Proerty header  -->

<!--        	private Integer cart_id;
	private String userid;
	private String username;
	private Integer product_id;
	private String product_name;
	private Integer price;
	private Integer money;
	private Integer amount;
	
	private String picture_url;
	private Date cart_regdate; -->

  <!-- Start Properties  -->
  <section id="aa-properties">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
        
        
        
          <div class="aa-properties-content">
          
          <h3>${loginUser.username }님 결제 대기내역</h3>
          <div style="text-align: right;"> 배송료 <span style="color:#D9534F">3</span>만원 이상 구입시 무료</div>  
           
         <c:choose>
         	<c:when test="${map.orderSize ==0 }">
         		<table class="table table-hover">
         			<tr>
         			    <td style="text-align: center;">
         				<h3 > 결제 대기내역이 없습니다.</h3>
         				</td>
         			</tr>
         		</table>
         	</c:when>
         	
         	
         	<c:otherwise>
        <!--  장바구니 내역 시작 --> 	
         	
         	           <hr>         
      <!-- cart box -->
              <div class="table-responsive">
             
             
             
              <form method="post" action=""  name="form1">
			<table class="table table-hover">
     	 <thead>
      	  <tr>     
         <th>#</th>
          <th>상품명</th>
          <th>가격</th>
          <th>수량</th>
          <th>구매가격</th>
          <th>배송비</th>
          <th>#</th>
        </tr>
      </thead>
      <tbody>

       <c:forEach items="${map.orderList }" var="row">
        <tr>      
          <td><img src="/products/img/${row.picture_url }" style="max-width: 150px; max-height: 100px;"></td>
          <td>${row.product_name }<span class="label label-warning">${row.product_state }</span></td>
          <td>￦<fmt:formatNumber value="${row.price }"  pattern="###,###" /></td>
         
          <td>

			${row.amount}
			
       
          </td>
          
          <td><span style="font-weight: bold;">￦<fmt:formatNumber value="${row.money }"  pattern="###,###" /></span></td>
          <td>￦<fmt:formatNumber value="${row.deliver_money }" pattern="###,###" /></td>
          <th scope="row"></th>
        </tr>
        <tr>
     </c:forEach>    
      
      </tbody>
    </table>
    	<!-- 주문시 전송 폼 -->
    
    
		</form>
		
            </div>           
  <!-- cart box end-->         	        	
       <hr style="border:2px solid #66AD44 ;">
       <div class="table-responsive">
               <h3 style="text-align: center;" ><span style="text-decoration: underline; ">결제 대기내역</span></h3>
               <h3></h3>
               <!-- 마지막 List 가져오기 -->
                <c:set value="${map.orderList.get(map.orderList.size()-1) }" var="list" />
               <table class="table table-hover">
                 <tbody>
                   <tr>
                     <th>장바구니 총 합계 금액</th>
                     <td>
                  		￦ <fmt:formatNumber  pattern="###,###"  value="${list.sum }" />  
                     </td>
                   </tr>       
                   <tr>
                     <th>배송비</th>
                     <td>
                     <c:choose>
                     	<c:when test="${list.total_deliver_money  >0}">
                     	  ￦<fmt:formatNumber  pattern="###,###"  value="${list.total_deliver_money }" />  
                     	</c:when>
                     	<c:otherwise>
                     	   ￦ 0
                     	</c:otherwise>
                     </c:choose>
                         
                     </td>
                   </tr>
                   <tr>
                     <th>전체 총 합계 금액</th>
                     <td>
    
                  		￦ <fmt:formatNumber  pattern="###,###"  value="${list.total_sum }" />  
                     </td>
                   </tr>
                 </tbody>
                 <tfoot>
                 <tr>
                 	<td colspan="2" style="text-align: center;">
                 		 <button  class="btn btn-danger" id="paymentBtn" type="button">결제하기</button>
                 		 <a href="/shop/products/list.do" class="btn btn-info">쇼핑 계속하기</a>
                 	</td>
                 	</tr>
                 </tfoot>
               </table>       
  		 </div>  	
         
  <!--  결제 대기 내역 끝 -->
         	
         	</c:otherwise>
        
        
        
        
         </c:choose>  
           
       	
         </div>	
       
       
       
         
          </div>
        </div>
     
     
      </div>
   
  </section>
  <!-- / Properties  -->




<script>
$(document).ready(function(){

	var cartErrorMessage ="${cartErrorMessage}";
	if(	cartErrorMessage.length >3){
		alert(cartErrorMessage);
	}
	
	/* 주문하기 */
	$("#paymentBtn").click(function(){
		
		if(confirm("결제를 하시겠습니까?")){
			
			
		}
	});
	
	
});

function cartDelete(product_id){
	
	var userid ='${loginUser.userid}';
	
	if(confirm("정말 삭제 하시겠습니까?")){	
		location.href="/shop/cart/cartDelete.do?product_id="+product_id +"&userid="+userid;
		
	}
	
}

function amountChange(value, product_id){
	
	//alert(value + " : " +product_id);
	
	var userid ='${loginUser.userid}';
	var amount =value;
	
	location.href="/shop/cart/cartUpdate.do?product_id="+product_id +"&userid="+userid+"&amount="+amount;
	
}

</script>




  
<%@ include file="../include/footer.jsp" %>
