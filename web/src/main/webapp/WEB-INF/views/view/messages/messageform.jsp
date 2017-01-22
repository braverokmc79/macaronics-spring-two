<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
              <h3 class="box-title" style="margin-bottom: 10px;">실시간 메시지 전송 테스트</h3>

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
           			<th colspan="2">내용</th>
           			</tr>
           			<tr>
           			<td colspan="2">
           			<textarea rows="5" cols="20" class="form-control" name="message" id="message" onkeyup="chkword(this, 3000)" ></textarea>
           			</td>
           			</tr>
           			
           			<tr>
           			<td colspan="2" style="text-align: center;">
           			<input type="submit"  value="전송" class="btn btn-success" id="messageSubmit" >
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
             		
             		<div id="messageList" class="table-responsive">
             			<table class="table table-striped">
 
						<tr>
							<td>번호 </td>
						<td>받는사람 </td>
						<td>보낸사람</td>
						<td>내용</td>
						</tr>
         
             			<c:forEach items="${messageList}" var="list">
							
		
									<tr>
						<td><small>${list.mid }</small></td>
						
						<td><small>${list.targetid }</small></td>
						
						<td><small>${list.sender}</small></td> 
						
						<td><small>${list.message}</small>
						<small class="badge bg-red"><fmt:formatDate value="${list.senddate }"  pattern="yyyy-MM-dd HH:mm"/></small>
						</td> 
						
					
					
						</tr>
		
             			</c:forEach>
             			</table>
             		</div>
             	
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

//글자수 제한

function chkword(obj, maxByte) {

       var strValue = obj.value;
       var strLen = strValue.length;
       var totalByte = 0;
       var len = 0;
       var oneChar = "";
       var str2 = "";

       for (var i = 0; i < strLen; i++) {
           oneChar = strValue.charAt(i);
           if (escape(oneChar).length > 4) {
               totalByte += 2;
           } else {
               totalByte++;
           }

           // 입력한 문자 길이보다 넘치면 잘라내기 위해 저장
           if (totalByte <= maxByte) {
               len = i + 1;
           }
       }

       // 넘어가는 글자는 자른다.
       if (totalByte > maxByte) {
           alert(maxByte + "자를 초과 입력 할 수 없습니다.");
           str2 = strValue.substr(0, len);
           obj.value = str2;
           chkword(obj, 3000);
       }
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

<table class="table table-striped">
 
<tr>
	<td>번호 </td>
<td>받는사람 </td>
<td>보낸사람</td>
<td>내용</td>

</tr>

{{#each .}}
<tr>
<td><small>{{mid }}</small></td>

<td><small>{{targetid }}</small></td>

<td><small>{{sender}}</small></td> 

<td><small>{{message }}</small>
<small class="badge bg-red">{{senddate}}</small>
</td> 


</tr>
{{/each}}

</table>
</script>




    
  
<%@ include file="../include/footer.jsp" %>





