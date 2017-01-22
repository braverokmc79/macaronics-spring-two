<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>

        
              <!-- Start blog sidebar -->
              <div class="col-md-4">
                <aside class="aa-blog-sidebar">
                  <!-- Start single sidebar -->
                  <div class="aa-blog-sidebar-single">
                    
                    
                    <form action="">
                      <div class="aa-blog-search">
                        <input type="text" placeholder="" class="form-control" id="keyword" value="${param.keyword }">
                        <button class="aa-search-submit" type="button" >
                          <i class="fa fa-search"></i>
                        </button>
                      </div>
                    </form>
                  
                  
                  
                  </div>
                  <!-- Start single sidebar -->
                  <div class="aa-blog-sidebar-single">
                    <h3>카테고리</h3>
                    
                    
                
                   <select class="form-control" id="categoryOne" onchange="CategoryOneChange()" style="margin-bottom: 5px;">
                    <c:forEach items="${ categoryOne}" var="row">
                    	<option value="${row.idx }" >${row.title }</option>
					</c:forEach>
                  </select>
                
                
                
                <div class="aa-single-advance-search">
                  <select class="form-control" id="categoryTwo" onchange="categoryTwoChange()" style="margin-bottom: 5px;">

                  </select>
                </div>
                
                
                <div class="aa-single-advance-search">
                  <select class="form-control" id="categoryThree" >

                  </select>
                </div>
                 
                 
                 
                  </div>
                  <!-- Start single sidebar -->

                  <!-- Start single sidebar -->
                  <div class="aa-blog-sidebar-single">
                    <h3>인기 상품</h3>
                    <div class="aa-blog-recent-post">
                   
  		
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
                  </div>
                  <!-- Start single sidebar -->
                  <div class="aa-blog-sidebar-single">                    
                    <div class="aa-banner-ads">
                      <a href="#">
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
	
	$(".aa-search-submit").click(function(event){
		event.preventDefault();
		var keyword=$("#keyword").val();
		
		var curPage =1;
		
		var str='/shop/products/list.do?curPage='+curPage;
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

      
      
    