<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../include/header.jsp" %>


<%@ include file="../include/topmenu.jsp" %>

<style type="text/css">

#aa-property-header {

  background-image: url("/resources/view/img/slider/1.jpg");

  
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
              <h3 class="box-title">일반 게시판</h3>

              <div class="box-tools">
                <div class="input-group input-group-sm" style="width: 150px;">
                  <input type="text" name="table_search" class="form-control pull-right" placeholder="Search">

                  <div class="input-group-btn">
                    <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                  </div>
                </div>
              </div>
              <h3></h3>
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
               
       <c:forEach items="${list }"  var="row">

                <tr>
                  <td>${row.bno }</td>
                  <td>${row.title }</td>
                  <td>${ row.writer }</td>
                  <td><span class="label label-success">
                  <fmt:formatDate value="${ row.regdate }"  pattern="yyyy-MM-dd hh:mm"/></span>
                  </td>
                  <td> <span class="badge bg-red">${ row.viewcnt }</span></td>
                </tr>
       
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
                            <li>
                              <a aria-label="Previous" href="#">
                                <span aria-hidden="true">«</span>
                              </a>
                            </li>
                            <li><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li class="active"><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li>
                              <a aria-label="Next" href="#">
                                <span aria-hidden="true">»</span>
                              </a>
                            </li>
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








  
<%@ include file="../include/footer.jsp" %>
