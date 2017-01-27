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

              <div class="box-tools" style="margin-bottom: 10px; " >
       		
              </div>
              	 <h3 style="display:inline-table; "> 
            
                </h3>
              
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding" >
           <c:choose>
	           	<c:when test="${ vo.show !='y'}">
	           		<table class="table table-hover">
	           			 <tbody>
	           			 	<tr>
                			<th style="text-align: center;">삭제된 게시물 입니다.</th>
                			</tr>
               			 </tbody>
	           		</table>
	           	
	           	</c:when>
	           	<c:otherwise>
	           	
	           		 
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

                	 <a type="button" class="btn btn-primary"  id="btnList"  style="float: right;" >글 목록</a>	
              	</td>
   		
              		 </tr>
              	 </tfoot>
           	 </table>
              </form>
           	
	           	</c:otherwise>
           </c:choose>
           
             <hr>		        	
			<ul class="mailbox-attachments clearfix uploadedList">

			</ul> 
		      
              <hr>
           
           
           
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
               
                 <c:if test="${vo.show=='y' }"  >  <!-- show 여부 -->
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
                		 	<td>비밀댓글</td>
                		 	<td>
                		 	<input type="checkbox" id="secret_reply" name="secret_reply" class="form-control" >
                		 	</td>
                		 </tr>
	
						<tr>
						<td colspan="2" ><button class="btn btn-warning" id="btnReply" >댓글쓰기</button></td>
						</tr>
             
                	</table>
                
                </form>
                
              </c:if>   <!-- show 여부 -->
                
             
                <hr>
             
             
             
                
                <div class="aa-comments-area">
                        <h3> <span id="replyNum">${vo.cnt}</span>  개의 댓글 </h3>
                        <div class="comments">
                         <ul class="commentlist" id="replyUl">
               
                         </ul>
                          <!-- comments pagination -->
                        
                        </div>
                 </div>
            </div>
              
                   
                      	 <ul class="pagination" id="replyPage">
                         
                         
                          </ul>
                        </nav>
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



<div class="popup back" style="display:none;"></div>
<div id="popup_front" class="popup front" style="display:none;">
<img id="popup_img">
</div>



<script>

$(document).ready(function(){
	
	//replyListAll();
	replyListAll2(1);
	
	//첨부파일 목록 불러오기
	listAttach();
	
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
		
/* 		var cnt =$("#replyNum").html();
		if(cnt >0){
			
			alert("댓글달린 게시물은 삭제 할수 없습니다.");
			return;
		}
		 */
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
		//비밀 댓글 체크 여부
		var secret_reply ="n";
		if($("#secret_reply").is(":checked")){
			
			secret_reply ="y";
		}
	
		
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
				replytext:replytext,
				secret_reply: secret_reply
				
			}),
			success:function(result){			
				if(result=="SUCCESS"){	
					replyListAll2(1);
					$("#replytext").val("");
					var cnt =$("#replyNum").html();
					
					$("#replyNum").html((parseInt(cnt)+1));	
				}		
			}
			
		});	
	});
	
	
	//댓글 페이지 클릭
	$("#replyPage").on("click", "li a", function(event){
		event.preventDefault();	
		rplyPage =$(this).attr("href");
		replyListAll2(rplyPage);
	});
		
	
	$("#replyUl").on("mouseover", ".replyLi5", function(event){
		
		var rno=$(this).attr("data-rno");
		$("#ddd").text(rno);
		
		
	});
	
	//댓글 삭제
	$("#modalDelete").click(function(){
		var rno =$("#ddd").text();
	
		if(confirm("정말 삭제 하시겠습니까?")){
			$.ajax({
				
				url : "/freeboard_reply/delete/"+ rno,
				type:"delete",
				contentType:"application/json",
				dataType:"text",
				success:function(result){
					$("#replyModal").modal("toggle");
					var li =$("#replyPage").find(".active").find("a").text();
					replyListAll2(li);	
					var cnt =$("#replyNum").html();
					$("#replyNum").html((parseInt(cnt)-1));	
				}
			
			});
			
		}
		
	});
	
	
	//댓글 변경
	$("#modalAlter1").click(function(){
		var replytext =$("#modalBodayOne").val();
		var rno =$("#ddd").text();
		
		$.ajax({
			
			url:"/freeboard_reply/alter/"+rno,
			type:"put",
			dataType:"text",
			contentType:"application/json",
			data :JSON.stringify({
				replytext :replytext
			}),
			success:function(result){
				
				$("#replyModal").modal("toggle");
				var li =$("#replyPage").find(".active").find("a").text();
				replyListAll2(li);	
			}			
		});
	
	});
	
	
	//이미지 쇼
	$(".uploadedList").on("click", ".mailbox-attachment-info a", function(event){
		
		var fileLink=$(this).attr("href");
		if(checkType(fileLink)){
		//	event.preventDefault();
			//alert("dd");
			
		}
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



function  replyListAll2(replyPage){
	
	var bno ='${vo.bno}';
	
	$.ajax({
		url :"/freeboard_reply/listAll/"+bno +"/"+replyPage,
		type:"get",
		contentType: "application/json",
		success :function(result){		
			printData (result.list);
			replyPage22(result.pager);
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


Handlebars.registerHelper("eqReplyer", function(replyer, block){
	
	var accum ='';
	if(replyer=='${loginUser.userid}' || 15 =='${loginUser.member_level}'){
		accum +=block.fn();
	}
	return accum;
});


function printData (data){
	var template =Handlebars.compile($("#template").html());
	
	var html =template(data);
	
	$(".commentlist").html(html);
	
}


function replyPage22(pager){
	var str ="";
	
	if(pager.curBlock  > 1){
		str +="<li><a aria-label='Previous' href='"+pager.prevPage+"'>«</li>";
	}

	
     for(var i=pager.blockBegin ; i <=pager.blockEnd; i++){
    	 var strClass= (pager.curPage ==i )? 'class=active' :'';
    	 str +="<li "+ strClass +"><a href='"+ i +"'>" + i+"</a></li>";
    	 
     }

    if(pager.curBlock < pager.totBlock){
    	str +="<li><a href='";
    	str  +=pager.nextPage+"'>»</a></li>'";
    }

    $("#replyPage").html(str);
	
}


function modalOpen(event){
	
	event.preventDefault();

	var rno =$("#ddd").text();
	var userid ="${loginUser.userid}";
	 var level="${loginUser.member_level}";
	
	$.getJSON("/freeboard_reply/replyView/"+rno, function(data){		
		// alert(userid + "  : " + data.replyer);
		
		if(userid.length<1){
			alert("로그인을 먼저 하세요!");
			return;
		}
		
		//댓글 쓴 유저 및 관리자 수정 가능 
		if(data.replyer==userid || 15==level){
			$("#modalBodayOne").html(data.replytext);		
			
			$("#replyModal").modal("toggle");		
		}else{
			alert("댓글쓴이만 수정 가능합니다.");
			return;
		} 
	
	});
	
	
}


////////////첨부파일 목록 가져오기	
function listAttach(){
	
	var bno =${vo.bno};
	
	var template =Handlebars.compile($("#attchTemplate").html());
	
	$.getJSON("/board/getAttch/"+bno, function(list){
		
		$(list).each(function(){
			
			var fileInfo=getFileInfo(this);
			var html=template(fileInfo);
			$(".uploadedList").append(html);
			
		});
	});
	
	
}



function getFileInfo(fullName){
	
	var fileName, imgsrc, getLink;
	
	var fileLink;
	
	if(checkType(fullName)){
		imgsrc ="/board/displayFile?fileName="+fullName;
		fileLink=fullName.substr(14);
		
		var front =fullName.substr(0,12);
		var end =fullName.substr(14);
		
		getLink="/board/displayFile?fileName="+front+end;
	}else{
		//일반파일 표시
		imgsrc ="/resources/admin/dist/img/file.png";
		fileLink=fullName.substr(12);
		getLink="/board/displayFile?fileName="+fullName;
	}
	fileName=fileLink.substr(fileLink.indexOf("_")+1);
	
	return  {fileName:fileName , imgsrc:imgsrc, getLink:getLink, fullName:fullName};
}


function checkType(fileName){
	var pattern =/jpg|png|jpeg|gif/i;
	return fileName.match(pattern);
} 


</script>


<script id="attchTemplate" type="text/x-handlebars-template">
<li style="min-width:200px; max-width:200px; min-height:150px; max-height:150px;">
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>

<div class="mailbox-attachment-info" style="bottom:0px;">
	<a href="{{getLink}}" class="mailbox-attachment-name" >{{fileName}}</a>
  </div>
</li>                
</script>  



<script id="template" type="text/x-handlebars-template">
{{#each .}}
 <li class="replyLi5" data-rno ="{{rno}}">
   <div class="media">
     <div class="media-left">    
         <img alt="img" src="/resources/admin/dist/img/user3-128x128.jpg" class="media-object news-img">      
     </div>
     <div class="media-body">
      <h4 class="author-name">{{rno}}  -  {{replyer}}</h4>
      <span class="comments-date"> {{regdate}}</span>
      <p>{{ replytext}}</p>
	{{#eqReplyer replyer}}	
    	  <a class="reply-btn" href="#" onclick="javascript:modalOpen(event);" data-rno="{{rno}}">Reply</a>
    {{/eqReplyer}}
     </div>
   </div>
</li>

{{/each}}    
</script>




<div class="modal" id="replyModal">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">×</span></button>
                <h4 class="modal-title"> ( <span id="ddd"></span> )  댓글 수정하기</h4>
             	
              </div>
              <div class="modal-body">
                <textarea rows="" cols="" id="modalBodayOne" class="form-control"></textarea>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary" id="modalAlter1">수정하기</button>
                <button type="button" class="btn btn-danger" id="modalDelete">삭제하기</button>
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
</div>

  
<%@ include file="../include/footer.jsp" %>




