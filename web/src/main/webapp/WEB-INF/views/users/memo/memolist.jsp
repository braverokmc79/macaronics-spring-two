<%@page import="com.macaronics.www.util.xss.XssDefender"%>
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
					<h3 class="page-header"><i class="fa fa fa-bars"></i> Pages</h3>
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i><a href="/users/index">Home</a></li>
						<li><i class="fa fa-bars"></i>memo</li>
						<li><i class="fa fa-square-o"></i>메모 목록 ${map.countList } 개</li>
					</ol>
				</div>
			</div>
              <!-- page start-->
             
             
             <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                             <a href="/users/memo/memoWriteForm">한줄 메모 적기</a>
                          </header>
                         <div class="table-responsive"> 
                          <table class="table table-striped table-advance table-hover">
                           <tbody>
                              <tr>
                                 <th><i class="icon_profile"></i>친구이름</th>
                                 
                                 <th ><i class="fa fa-square-o"></i> 메모</th>
                                
                                 <th><i class="icon_mail_alt"></i> 이메일</th>
                                   <th><i class="icon_mobile"></i> 전화번호</th>
                                    <th><i class="icon_calendar"></i> 날짜</th>
                                 <th><i class="icon_cogs"></i> Action</th>
                              </tr>
                       
                       <c:if test="${ map.countList ==0 }">
                       		<tr>
                       			<td colspan="6" style="text-align: center;">
                       			
                       				 메모가 없습니다. 메모를 남겨 주세요.
                       				 
                       			</td>
                       		</tr>
                       </c:if>      
              			
              			 <c:forEach items="${memolist}" var="row"> 
                              <tr>
                                 <td>${row.rn }. ${ row.friendName }</td>
                                
                                <td> 
                       		
                                <c:choose>
                       
	                                 <c:when test="${fn:length(row.memo) >20 }">
	                                 	<a href="#" onclick="modalOpen(${row.idx})"><small><c:out value="${  XssDefender.removeTag(fn:substring(row.memo, 0, 20))}"/>....</small></a>
	                                 </c:when>
	                                <c:otherwise>
	                                	<a href="#" onclick="modalOpen(${row.idx})"><small><c:out value="${ XssDefender.removeTag(row.memo) }" /></small></a>
	                                </c:otherwise>
                                </c:choose>
                                </td>
                                 
                                
                                 <td>${ row.email }</td>
                                 <td>${ row.phone }</td>
                                 <td><fmt:formatDate value="${row.post_date }"  pattern="yyy-MM-dd HH:ss"/></td>
                                 

                                 <td>
                                  <div class="btn-group">
                                      <a class="btn btn-primary" href="#" onclick="modalOpen(${row.idx})"><i class="icon_plus_alt2"></i></a>
                                      <a class="btn btn-success" href="#"  onclick="memoAlter(${row.idx})"  ><i class="icon_check_alt2"></i> 수정</a>
                                      <a class="btn btn-danger" href="#"  onclick="memoDelete(${row.idx})"  ><i class="icon_close_alt2"></i> 삭제</a>
                                  </div>
                                  </td>
                              </tr>
             
                          </c:forEach>
     
                           </tbody>
                        </table>
     
                
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
      
     
 
 
 

<div class="modal fade" id="layerpop" >
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- header -->
      <div class="modal-header">
        <!-- 닫기(x) 버튼 -->
        <button type="button" class="close" data-dismiss="modal">×</button>
        <!-- header title -->
        <h4 class="modal-title">Header</h4>
      </div>
      <!-- body -->
      <div class="modal-body">
            Body
      </div>
      <!-- Footer -->
      <div class="modal-footer">
        
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>

</div>

 
 <form method="post" action="/users/memo/delete" name="deleteForm">
 <input type="hidden"  id="deleteIdx" name="idx">
 
 </form>
 
 
 
<script>
$(document).ready(function(){


	
});


function modalOpen(idx){
	
	$.getJSON("/users/memo/getmemo/"+idx, function(data){
				
		$(data).each(function(){
			// alert(this.memo);	
			 $(".modal-title").html(this.friendName);
			 $(".modal-body").html(this.memo);
		});
		
	});	
	
	$("#layerpop").modal("toggle");
	
}


function memoAlter(idx){
	
	location.href="/users/memo/alterform/" +idx;
	
}


function memoDelete(idx){
	
  if(confirm("정말 삭제 하시겠습니까?")){
		
	  $("#deleteIdx").val(idx);
		
		document.deleteForm.submit();
		
  }
	
}


function list(page){

	location.href='/users/memo/list.do'+page;

}
</script>
 
 
 
 
<%@ include file="../include/footer.jsp" %>








