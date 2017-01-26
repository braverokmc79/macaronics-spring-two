<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>


<%@ include file="../include/header.jsp" %>

<%@ include file="../include/top_menu.jsp" %>
 
<%@ include file="../include/side_menu.jsp" %>   

<jsp:include page="../../session_check.jsp" />   
   
   
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">            
              <!--overview start-->
			  <div class="row">
				<div class="col-lg-12">
					<h3 class="page-header"><i class="icon_cart"></i> 장바구니 정보</h3>
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i><a href="/users/index">Home</a></li>
						<li><i class="icon_cart"></i>장바구니</li>						  	
					</ol>
				</div>
			</div>



<div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                            회원정보 Form
                          </header>
                          <div class="panel-body">
                             
                             
        
          <div class="aa-properties-content">
          
          <h3>${loginUser.username } 님 장바구니 내역</h3>
          <div style="text-align: right;"> 배송료 <span style="color:#D9534F">3</span>만원 이상 구입시 무료</div>  
           
         <c:choose>
         	<c:when test="${map.cartSize ==0 }">
         		<table class="table table-hover">
         			<tr>
         				<td style="text-align: center;">
         				<h3 > 장바구니 내역이 없습니다. </h3>
         				</td>
         			</tr>
         			<tr>
         				<td style="text-align: center;">
         				 <a href="/shop/products/list.do" class="btn btn-info">쇼핑 하기</a>
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

       <c:forEach items="${map.cartList }" var="row">
        <tr>      
          <td><img src="/products/img/${row.picture_url }" style="max-width: 150px; max-height: 100px;"></td>
          <td>${row.product_name }<span class="label label-warning">${row.product_state }</span></td>
          <td>￦<fmt:formatNumber value="${row.price }"  pattern="###,###" /></td>
         
          <td>
         <c:if test="${row.product_amount > 0}" > 
          <select onchange="amountChange(this.value, '${row.product_id}')">
         	 <c:forEach begin="1"  end="${row.product_amount }" var="i"> 
          	<c:choose>
          	<c:when test="${ i ==row.amount}">
          		<option value="${i }" selected="selected">${i }</option>
          	</c:when>
          	<c:otherwise>
          		<option value="${i}">${i }</option>
          	</c:otherwise>
          	</c:choose>	
          </c:forEach>
          </select>
          </c:if>
          <c:if  test="${ row.product_amount == 0 || empty row.product_amount}">
          	<span class="label label-danger" >품절</span>
          </c:if>
              
          </td>
          
          <td><span style="font-weight: bold;">￦<fmt:formatNumber value="${row.money }"  pattern="###,###" /></span></td>
          <td>￦<fmt:formatNumber value="${row.deliver_money }" pattern="###,###" /></td>
          <th scope="row"><button class="btn btn-danger" type="button"  onclick="cartDelete('${row.product_id}');">삭제</button></th>
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
               <h3 style="text-align: center; ">장바구니 총 내역</h3>
          
               <h3></h3>
               <!-- 마지막 List 가져오기 -->
                <c:set value="${map.cartList.get(map.cartList.size()-1) }" var="list" />
               
               <form method="post" action="/shop/order/prodeuctInsertOrder.do"  name="orderForm1"> 
               <table class="table table-hover">
                 <tbody>
                   <tr>
                     <th>장바구니 총 합계 금액</th>
                     <td>
                  		￦ <fmt:formatNumber  pattern="###,###"  value="${list.total_sum - list.total_deliver_money }" />  
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
                 		<input type="hidden" name="sum" value="${list.total_sum - list.total_deliver_money }" >
                 		<input type="hidden" name="total_deliver_money" value="${list.total_deliver_money }" >
                 		<input type="hidden" name="total_sum" value="${list.total_sum }" >
                 		 <button  class="btn btn-primary" id="cartOrder" type="button">주문하기</button>
                 		 <a href="/shop/products/list.do" class="btn btn-info">쇼핑 계속하기</a>
                 	</td>
                 	</tr>
                 </tfoot>
               </table>   
               
               </form>    
  		 </div>  	
         
         
  <!--  장바구니 내역 끝 -->
         
         	
         	</c:otherwise>
        
         </c:choose>  
           
       	
         </div>	
        
        
                       
                       
                          </div>
                      
                      </section>
          
                  
                  
                  </div>
              </div>








          </section>
         
         


    <div class="text-right">
        <div class="credits">
      <a href="http://macaronics.comlu.com/">Macaronics</a> by <a href="http://macaronics.comlu.com/">JUNHO CHOI</a>
        </div>
    </div>



      </section>
      <!--main content end-->
 
 
<script>
$(document).ready(function(){
	
	/* 주문하기 */

	var cartErrorMessage ="${cartErrorMessage}";
	if(	cartErrorMessage.length >3){
		alert(cartErrorMessage);
	}
	
	
	$("#cartOrder").click(function(){
		
		if(confirm("현 정보대로 주문을 하시겠습니까?")){
			
			document.orderForm1.submit();
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








