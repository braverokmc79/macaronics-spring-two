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
		  <div class="row">
				<div class="col-lg-12">
					<h3 class="page-header"><i class="fa fa fa-bars"></i> Q&A</h3>
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i><a href="/users/index">Home</a></li>
						<li><i class="fa fa-bars"></i>Q&A</li>
						<li><i class="fa fa-square-o"></i>Q & A 목록 </li>
					</ol>
				</div>
			</div>
              <!-- page start-->
             
             
             <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                             <a href="/users/qna/registerform.do">1:1 문의</a>
                          </header>
                         <div class="table-responsive"> 
                          <table class="table table-striped table-advance table-hover">
                           <tbody>
                              <tr>
                                 <th>번호</th>
                                 
                                 <th> 제목</th>
                                
                                 <th>등록일</th>
                             
                                 <th><i class="icon_cogs"></i> Action</th>
                              </tr>
  	
   <c:forEach items="${map.list }" var="row">
		<tr >
		
		<td>
		  <c:choose>
		  	<c:when test="${row.depth==0 }">
		  	<span class="badge bg-purple">${row.idx }</span>
		  	</c:when>
		  	<c:otherwise>
		  	 &nbsp;&nbsp;&nbsp;&nbsp;<span class="badge bg-red">답변</span>
		  	</c:otherwise>
		  </c:choose>	
		</td>
		
		<td>
		  <c:choose>
		  	<c:when test="${row.depth==0 }">
		  	<a href="/users/qna/read/${row.idx}">${row.subject }</a>
		  	</c:when>
		  	<c:otherwise>
		  	 &nbsp;&nbsp;&nbsp;&nbsp;<span class="label label-danger">답변</span>&nbsp;
		  	 <a href="/users/qna/read/${row.idx}">${row.subject }</a>
		  	</c:otherwise>
		  </c:choose>		
		</td>
		
		
		<td><fmt:formatDate   value="${row.regdate }"  pattern="yyyy-MM-dd hh:mm"  /></td>
	
		  <td>
          <div class="btn-group">
              <a class="btn btn-primary" href="/users/qna/read/${row.idx}" ><i class="icon_plus_alt2"></i></a>
          </div>
          </td>
		</tr>
	</c:forEach>

                           </tbody>
                        </table>
     
            
                        </div>
                        
                        
                        
                                   
           
           
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
                    
                    
            
   
                        
                        
                        
                        
                        
                        
                      </section>
                  </div>
              </div>
           
    <div class="text-right">
        <div class="credits">
      <a href="http://macaronics.comlu.com/">Macaronics</a> by <a href="http://macaronics.comlu.com/">JUNHO CHOI</a>
        </div>
    </div>
          
          </section>
      </section>
      
      
      
<script type="text/javascript">



function list(page){

	location.href='/users/qna/qnaList'+page;

}


</script>     
      
      
 
<%@ include file="../include/footer.jsp" %>

