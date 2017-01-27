<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
     
<%@ include file="../include/header.jsp" %>      
      
<%@ include file="../include/top_menu.jsp" %>

<%@ include file="../include/side_menu.jsp" %>      
      
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
      
      
<script type="text/javascript" src="https://www.google.com/jsapi"></script>

 
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">


    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
         게시판 PDF 출력
      </h1>

      
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">PDF</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
     

<div class="row">
        <div class="col-xs-12">



          <div class="box">
            <div class="box-header">
              <h3 class="box-title"> Free 게시판 개수<span class="badge bg-green"> ${map.countList }</span> </h3>
    
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
  
       
                <div class="row">
                   <div class="box">
            <div class="box-header">
            <div class="col-md-12">
              <h3 class="box-title" style="margin-bottom: 10px;">Free 게시판
              
           
              </h3>
           </div>
              <div class="box-tools">	
              <form method="get" action="/board/listAll.do"  name="serarchForm">
              		<div class="row" style="margin-top: 20px; margin-bottom: 20px;">
    				<div class="col-md-4">
            	      
            	      <select name="search_option" class="form-control"  >
            	        <option value=""   <c:if test="${ pageAndSearch.search_option =='' }">selected="selected"</c:if>>----</option>
	                 	<option value="writer"   <c:if test="${ pageAndSearch.search_option =='writer' }">selected="selected"</c:if>>아이디</option>
	                 	<option value="username"   <c:if test="${ pageAndSearch.search_option =='username' }">selected="selected"</c:if>>이름</option>
	                 	<option value="content" <c:if test="${ pageAndSearch.search_option =='content' }">selected="selected"</c:if>>내용</option>
	                 	<option value="title" <c:if test="${ pageAndSearch.search_option =='title' }">selected="selected"</c:if>>제목</option>
	                 	<option value="all" <c:if test="${ pageAndSearch.search_option =='all' }">selected="selected"</c:if>>이름+내용+제목</option>
	                  </select>
	                  </div>
	               <div class="col-md-4">
				    <input type="text" class="form-control" name="keyword" value="${pageAndSearch.keyword }">
				    </div>
				    <div class="col-md-4">
  					<button type="submit" class="btn btn-warning">검색</button>
  					</div>
				 </div>
				 
              </form>

          
            </div>
              
               <div class="col-md-12">
              <p>  
               <span class="label label-danger"> ${map.countList }</span> 개의 게시물이 있습니다.
              </p>
              <p>
            	</div>
            </div>
            <!-- /.box-header -->
             <div class="col-md-12">
            <div class="box-body table-responsive no-padding">
              <table class="table table-hover">
                <tbody><tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>글쓴이</th>
                  <th>등록일</th>
                  <th>PDF</th>
                </tr>
     
       <c:forEach items="${map.list }"  var="row">
            
          <c:choose>
         	
         	<c:when test="${ row.show eq 'n' }">
         		<c:if test="${row.cnt == 0}">
					 <td colspan="5" style="text-align: center;">삭제 된 게시물 입니다.</td>         	
         		</c:if>
         		
         		<c:if test="${row.cnt > 0}">
         		    <td class="rowTitle" colspan="5" style="text-align: center;">          
        <a href="/board/view.do${pageAndSearch.searchQuery(param.curPage) }&bno=${row.bno }">삭제 된 게시물 입니다.
			  <c:if test="${row.cnt  > 0}">
				<span class="label label-danger">[ ${row.cnt }]</span>
			  </c:if>
 			     </a>
 			     </td>
 			   </c:if>
         </c:when>
         	
         	<c:otherwise>
                <tr>
                  <td>${row.bno }</td>
                 
                  <td class="rowTitle">          
        <a href="/board/view.do${pageAndSearch.searchQuery(param.curPage) }&bno=${row.bno }">${row.title } 
			  <c:if test="${row.cnt  > 0}">
				<span class="label label-danger">[ ${row.cnt }]</span>
			  </c:if>
 			     </a>
 			     </td>
 			     
 			     
                  <td>${ row.writer }</td>
                  <td><span class="label label-success">
                  <fmt:formatDate value="${ row.regdate }"  pattern="yyyy-MM-dd hh:mm"/></span>
                  </td>
                  <td class="pdfHref"><a href="/admin/pdf/boardWrite/${row.bno }" data-name="${row.title }" ><span class="badge bg-red">PDF 출력</span></a></td>
              </tr>
         	
         	
         	</c:otherwise>
         </c:choose>  
            
       </c:forEach>
         
              </tbody></table>
            </div>
            <!-- /.box-body -->
         
         	</div>
          </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="aa-properties-content-bottom"  style="text-align: center;">
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
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
       
    
           
           
     <div class="aa-properties-content-bottom">
          
                      
                      </div>
                    
     


          <!-- /.box -->
        </div>
      </div>

    </section>










<script>
  
$(document).ready(function(){

	
	
	
	$(".pdfHref").on("click" , "a" , function(event){
		
		event.preventDefault();
		var pdfUrl =$(this).attr("href");
		var title =$(this).attr("data-name");
		
		$.ajax({
			
			url :pdfUrl,
			type:"get",
			success:function(result){
				
				if(result=="SUCCESS"){
					alert("D:\\" + title+ ".pdf  로 PDF 파일이 출력 되었습니다.");	
				}
				
			}
		});
		
	});

	
});



function list(page){

	location.href='/admin/pdf/board'+page;

}


</script>







  
<%@ include file="../include/content_footer.jsp" %>

  
<%@ include file="../include/control_sidebar.jsp" %>
  
  
<%@ include file="../include/footer.jsp" %>  



  