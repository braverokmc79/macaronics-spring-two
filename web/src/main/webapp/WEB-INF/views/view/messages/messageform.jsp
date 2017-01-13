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
              <h3 class="box-title" style="margin-bottom: 10px;">메시지 전송 테스트</h3>

              <div class="box-tools">	
           
   				<hr>
   				<h5 style="color: green;">샘플 유저 아이디</h5>
           			<hr>
           		<div id="tbodyI">
           		<table class="table" >    			
           			<tr>
           				<td>아이디</td> <td>패스워드</td><td>이름</td><td>포인트</td>
           			</tr>
           			
           			<c:forEach items="${ userList}" var="row" >
						<tr>
           					<td>${row.userid}</td>
           					<td>${row.upw }</td>
           					<td>${row.uname }</td>
           					<td>${row.upoint }</td>
           				</tr>
           			
           			</c:forEach>	
           		
           		</table>	
           		</div>
				</div>

			<hr>
			
			<h5 style="color: green;">메시지 전송</h5>
			  <form method="post" action="/messages/messageform" role="form1">
			 <div class="table-responsive">
			  <table class="table table-striped">
           			
           			<tr>
           			  <th>받는 사람 아이디</th>
           			  <td>
           			 
           				<select name="targetid"  id="targetid" class="form-control">
           				<c:forEach items="${userList}" var="row">
           					<option value="${row.userid }">${row.userid }</option>
           				</c:forEach>
           				</select>
           				</td>
           			</tr>
           			<tr>
           				
           				<th>보내는 사람 아이디</th>
           				<td>
           				<select name="sender" id="sender" class="form-control">
           				<c:forEach items="${userList}" var="row">
           					<option value="${row.userid }">${row.userid }</option>
           				</c:forEach>
           				</select>
           				
           			</tr>
           			
           			<tr>
           			<th>내용</th>
           			<td >
           			<textarea rows="5" cols="20" class="form-control" name="message" id="message" ></textarea>
           			</td>
           			</tr>
           			
           			<tr>
           			<td colspan="2" style="text-align: center;">
           			<input type="submit"  value="전송" class="btn btn-success" id="messageSubmit">
           			</td>
           			</tr>
           	</table>
           	</div>
           	</form>
			
			<hr>
				<h5 style="color: green;">메시지 내용</h5>

          	  </div>
             	
             	<hr>
             	<div >
             		<ul id="messageList">
             			<c:forEach items="${messageList}" var="list">

					<li>
					번호: ${list.mid } - 받는사람: ${list.targetid } - 
					
					보낸사람 : ${list.sender}  - 메시지: ${list.message } 
					- 보낸날짜: ${list.senddate}  - 개봉날짜 : ${list.opendate }
					</li>
             			
             			</c:forEach>
             		
             		</ul>
             	
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
	
	
	
	$("#messageSubmit").click(function(event){
		
		event.preventDefault();
		
		var targetid=$("#targetid").val();
		var sender =$("#sender").val();
		var message=$("#message").val();
		
		if(message.length <1){
			alert("메시지를 입력하세요!");
			return;
		}		
		//alert("target  : " + targetid + "  : " + sender+ " : "+ message);
		
		$.ajax({
			
			url:"/messages/addmessage",
			type:"POST",
			datType:"text",
			contentType:"application/json",
			data:JSON.stringify({
				targetid:targetid,
				sender:sender,
				message:message
			}),
			success:function(result){
					
					var template=Handlebars.compile($("#template").html());
					var html =template(result.userList);
					
					
					var str2 ='<table class="table" >';    			
           			str2 += '<tr>';
           			str2 += '<td>아이디</td> <td>패스워드</td><td>이름</td><td>포인트</td>';
           			str2 += '</tr>';
           			str2 +=html;
           			str2 += "</table>";
           			$("#tbodyI table").remove();
					$("#tbodyI").html(str2);
					$("#message").val("");
					
					var template2=Handlebars.compile($("#template2").html());
					var html2=template2(result.messageList)
					
					$("#messageList").html(html2);		
			}
		});
	});
});


function list(page){

	location.href='/board/listAll.do'+page;

}

</script>

<script id="template" type="text/x-handlebars-template">

{{#each .}} 
 <tr>
	<td>{{userid}}</td>
	<td>{{upw }}</td>
	<td>{{uname }}</td>
 	<td>{{upoint }}</td>
</tr>
{{/each}} 
        			
</script>



<script id="template2" type="text/x-handlebars-template">
{{#each .}}


<li>
	번호: {{mid }} - 받는사람: {{targetid }} - 
				
	보낸사람 : {{sender}}  - 메시지: {{message }} 
	- 보낸날짜: {{senddate}}  - 개봉날짜 : {{opendate }}
</li>

{{/each}}
</script>



  
<%@ include file="../include/footer.jsp" %>
