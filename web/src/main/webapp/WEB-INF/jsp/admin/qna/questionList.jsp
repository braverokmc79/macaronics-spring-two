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
        질문 목록  
      </h1>

      
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Question</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
     

<div class="row">
        <div class="col-xs-12">



          <div class="box">
            <div class="box-header">
              <h3 class="box-title">질문 등록수 <span class="badge bg-green">${map.countList }</span> </h3>
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
                  <th>유저아이디</th>
                  <th>제목</th>
                  <th>비밀글여부 </th>              
                  <th style="max-width: 150px;">등록일</th>  
                </tr>
 		
 		
 			<c:if test="${empty map.list}">
 				<tr>
 					<td colspan="5" style="text-align: center;">
 						등록된 질문이 없습니다.
 					</td>
 				</tr>
 			</c:if>
 	
 		
   <c:forEach items="${map.list }" var="row">
		<tr >
		
		<td><span class="badge bg-purple">${row.idx }</span>
		 <a href="/admin/qna/answerForm/${row.idx}"><span class="label label-warning">답변하기</span></a>
		</td>
		
		<td>${row.userid }</td>
		<td><a href="/admin/qna/read/${row.idx}">${row.subject }</a></td>
		<td>${row.secret }</td>
		
		
		<td><fmt:formatDate   value="${row.regdate }"  pattern="yyyy-MM-dd hh:mm"  /></td>
	
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
                    
     


          <!-- /.box -->
        </div>
      </div>

    </section>






<form action="/admin/shop/products/prodductDelete" method="post" name="deleteForm">

 <input type="hidden" name="product_id" id="hidden_product_id" >
</form>


  <div class="modal modal-danger" id="checkPw">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span></button>
          <h4 class="modal-title">패스워드 입력</h4>
        </div>
        <div class="modal-body">
          <input type="hidden" name="userid" id="modal_Id"  class="form-control" >
          <input type="text" name="confirmPassword" class="form-control" id="confirmPassword">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-outline" id="confirmPwd">패스워드 확인</button>
        </div>
      </div>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>
   <!-- /.modal -->






<script>
  
$(document).ready(function(){

	
	$("#couponDelete").click(function(event){
		event.preventDefault();
		if(confirm("정말 삭제 하시겠습니까?")){
			
			$(this).parent(".form").submit();
			
		}
		
	});
		
	
	
});

function list(page){

	location.href='/admin/qna/questionList'+page;

}

</script>

      
      
   
      



  
<%@ include file="../include/content_footer.jsp" %>

  
<%@ include file="../include/control_sidebar.jsp" %>
  
  
<%@ include file="../include/footer.jsp" %>  



  