<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@ include file="../include/header.jsp" %>


<%@ include file="../include/topmenu.jsp" %>

<style type="text/css">

#aa-property-header {

 
  background-image: url("/resources/view/img/submenu/sub4.jpg");

  
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
            <h2>Blog Page</h2>
            <ol class="breadcrumb">
            <li><a href="#">HOME</a></li>            
            <li class="active">Blog</li>
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

  <!-- Start Blog  -->
  <section id="aa-blog">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-blog-area">
            <div class="row">
              <div class="col-md-8">
                <div class="aa-blog-content">
                  <div class="row">
                   <div class="box">
            <div class="box-header">
              <h3 class="box-title" style="margin-bottom: 30px;">Q & A 게시판</h3>

            <div class="box-body table-responsive no-padding">
  
              
              <table class="table table-hover">
                <tbody><tr>
                  <th>등록번호</th>
                  <th>글쓴이</th>
                  <th>제목</th>
                           
                  <th style="max-width: 150px;">등록일</th>  
                </tr>
 		
 		
 			<c:if test="${empty map.list}">
 				<tr>
 					<td colspan="5" style="text-align: center;">
 						등록된 게시물이 없습니다.
 					</td>
 				</tr>
 			</c:if>
 	
 		
   <c:forEach items="${map.list }" var="row">
		<tr >
		
		<td>
		  <c:choose>
		  	<c:when test="${row.depth==0 }">
		  	<span class="badge bg-purple">${row.idx }</span>
		  	</c:when>
		  	<c:otherwise>
		  	 &nbsp;&nbsp;&nbsp;&nbsp;<span class="label label-danger">답변</span>
		  	</c:otherwise>
		  </c:choose>	
		</td>
		
		<td>
		  <c:choose>
		  	<c:when test="${row.depth!=0 }">
		  	관리자
		  	</c:when>
		  	<c:otherwise>
		  	${row.userid }
		  	</c:otherwise>
		  </c:choose>	
		</td>
		
		<td>
			<c:choose>		  
				 <c:when test="${row.secret=='hide' }">
				 	비밀 게시 글입니다.
				 </c:when>
				 <c:otherwise> 
				  <c:choose>
				  	<c:when test="${row.depth==0 }">
				  	 <a href="/qna/read/${row.idx}">${row.subject }</a>
				  	</c:when>
				  	<c:otherwise>
				  	 &nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#D9534F">●</span>&nbsp;
				  	 <a href="/qna/read/${row.idx}">${row.subject }</a>
				  	</c:otherwise>
				  </c:choose>
		        </c:otherwise>		  
		  </c:choose>		  		
		</td>
		
		
		
		<td><fmt:formatDate   value="${row.regdate }"  pattern="yyyy-MM-dd hh:mm"  /></td>
	
		</tr>
	</c:forEach>
            
              </tbody>
              
              <tfoot>
              	
              </tfoot>
              
              </table>
            </div>
         
         
            </div>

         
          </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
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
                
                
                </div>
              
           
           
              </div>
          
                  
              <!-- Start blog sidebar -->
				<%@ include  file="../include/blogsidebar.jsp" %>
          
           
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- / Blog  -->



<script>
$(document).ready(function(){
	
	
	$("#btnWrite").click(function(){
				
		location.href="/board/write.do";
		
	});
	
	
	
});


function list(page){

	location.href='/qna/list'+page;

}

</script>




  
<%@ include file="../include/footer.jsp" %>
