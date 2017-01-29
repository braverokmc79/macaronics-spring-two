<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>

<%@ include file="view/include/header.jsp" %>
<%@ include file="view/include/topmenu.jsp" %>
  

  <!-- Start slider  -->
  <section id="aa-slider">
    <div class="aa-slider-area"> 
      <!-- Top slider -->
      <div class="aa-top-slider">
        <!-- Top slider single slide -->
        <div class="aa-top-slider-single">
          <img src="/resources/view/img/slider/3.jpg" alt="img">
          <!-- Top slider content -->
          <div class="aa-top-slider-content">
            <span class="aa-top-slider-catg">Duplex</span>
            <h2 class="aa-top-slider-title">1560 Square Feet</h2>
            <p class="aa-top-slider-location"><i class="fa fa-map-marker"></i>South Beach, Miami (USA)</p>
            <span class="aa-top-slider-off">30% OFF</span>
            <p class="aa-top-slider-price">$460,000</p>
            <a href="#" class="aa-top-slider-btn">Read More <span class="fa fa-angle-double-right"></span></a>
          </div>
          <!-- / Top slider content -->
        </div>
        <!-- / Top slider single slide -->
        <!-- Top slider single slide -->
        <div class="aa-top-slider-single">
          <img src="/resources/view/img/slider/2.jpg" alt="img">
          <!-- Top slider content -->
          <div class="aa-top-slider-content">
            <span class="aa-top-slider-catg">Duplex</span>
            <h2 class="aa-top-slider-title">1560 Square Feet</h2>
            <p class="aa-top-slider-location"><i class="fa fa-map-marker"></i>South Beach, Miami (USA)</p>
            <span class="aa-top-slider-off">30% OFF</span>
            <p class="aa-top-slider-price">$460,000</p>
            <a href="#" class="aa-top-slider-btn">Read More <span class="fa fa-angle-double-right"></span></a>
          </div>
          <!-- / Top slider content -->
        </div>
        <!-- / Top slider single slide -->
        <!-- Top slider single slide -->
        <div class="aa-top-slider-single">
          <img src="/resources/view/img/slider/1.jpg" alt="img">
          <!-- Top slider content -->
          <div class="aa-top-slider-content">
            <span class="aa-top-slider-catg">Duplex</span>
            <h2 class="aa-top-slider-title">1560 Square Feet</h2>
            <p class="aa-top-slider-location"><i class="fa fa-map-marker"></i>South Beach, Miami (USA)</p>
            <span class="aa-top-slider-off">30% OFF</span>
            <p class="aa-top-slider-price">$460,000</p>
            <a href="#" class="aa-top-slider-btn">Read More <span class="fa fa-angle-double-right"></span></a>
          </div>
          <!-- / Top slider content -->
        </div>
        <!-- / Top slider single slide -->       
         <!-- Top slider single slide -->
        <div class="aa-top-slider-single">
          <img src="/resources/view/img/slider/5.jpg" alt="img">
          <!-- Top slider content -->
          <div class="aa-top-slider-content">
            <span class="aa-top-slider-catg">Duplex</span>
            <h2 class="aa-top-slider-title">1560 Square Feet</h2>
            <p class="aa-top-slider-location"><i class="fa fa-map-marker"></i>South Beach, Miami (USA)</p>
            <span class="aa-top-slider-off">30% OFF</span>
            <p class="aa-top-slider-price">$460,000</p>
            <a href="#" class="aa-top-slider-btn">Read More <span class="fa fa-angle-double-right"></span></a>
          </div>
          <!-- / Top slider content -->
        </div>
        <!-- / Top slider single slide -->        
         <!-- Top slider single slide -->
        <div class="aa-top-slider-single">
          <img src="/resources/view/img/slider/4.jpg" alt="img">
          <!-- Top slider content -->
          <div class="aa-top-slider-content">
            <span class="aa-top-slider-catg">Duplex</span>
            <h2 class="aa-top-slider-title">1560 Square Feet</h2>
            <p class="aa-top-slider-location"><i class="fa fa-map-marker"></i>South Beach, Miami (USA)</p>
            <span class="aa-top-slider-off">30% OFF</span>
            <p class="aa-top-slider-price">$460,000</p>
            <a href="#" class="aa-top-slider-btn">Read More <span class="fa fa-angle-double-right"></span></a>
          </div>
          <!-- / Top slider content -->
        </div>
        <!-- / Top slider single slide -->
         <!-- Top slider single slide -->
        <div class="aa-top-slider-single">
          <img src="/resources/view/img/slider/6.jpg" alt="img">
          <!-- Top slider content -->
          <div class="aa-top-slider-content">
            <span class="aa-top-slider-catg">Duplex</span>
            <h2 class="aa-top-slider-title">1560 Square Feet</h2>
            <p class="aa-top-slider-location"><i class="fa fa-map-marker"></i>South Beach, Miami (USA)</p>
            <span class="aa-top-slider-off">30% OFF</span>
            <p class="aa-top-slider-price">$460,000</p>
            <a href="#" class="aa-top-slider-btn">Read More <span class="fa fa-angle-double-right"></span></a>
          </div>
          <!-- / Top slider content -->
        </div>
        <!-- / Top slider single slide -->
      </div>
    </div>
  </section>
  <!-- End slider  -->

  <!-- Advance Search -->
  <section id="aa-advance-search">
    <div class="container">
      <div class="aa-advance-search-area">
        <div class="form">
         <div class="aa-advance-search-top">
            <div class="row">
              <div class="col-md-4">
                <div class="aa-single-advance-search">
                  <input type="text" placeholder="" id="keyword">
                </div>
              </div>
              <div class="col-md-2">
                <div class="aa-single-advance-search">
                   <select class="form-control" id="categoryOne" onchange="CategoryOneChange()">
                    <c:forEach items="${ categoryOne}" var="row">
                    	<option value="${row.idx }" >${row.title }</option>
					</c:forEach>
                  </select>
                </div>
              </div>
              <div class="col-md-2">
                 <div class="aa-single-advance-search">
                  <select class="form-control" id="categoryTwo" onchange="categoryTwoChange()">

                  </select>
              </div>
              </div>
              <div class="col-md-2">
                 <div class="aa-single-advance-search">
                  <select class="form-control" id="categoryThree" >

                  </select>
              </div>
              </div>
              <div class="col-md-2">
                <div class="aa-single-advance-search">
                  <input class="aa-search-btn" type="submit" value="검색">
                </div>
              </div>
            </div>
          </div>
         <div class="aa-advance-search-bottom">
           <div class="row">
            <div class="col-md-6">
              <div class="aa-single-filter-search">
                <span>AREA (SQ)</span>
                <span>FROM</span>
                <span id="skip-value-lower" class="example-val">30.00</span>
                <span>TO</span>
                <span id="skip-value-upper" class="example-val">100.00</span>
                <div id="aa-sqrfeet-range" class="noUi-target noUi-ltr noUi-horizontal noUi-background">
                </div>                  
              </div>
            </div>
            <div class="col-md-6">
              <div class="aa-single-filter-search">
                <span>PRICE (원)</span>
                <span>FROM</span>
                <span id="skip-value-lower2" class="example-val">30.00</span>
                <span>TO</span>
                <span id="skip-value-upper2" class="example-val">100.00</span>
                <div id="aa-price-range" class="noUi-target noUi-ltr noUi-horizontal noUi-background">
                </div>      
              </div>
            </div>
          </div>  
         </div>
        </div>
      </div>
    </div>
  </section>
  <!-- / Advance Search -->

  <!-- About us -->
  <section id="aa-about-us">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-about-us-area">
            <div class="row">
              <div class="col-md-5">
                <div class="aa-about-us-left">
                  <a href="/shop/products/detail.do/${map.recommendProduct.product_id }" >
                  <img src="/products/img${map.recommendProduct.picture_url.substring(0,12) }${map.recommendProduct.picture_url.substring(14)}"  
                  style="min-width:432px; max-width:432px; min-height:334px; max-height:334px;" alt="img"></a>
                </div>
              </div>
              <div class="col-md-7">
                <div class="aa-about-us-right">
                  <div class="aa-title">
                    <h2>오늘의 추천 상품</h2>
                    <span></span>
                  </div>
                  <p>                  
                 ${map.recommendProduct.description}
                   </p>
                  <ul id="recommendUL">
                     <li><h3>${map.recommendProduct.product_name }</h3></li>
                  	<li><span class="label label-warning">${map.recommendProduct.product_state }</span></li>
                  	<li>￦ <fmt:formatNumber value="${map.recommendProduct.price }" pattern="###,###"/></li>
                  	<li><i class="glyphicon glyphicon-eye-open"></i> ${map.recommendProduct.view_count }</li>
                  	<li> <a href="/shop/products/detail.do/${map.recommendProduct.product_id }" class="aa-secondary-btn">상세보기</a></li>
                  </ul> 
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- / About us -->

  <!-- Latest property -->
  <section id="aa-latest-property">
    <div class="container">
      <div class="aa-latest-property-area">
        <div class="aa-title">
          <h2>신상품</h2>
          <span></span>
          <p>아침에 출근 도장 ${ serverTime } , Macaronics Shop 신규상품을 만나보세요!</p>         
        </div>
        <div class="aa-latest-properties-content">
          <div class="row">
        
            <c:forEach items="${map.newProductList }" var="row"> 
          
         
            <div class="col-md-4">
              <article class="aa-properties-item" style="min-width:360px; max-width:360px; min-height:435px; max-height:435px; ">
                <a href="/shop/products/detail.do/${row.product_id }" class="aa-properties-item-img">
                  <img src="/products/img/${row.picture_url.substring(0,12) }${row.picture_url.substring(14)}"  
                  style="min-width:360px; max-width:360px; min-height:220px; max-height:220px;" alt="img">
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
                    <span>5 Rooms</span>
                    <span>2 Beds</span>
                    <span>3 Baths</span>
                    <span>1100 SQ FT</span>
                  </div>
                  <div class="aa-properties-about" style="color:#666">
                    <h3><a href="/shop/products/detail.do/${row.product_id }">${row.product_name }</a></h3>
                    <c:choose>
				           <c:when test="${fn:length(row.description) > 14}">
				           <p> <c:out value="${fn:substring(row.description, 0, 60)}"/>..</p>
				           </c:when>
				           <c:otherwise>
				           <p> <c:out value="${row.description}"/></p>
				           </c:otherwise> 
         			 </c:choose>                      
               
                 
                  </div>
                  <div class="aa-properties-detial">
                    <span class="aa-price" style="color:#666">
                      		   ￦ <fmt:formatNumber value="${row.price }" pattern="###,###"  />
                    </span>
                    <a href="/shop/products/detail.do/${row.product_id }" class="aa-secondary-btn">상세보기</a>
                  </div>
                </div>
              </article>
            </div>
           
           
            </c:forEach>
           
           

          
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- / Latest property -->

  <!-- Service section -->
  <section id="aa-service">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-service-area">
            <div class="aa-title">
              <h2>Macraonics</h2>
              <span></span>
              <p>JUNHO CHOI , portfolio</p>
            </div>
            <!-- service content -->
            <div class="aa-service-content">
              <div class="row">
                <div class="col-md-3">
                  <div class="aa-single-service">
                    <div class="aa-service-icon">
                      <span class="fa fa-check"></span>
                    </div>
                    <div class="aa-single-service-content">
                      <h4><a href="http://macaronics.esy.es/">Flash &  PHP</a></h4>
                      <p>Development Date : 2010 년 4월 </p>
                      <p>참여도 : 100% 단독 portfolio</p>
                      </div>
                  </div>
                </div>
                <div class="col-md-3">
                  <div class="aa-single-service">
                    <div class="aa-service-icon">
                      <span class="fa fa-crosshairs"></span>
                    </div>
                    <div class="aa-single-service-content">
                      <h4><a href="http://www.han5200.or.kr/">Flash & ASP</a></h4>
                      <p>유지보수 : 2010 년 12월 </p>
                    </div>
                  </div>
                </div>
                <div class="col-md-3">
                  <div class="aa-single-service">
                    <div class="aa-service-icon">
                      <span class="fa fa-check"></span>
                    </div>
                    <div class="aa-single-service-content">
                      <h4><a href="http://braverokmc.dothome.co.kr/">CodeIgniter PHP</a></h4>
                      <p>Development Date : 2016 년 4월 </p>
                       <p>참여도 : 100% 단독 portfolio</p>
                    </div>
                  </div>
                </div>
                <div class="col-md-3">
                  <div class="aa-single-service">
                    <div class="aa-service-icon">
                      <span class="fa fa-crosshairs"></span>
                    </div>
                    <div class="aa-single-service-content">
                      <h4><a href="http://braverokmc.cafe24.com/MacaronicsServlet?command=index">MVC JSP</a></h4>
                      <p>Development Date : 2016년 8월</p>
                     <p>참여도 : 100% 단독 portfolio</p>
                    </div>
                  </div>
                </div>
                

                
                
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- / Service section -->

  <!-- Promo Banner Section -->
  <section id="aa-promo-banner">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-promo-banner-area">
            <h3>${couponVO.title }</h3>
            <p style="display: block;"><a href="/coupon/couponList.do?couponview=main">
            <img src="/coupon${couponVO.img_url.substring(0,12) }${couponVO.img_url.substring(14)}"  style="width: 200px; height:150px;"></a></p>
            <a href="/coupon/couponList.do?couponview=main" class="aa-view-btn">상세보기</a>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- / Promo Banner Section -->

  <!-- Our Agent Section-->
  <section id="aa-agents">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-agents-area">
            <div class="aa-title">
              <h2>이벤트 상품</h2>
              <span></span>
              <p >적립금 최대  1만원 증정</p>
            </div>
            <!-- agents content -->
            <div class="aa-agents-content">
              <ul class="aa-agents-slider">
                
              <c:forEach items="${map.eventProductList }" var="row">
              
              	          <li>       
                  <div class="aa-single-agents">
                    <div class="aa-agents-img">
                      <div class="aa-tag for-rent">
                     	<span class="label label-danger ">이벤트</span>
                   	 </div>
                     <a href="/shop/products/detail.do/${row.product_id }" ><img src="/products/img/${row.picture_url.substring(0,12) }${row.picture_url.substring(14)}"  
                  style="min-width:262px; max-width:262px; min-height:330px; max-height:330px;" alt="img"  alt="Event Products"></a> 
                    </div>
                    <div class="aa-agetns-info">
                      <h4><a href="#">${row.product_name }</a></h4>
                      <span class="label label-warning">SNS 공유시 상품 증정</span>
                      <div class="aa-agent-social">
                        <a href="https://ko-kr.facebook.com/" target="_blank"><i class="fa fa-facebook"></i></a>
                        <a href="https://twitter.com/?lang=ko" target="_blank"><i class="fa fa-twitter"></i></a>
                        <a href="https://kr.linkedin.com/"  target="_blank"><i class="fa fa-linkedin"></i></a>
                        <a href="https://plus.google.com/"  target="_blank"><i class="fa fa-google-plus"></i></a>
                      </div>
                    </div>
                  </div>
                </li>
              
              
              </c:forEach>  
                
      
     
     
             
             
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- / Our Agent Section-->

  <!-- Client Testimonial -->
  <section id="aa-client-testimonial">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
        
          <div class="aa-client-testimonial-area">
            <div class="aa-title">
              <h2>기획전 상품</h2>
              <span></span>
             
            </div>
            <!-- testimonial content -->
            <div class="aa-testimonial-content">
              <!-- testimonial slider -->
              <ul class="aa-testimonial-slider">
                
               <c:forEach items="${promotionsList }" var="row">
		               	<li>
		                  <div class="aa-testimonial-single" >
		                    <div class="aa-testimonial-img">
		                    <a href="/promotions/read.do/${row.idx }"><img src="/promotions${row.img_url.substring(0,12) }${row.img_url.substring(14)}" alt="${row.title }img"></a>             
		                    </div>
		                    <div >
		                      <p></p>
		                    </div>
		                    <div class="aa-testimonial-bio">
		                     <p>${row.title }</p>
		                     
		                    </div>
		                  </div>
		                </li>   
               </c:forEach> 

             
             
              </ul>
            </div>
          </div>
       
       
        </div>
      </div>
    </div>
  </section>
  <!-- Client Testimonial -->

  <!-- Client brand -->
  <section id="aa-client-brand">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-client-brand-area">
            <ul class="aa-client-brand-slider">
              <li>
                <div class="aa-client-single-brand">
                  <img src="/resources/view/img/client-brand-1.png" alt="brand image">
                </div>
              </li>
              <li>
                <div class="aa-client-single-brand">
                  <img src="/resources/view/img/client-brand-2.png" alt="brand image">
                </div>
              </li>
              <li>
                <div class="aa-client-single-brand">
                  <img src="/resources/view/img/client-brand-3.png" alt="brand image">
                </div>
              </li>
              <li>
                <div class="aa-client-single-brand">
                  <img src="/resources/view/img/client-brand-5.png" alt="brand image">
                </div>
              </li>
              <li>
                <div class="aa-client-single-brand">
                  <img src="/resources/view/img/client-brand-4.png" alt="brand image">
                </div>
              </li>
               <li>
                <div class="aa-client-single-brand">
                  <img src="/resources/view/img/client-brand-1.png" alt="brand image">
                </div>
              </li>
              <li>
                <div class="aa-client-single-brand">
                  <img src="/resources/view/img/client-brand-2.png" alt="brand image">
                </div>
              </li>
              <li>
                <div class="aa-client-single-brand">
                  <img src="/resources/view/img/client-brand-3.png" alt="brand image">
                </div>
              </li>
              <li>
                <div class="aa-client-single-brand">
                  <img src="/resources/view/img/client-brand-5.png" alt="brand image">
                </div>
              </li>
              <li>
                <div class="aa-client-single-brand">
                  <img src="/resources/view/img/client-brand-4.png" alt="brand image">
                </div>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- / Client brand -->

  <!-- Latest blog -->
  <section id="aa-latest-blog">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-latest-blog-area">
            <div class="aa-title">
              <h2>베스트 상품</h2>
              <span></span>
              <p>
              베스트오브베스트. 건강식품. 
              화장품. 가전상품. 가정용품. 주방용품 ... Macaronics : Shop 최고의 상품은? 
              </p>
              <p>Macaronics Mall에서 Best </p>
            </div>
            <div class="aa-latest-blog-content">
              <div class="row">
             
             <c:forEach items="${map.bestProductList }" var="row"> 
                <!-- start single blog -->
                <div class="col-md-4">
                  <article class="aa-blog-single">
                    <figure class="aa-blog-img">
                      <a href="/shop/products/detail.do/${row.product_id }">
                    <img src="/products/img/${row.picture_url.substring(0,12) }${row.picture_url.substring(14)}"  
                    style="min-width:360px; max-width:360px; min-height:240px; max-height:240px;" alt="img"  alt="Best Products"> 
                    </a>
                      <span class="aa-date-tag">BEST</span>
                    </figure>
                    <div class="aa-blog-single-content">
                      <h3><a href="#">${row.product_name }</a></h3>
                      <p>
                     <c:choose>
                     	<c:when test="${fn:length(row.description) >14 }">
                     		<c:out value="${fn:substring(row.description, 0, 60)}"/>..
                     	</c:when>
                     	<c:otherwise>
                     	  <c:out value="${row.description }" />
                     	</c:otherwise>
                     </c:choose>
                     </p>
                     
                      <div class="aa-blog-single-bottom">
                        <a href="/shop/products/detail.do/${row.product_id }" class="aa-blog-author"><i class="glyphicon glyphicon-gift"></i> ${row.category3_title }</a>
                        <a href="/shop/products/detail.do/${row.product_id }" class="aa-blog-comments"><i class="glyphicon glyphicon-eye-open"></i>${row.view_count }</a>
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
  </section>
  <!-- / Latest blog -->

<script>

$(document).ready(function(){
	
	
	//2차 카테고리 호출
	CategoryOneChange();
	
	
	//검색
	
	$(".aa-search-btn").click(function(event){
		event.preventDefault();
		var keyword=$("#keyword").val();

		var show =20;
		var curPage =1;
	
		//alert("검색 :" +keyword);
	
		var str='/shop/products/list.do?curPage='+curPage;
		str +='&show='+show;
		str +='&keyword='+keyword;
		location.href=str;
		
	});
	
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



  
<%@ include file="view/include/footer.jsp" %>
