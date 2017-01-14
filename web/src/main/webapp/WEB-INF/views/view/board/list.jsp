<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
              <h3 class="box-title" style="margin-bottom: 10px;">Free 게시판</h3>

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
      <c:if test="${ not empty  loginUser}" >      
       <p class="input-group input-group-sm" style="margin-top :10px;"><button id="btnWrite" class="btn btn-primary" >글쓰기</button></p>
	</c:if>            
            </div>
              
             
              <p>  
               <span class="label label-danger"> ${map.countList }</span> 개의 게시물이 있습니다.
              </p>
              <p>
            
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
              <table class="table table-hover">
                <tbody><tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>글쓴이</th>
                  <th>등록일</th>
                  <th>조회수</th>
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
                  <td> <span class="badge bg-red">${ row.viewcnt }</span></td>
              </tr>
         	
         	
         	</c:otherwise>
         </c:choose>  
            
       </c:forEach>
         
              </tbody></table>
            </div>
            <!-- /.box-body -->
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
              <div class="col-md-4">
                <aside class="aa-blog-sidebar">
                  <!-- Start single sidebar -->
                  <div class="aa-blog-sidebar-single">
                    <form action="">
                      <div class="aa-blog-search">
                        <input class="aa-search-text" type="text" placeholder="Search...">
                        <button class="aa-search-submit" type="submit">
                          <i class="fa fa-search"></i>
                        </button>
                      </div>
                    </form>
                  </div>
                  <!-- Start single sidebar -->
                  <div class="aa-blog-sidebar-single">
                    <h3>Categories</h3>
                    <ul class="aa-blog-catg">
                      <li>Properties <span>15000</span></li>
                      <li>Apartment <span>5000</span></li>
                      <li>Office  <span>3000</span></li>
                      <li>Residential <span>4500</span></li>
                      <li>Commercial <span>1000</span>
                          <ul>
                            <li>category 2.1 <span>50</span></li>
                            <li>category 2.2 <span>100</span></li>
                          </ul>
                      </li>
                      <li>Villa <span>800</span></li>
                      <li>Bungalow  <span>200</span></li>
                      <li>News <span>375</span></li>
                      <li>Reviews <span>458</span></li>
                    </ul>
                  </div>
                  <!-- Start single sidebar -->
                  <div class="aa-blog-sidebar-single">
                    <h3>Tags</h3>
                    <div class="tag-cloud">
                      <a href="#">Apartment</a>
                      <a href="#">Propery</a>
                      <a href="#">Residential</a>
                      <a href="#">Commercial</a>
                      <a href="#">Office</a>
                      <a href="#">Rent</a>
                      <a href="#">Sale</a>
                      <a href="#">Villa</a>
                    </div>                    
                  </div>
                  <!-- Start single sidebar -->
                  <div class="aa-blog-sidebar-single">
                    <h3>Recent Post</h3>
                    <div class="aa-blog-recent-post">
                      <div class="media">
                        <div class="media-left">
                          <a href="#">
                            <img alt="img" src="img/blog-img-3.jpg" class="media-object">
                          </a>
                        </div>
                        <div class="media-body">
                          <h4 class="media-heading"><a href="#">This is Title</a></h4>
                          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>                
                          <span>15 April, 16</span>
                        </div>              
                      </div>
                      <div class="media">
                        <div class="media-left">
                          <a href="#">
                            <img alt="img" src="img/blog-img-2.jpg" class="media-object">
                          </a>
                        </div>
                        <div class="media-body">
                          <h4 class="media-heading"><a href="#">This is Title</a></h4>
                          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>                
                          <span>15 April, 16</span>
                        </div>              
                      </div>
                      <div class="media">
                        <div class="media-left">
                          <a href="#">
                            <img alt="img" src="img/blog-img-1.jpg" class="media-object">
                          </a>
                        </div>
                        <div class="media-body">
                          <h4 class="media-heading"><a href="#">This is Title</a></h4>
                          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>                
                          <span>15 April, 16</span>
                        </div>              
                      </div>
                    </div>                    
                  </div>
                  <!-- Start single sidebar -->
                  <div class="aa-blog-sidebar-single">                    
                    <div class="aa-banner-ads">
                      <a href="#">
                        <img src="img/banner-ads.jpg" alt="banner img">
                      </a>
                    </div>                    
                  </div>
                </aside>
              </div>
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

	location.href='/board/listAll.do'+page;

}

</script>




  
<%@ include file="../include/footer.jsp" %>
