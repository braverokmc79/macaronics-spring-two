<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="/resources/admin/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

<%@ include file="../include/header.jsp" %>


<%@ include file="../include/topmenu.jsp" %>


<style type="text/css">

#aa-property-header {

  background-image: url("/resources/view/img/submenu/sub4.jpg");

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
            <div class="box-header" >
              <h3 class="box-title">게시글</h3>

				              <h3 class="box-title">Q & A</h3>
              
              
              <dl class="dl-horizontal">
				  <dt>제목</dt>
				  <dd>${vo.subject }</dd>
				  <dt>&nbsp;</dt>
				  <dd>&nbsp;</dd>
				  
				  <dt>유저</dt>
				  <dd>${vo.userid }</dd>
				   <dt>&nbsp;</dt>
				  <dd>&nbsp;</dd>
				  
				  <dt>내용</dt>
				  <dd>${vo.content }</dd>
			</dl>
				              
     
			<a href="/qna/list" class="btn btn-success" >게시글 목록 가기</a>	
			
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




  
<%@ include file="../include/footer.jsp" %>




