<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="/resources/admin/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

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
            <div class="box-header" >
              <h3 class="box-title">게시글</h3>

              <div class="box-tools" style="margin-bottom: 10px; " >
       		
              </div>
              	 <h3 style="display:inline-table; "> 
            
                </h3>
              
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding" >
            
            <form method="post" action="/board/insert.do"  name="formmm1" id="formmm1">
              <table class="table table-hover">
                <thead>
                	
                </thead>
                <tbody>
                 <tr>
                	<td>등록일</td>
                	<td><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd hh:mm:ss"/> </td>
                </tr>
                
                <tr>
                	<td>조회수</td>
                	<td>${vo.viewcnt }</td>
                </tr>
                
                <tr>
                	<td>제목</td>
                	<td>${vo.title }</td>
                </tr>
                <tr>
                	<td>내용</td>
   					<td>
						${vo.content }
   		      		</td>		
   				</tr>	
             
             	<tr>
             		<td>이름</td>
             		<td>${vo.writer }</td>
             	</tr>
             
              </tbody>
              	<tfoot>
                <tr>
                <td colspan="2">
                   <c:if test="${sessionScope.loginUser.userid ==vo.writer   || sessionScope.loginUser.member_level >=15}"> 	
              			<input type="hidden"  name="bno" value="${vo.bno }">
              			<button id="btnUpdate" type="button" class="btn btn-warning">수정하기</button>
              			<button id="btnDelete" type="button" class="btn btn-danger">삭제하기</button>
                	</c:if>
                	
                	
                	<input type="hidden" value="${param.search_option }" name="search_option">
                	<input type="hidden" value="${param.keyword }" name="keyword">
                
             		
                	<c:choose>
                		<c:when test="${ not empty param.curPage   }">
                		<input type="hidden" value="${param.curPage }" name="curPage">
                		</c:when>
                		<c:otherwise>
                			<input type="hidden" value="${param.page }" name="page">
                		</c:otherwise>
                	</c:choose>
                	
                	<input type="hidden" value="${param.displayPageNum }" name="displayPageNum">

                	 <a  type="button" class="btn btn-primary"  id="btnList"  
           style="float: right; "  >글 목록</a>	
              	</td>
   		
              		 </tr>
              	 </tfoot>
            </table>
              
              
              </form>
            </div>
            <!-- /.box-body -->
          </div>
                     
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="aa-properties-content-bottom">
                        <nav>
                        
                             
           <!-- 댓글 -->
                <div class="row">
                <hr style="  border: 1px #66AD44 solid;" >
                <h3 >댓글 쓰기</h3>
                	
                	<form  name="replyform1" method="post" action="">
                	<table class="table">
                		<tr>
                			<td>작성자</td>
                			<td><input type="text" readonly="readonly" 
                			value="${sessionScope.loginUser.userid }"  class="form-control" id="replyer">
                			</td>
                		</tr>

						 <tr>
                			<td>내용</td>
                			<td>
                			<textarea rows="7" cols="" id="replytext" class="form-control" placeholder="댓글을 작성하세요"></textarea>
                			</td>
                		</tr>
	
						<tr>
						<td colspan="2" ><button class="btn btn-warning" id="btnReply" >댓글쓰기</button></td>
						</tr>
             
                	</table>
                
                </form>
                
                <hr>
                
                <div class="aa-comments-area">
                        <h3> <span id="replyNum"></span>  개의 댓글 </h3>
                        <div class="comments">
                         <ul class="commentlist">
               
                         </ul>
                          <!-- comments pagination -->
                        
                        </div>
                 </div>
            </div>
                     
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




<script>

$(document).ready(function(){
	
	//replyListAll();
	replyListAll2();
	
	$("#btnList").click(function(){
		
		var form1 =$("#formmm1");
		
		form1.attr("action" , "/board/listAll.do");
		form1.attr("method", "get");
		form1.submit();

		
	});
	
	
	$("#btnUpdate").click(function(){
		var form1 =$("#formmm1");
		form1.attr("action", "/board/updateform.do");
		form1.attr("method", "get");
		form1.submit();
		
	});
	
	
	//삭제
	$("#btnDelete").click(function(){
		
		if(confirm("정말 삭제 하시겠습니까?")){
			
			var form1 =$("#formmm1");
			form1.attr("action", "/board/delete.do");
			
			form1.submit();			
		}
		
	});
	
	//댓글 쓰기
	
	
	$("#btnReply").click(function(event){
		event.preventDefault();
		var  userid ='${sessionScope.loginUser.userid}';
		var replytext =$("#replytext").val();
		var bno ='${vo.bno}';
		//alert("번호" + bno + " : " +userid + " : " + replytext) ;
		
		if(userid.length < 1){
			alert("로그인을 하셔야 댓글이 가능합니다." ) ;		
			return ;
		
		}
		
		if(replytext.length <1){
			alert("댓글을 작성하세요!");
			return ;
		}
				
		$.ajax({
			
			type :"post",
			url : "/freeboard_reply/insert",
			contentType:"application/json",
			dataType :"text",
			data:JSON.stringify({
				bno :bno,
				replyer:userid,
				replytext:replytext
				
			}),
			success:function(result){
				
				if(result=="SUCCESS"){	
					replyListAll2();
					$("#replytext").val("");
					$("#replyNum").html($(".media").size());	
				}
				
			}
			
		});	
	});
	
	

	
});



function  replyListAll(){
	
	var bno ='${vo.bno}';	
	$.ajax({
		url :"/freeboard_reply/listAll?bno="+bno,
		type:"get",
		success :function(result){
			//alert("성공");
			
			$(".commentlist").html(result);	
		}	
	});
}



function  replyListAll2(){
	
	var bno ='${vo.bno}';
	
	$.ajax({
		url :"/freeboard_reply/listAll/"+bno,
		type:"get",
		contentType: "application/json",
		success :function(result){		
			printData (result);
			
		}
	});
}


Handlebars.registerHelper("prettifyDate", function(timeValue){
	
	var dateObj =new Date(timeValue);
	var year =dateObj.getFullYear();
	var month =dateObj.getMonth() +1;
	var date =dateObj.getDate();
	return year +"/"+month +"/"+date;
});


function printData (data){
	var template =Handlebars.compile($("#template").html());
	
	var html =template(data);
	
	$(".commentlist").html(html);
	
}






</script>




<script id="template" type="text/x-handlebars-template">
{{#each .}}
 <li>
   <div class="media">
     <div class="media-left">    
         <img alt="img" src="/resources/admin/dist/img/user3-128x128.jpg" class="media-object news-img">      
     </div>
     <div class="media-body">
      <h4 class="author-name">{{replyer}}</h4>
      <span class="comments-date"> {{regdate}}</span>
      <p>{{ replytext}}</p>
      <a class="reply-btn" href="#">Reply</a>
     </div>
   </div>
</li>

{{/each}}    
</script>




  
<%@ include file="../include/footer.jsp" %>
