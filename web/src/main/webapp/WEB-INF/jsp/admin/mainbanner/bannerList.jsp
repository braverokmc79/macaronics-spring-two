<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
     
<%@ include file="../include/header.jsp" %>      
      
<%@ include file="../include/top_menu.jsp" %>

<%@ include file="../include/side_menu.jsp" %>      
      
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 


<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>      
      
 
 
 
 
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">


    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        배너 목록  
      </h1>

      
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">banner</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
     

<div class="row">
        <div class="col-xs-12">



          <div class="box">
            <div class="box-header">
              <h3 class="box-title">배너 등록수 <span class="badge bg-green">${count }</span> </h3>
      <p style="margin-bottom: 50px;"></p>
              <div class="box-tools">
                <div class="input-group input-group-sm" style="width: 150px;">
         

         
                </div>
              </div>
            </div>
            <!-- /.box-header -->
                 <div style="margin-bottom: 15px;"> 
  
                 </div> 
            <div class="box-body table-responsive no-padding">
  
              
              <table class="table table-hover">
                <tbody><tr>
                  <th>등록번호</th>
                 <th>상품코드</th>
                  <th>상품이름</th>
                  <th>상품 이미지</th>
                  <th style="max-width: 150px;">상품 텍스트 숨김여부</th>  
                </tr>
 		
 		
	<c:if test="${count  ==0}">
 				<tr>
 					<td colspan="5" style="text-align: center;">
 						등록된 배너가 없습니다.
 					</td>
 				</tr>
 			</c:if> 
 		
 		
   <c:forEach items="${list }" var="row">

		<tr >	
		<td><span class="badge bg-purple">${row.idx }</span></td>
		<td><span > ${row.proudct_Id } </span></td>
		
		<td><a href="/shop/products/detail.do/${row.proudct_Id }" >${row.product_name }</a></td>
		<td>
			 <span class="label label-primary"><a href="/shop/products/detail.do/${row.proudct_Id }" >
			 <img src="/products/img${row.picture_url }" style="height: 150px; width: 150px;"></a></span></td>
		<td>
			<c:choose>
			  	<c:when test="${ row.display =='show'}">
			  	<span class="badge bg-green">${ row.display}</span>
			  	</c:when>
			    <c:otherwise>
			    	<span class="badge bg-red">${ row.display}</span>
			    </c:otherwise>
		    </c:choose>
		</td>
		</tr>
		<tr>
			<td style="text-align: center">
			<div>
		 <a href="/admin/mainBanner/updateForm/${row.idx}"><span class="label label-warning">수정하기</span></a>
		 
		 <form action="/admin/mainBanner/delete" method="post" class="form">
		 	<input type="hidden" value="${row.idx }"  name="idx">
		  <button class="label label-danger"  type="button" id="mainBannerDelete">삭제하기</button>
		 </form>
		 </div>
			</td>
			<td colspan="3" style="text-align: center">
			<div><img src="/mainbanner/${row.img_url }"  style="max-height: 300px; max-width: 700px;"></div>
			</td>
		</tr>
		
	</c:forEach>
            
              </tbody>
              
              <tfoot>
              
              </tfoot>
              
              </table>
            </div>
            <!-- /.box-body -->
       </div>
          <!-- /.box -->
         
<%--            
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
                    
     
     --%>      <!-- /.box -->
        </div>
      </div>

    </section>









<script>
  
$(document).ready(function(){

	
	$("#mainBannerDelete").click(function(event){
		event.preventDefault();
		if(confirm("정말 삭제 하시겠습니까?")){
			
			$(this).parent(".form").submit();
			
		}
		
	});
		
	
	
});

function list(page){

	location.href='/admin/promotions/promotionsList'+page;

}

</script>





  
<%@ include file="../include/content_footer.jsp" %>

  
<%@ include file="../include/control_sidebar.jsp" %>
  
  
<%@ include file="../include/footer.jsp" %>  



  