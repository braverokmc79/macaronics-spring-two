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
            <!-- start properties content head -->
            <div class="aa-properties-content-head">              
              <div class="aa-properties-content-head-left">
                <form action="" class="aa-sort-form">
                  <label for="sortby">정렬</label>
                  <select name="sortby" onchange="sortBy()" id="sortby">
                    <option value="product_id"  <c:if test="${ param.sortby=='product_id' }" >selected</c:if>      >Default</option>
                    <option value="product_name"  <c:if test="${ param.sortby=='product_name' }" >selected</c:if>      >상품명</option>
                    <option value="price"  <c:if test="${ param.sortby=='price' }" >selected</c:if>      >가격</option>
                    <option value="regdate"  <c:if test="${ param.sortby=='regdate' }" >selected</c:if>      >등록일</option>
                  
                  </select>
                </form>
                <form action="" class="aa-show-form">
                  <label for="show">보기</label>
                  <select name="show" onchange="sortBy()" id="show" >
                    <option value="10" <c:if test="${ param.show=='10' }" >selected</c:if> >10</option>
                    <option value="20" <c:if test="${ param.show=='20' }" >selected</c:if>>20</option>
                    <option value="30" <c:if test="${ param.show=='30' }" >selected</c:if>>30</option>
                    <option value="50" <c:if test="${ param.show=='50' }" >selected</c:if>>50</option>
                    <option value="100" <c:if test="${ param.show=='100' }" >selected</c:if>>100</option>
                  </select>
                
          			<label for="show" >상품수 <span class="label label-danger" id="productCount">${map.countList }</span></label>
                </form>
              </div>
              <div class="aa-properties-content-head-right">
                <a id="aa-grid-properties" href="#"><span class="fa fa-th"></span></a>
                <a id="aa-list-properties" href="#"><span class="fa fa-list"></span></a>
              </div>            
            </div>
   
          
            <!-- Start properties content body -->
            <div class="aa-properties-content-body">
                <c:if test="${map.countList ==0}">
              		<div style="text-align: center; margin-top: 20px;">검색 결과가 없습니다.</div>
              	</c:if>
              
             
              <ul class="aa-properties-nav">
	
      
               <c:forEach items="${productList}" var="row">
              

              
                 <li>
                  <article class="aa-properties-item" >
                    <a class="aa-properties-item-img" href="/shop/products/detail.do/${row.product_id }">
                      <img alt="img" src="/products/img/${row.picture_url.substring(0,12) }${row.picture_url.substring(14)}" style="max-height:345px ;min-height:345px ; max-height: 345px; min-width: 345px;">
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
                      
                    <div class="aa-properties-item-content" >
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
				            <c:out value="${fn:substring(row.description, 0, 50)}"/>....
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
                </li>
       
              </c:forEach>  
             
              </ul>
            </div>
            <!-- Start properties content bottom -->
           
           
           
           
           
    <div class="aa-properties-content-bottom">
                        <nav>
                    
                          <ul class="pagination">
                           
                           <c:if test="${map.pager.curBlock  > 1 }">
                               <li>
                               <a aria-label="Previous" href="javascript:list('${pageAndSearch.searchQuery(1) }')">
                                <span aria-hidden="true">시작</span>
                              </a>
                              </li>
                           </c:if>
                           
                           <c:if test="${map.pager.curBlock  > 1 }">
                            <li>
                              <a aria-label="Previous" href="javascript:list('${pageAndSearch.searchQuery(map.pager.prevPage) }')">
                                <span aria-hidden="true">«</span>
                              </a>
                            </li>
                            </c:if>
   
                          <c:forEach begin="${ map.pager.blockBegin }"  end="${ map.pager.blockEnd }" var="page">
                           	<c:choose>
                           		<c:when test="${ page ==map.pager.curPage }">
                           			<li class="active"> 
                            		  <a href="javascript:list('${pageAndSearch.searchQuery(page) }')" >${page}</a>
                            		</li>
                           		</c:when>
                           		<c:otherwise>
                           			<li > 
                            		  <a href="javascript:list('${pageAndSearch.searchQuery(page) }')" >${page}</a>
                            		</li>	
                           		</c:otherwise>
                           	</c:choose>
                           
                          </c:forEach>
                    
           				<c:if test="${ map.pager.curBlock < map.pager.totBlock }">
                            <li>
                              <a aria-label="Next" href="javascript:list('${ pageAndSearch.searchQuery(map.pager.nextPage) }')">
                                <span aria-hidden="true">»</span>
                              </a>
                            </li>
                        </c:if> 
                        <c:if test="${map.pager.curPage < map.pager.totPage }">
                          <li>
                              <a aria-label="Next" href="javascript:list('${ pageAndSearch.searchQuery(map.pager.totPage) }')">
                                <span aria-hidden="true">끝</span>
                              </a>
                            </li>
                        </c:if>    
                          </ul>
                      
                      </nav>
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
                  <input type="text" placeholder=""  id="keyword" value="${param.keyword }">
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






<script type="text/javascript">



function list(page){

	location.href='/shop/products/list.do'+page;

}


</script>

<script>

$(document).ready(function(){
	
	
	//2차 카테고리 호출
	CategoryOneChange();
	
	
	//검색
	
	$(".aa-search-btn").click(function(event){
		event.preventDefault();
		var keyword=$("#keyword").val();
		
		var sortby =$("#sortby").val();
		var show =$("#show option:selected").val();
		var curPage ="${param.curPage}";
		var search_option="${param.search_option}";
		
		
		
		//alert("검색 :" +keyword);
	
		var str='/shop/products/list.do?curPage='+curPage+'&search_option='+search_option;
		str +='&sortby='+sortby;
		str +='&show='+show;
		str +='&keyword='+keyword;
		location.href=str;
		
	});
	
	//
	
	
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

function sortBy(){
	
	var sortby =$("#sortby").val();
	var show =$("#show option:selected").val();
	var curPage ="${param.curPage}";
	var search_option="${param.search_option}";
	var keyword="${param.keyword}";
	

	//alert(sortby + " : " + show);
	var str='/shop/products/list.do?curPage='+curPage+'&search_option='+search_option;
	str +='&sortby='+sortby;
	str +='&show='+show;
	str +='&keyword='+keyword;
	location.href=str;
}


</script>



  
<%@ include file="../include/footer.jsp" %>
