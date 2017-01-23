<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>

        
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
                  <small><c:choose>
				           <c:when test="${fn:length(row.description) > 14}">
				            <c:out value="${fn:substring(row.description, 0, 50)}"/>....
				           </c:when>
				           <c:otherwise>
				            <c:out value="${row.description}"/>
				           </c:otherwise> 
         			 </c:choose></small>              
                  <small class="label label-danger">￦<fmt:formatNumber value="${row.price }" pattern="###,###"/></small>
                </div>              
              </div>
     
     
		     </c:forEach>
     
            </div>
         
         
                           <!-- Start single sidebar -->
                  <div class="aa-blog-sidebar-single">                    
                    <div class="aa-banner-ads">
                      <a href="/coupon/couponList.do">
                        <img src="/resources/view/img/sidebar3.png" alt="banner img" 
                        style="min-width:320px; max-width:320px; min-height:600px; max-height:600px;">
                      </a>
                    </div>                    
                  </div>
         
         
         
          </aside>
        </div>
      





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

      
    