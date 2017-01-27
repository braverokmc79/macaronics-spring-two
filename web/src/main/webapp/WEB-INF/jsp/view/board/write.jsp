<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
  <!-- bootstrap wysihtml5 - text editor -->

<%@ include file="../include/header.jsp" %>
<%@ include file="../include/topmenu.jsp" %>

<%@ include file="../../session_check.jsp" %>



<link rel="stylesheet" href="/resources/admin/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">


<style type="text/css">

#aa-property-header {



  background-image: url("/resources/view/img/submenu/sub4.jpg");
  
}
#fileDrop5{

	background-color: #66AD44;
	width: 100%;
	height: 300px;
	text-align: center;
	color:#ffffff;
	vertical-align:middle;

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
              <h3 class="box-title">게시글 등록</h3>

              <div class="box-tools">
     
              </div>
              
              <h3></h3>
              
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive no-padding">
            
            <form method="post" action="/board/insert.do"  name="formmm1" id="formmm1">           
              <table class="table table-hover">
                <thead>
                	
                </thead>
                <tbody>
                
                <tr>
                	<td>제목</td>
                	<td><input type="text" name="title" id="title" class="form-control" ></td>
                </tr>
                <tr>
                	<td>내용</td>
   					<td>

                 <textarea     class="textarea" id="content" name="content"
                  style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; 
                  border: 1px solid #dddddd; padding: 10px;"></textarea>
              
              <!-- CK Editor -->
<script src="https://cdn.ckeditor.com/4.5.7/standard/ckeditor.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="/resources/admin/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script>
  $(function () {
    // Replace the <textarea id="editor1"> with a CKEditor
    // instance, using default configuration.
  //  CKEDITOR.replace('content');
    //bootstrap WYSIHTML5 - text editor
	  $(".textarea").wysihtml5();
  });
</script>
   		</td>		
   				</tr>	
             
             	<tr>
             		<td>이름</td>
             		<td><input type="text"  name="writer" id="writer" readonly="readonly" value="${sessionScope.loginUser.userid }" class="form-control"></td>
             	</tr>
             
             	<tr>
             		<td>첨부 파일</td>
             		<td id="fileDrop5">
             		
             		 파일을 끌어 올려 놓아 주세요.
             		
              		</td>
             	</tr>

              </tbody> 
            </table>
                 <hr>		        	
			<ul class="mailbox-attachments clearfix uploadedList">

			</ul> 
		      
              <hr>
     			<div style="text-align: center;">
              	<button id="btnWrite" type="button" class="btn btn-warning">글 등록하기</button>
              	</div>
            </form>
            
           </div>
           
            <!-- /.box-body -->
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






<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script>

$(document).ready(function(){
	
	
	
	$("#btnWrite").click(function(){
		
		var fileStr="";
		
		var form1 = $("#formmm1");
		
		var title=$("#title");
		var content =$("#content");
		var writer =$("#writer");
		
		
	
		if(title.val().length < 1){
			alert("제목을 입력 하세요");
			title.focus();
			return;
		}
		
		if(content.val().length <1){
			alert("내용을 입력 하세요");
			content.focus();
			return;
		}
		
		if(writer.val().length <1){
			alert("이름을 입력 하세요");
			writer.focus();
			return;
		}
		
		$(".uploadedList .delbtn").each(function(index){
			
			fileStr +="<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href"); 
			fileStr  +="'>";
		});	
			
		form1.append(fileStr);
		form1.submit();
		
		
	});
	
	
	
	/* 첨부 파일 */
	
	
	$("#fileDrop5").on("dragover dragenter", function(e){
		
		e.preventDefault();
	});
	
	$("#fileDrop5").on("drop", function(e){
		
		e.preventDefault();
		var files=e.originalEvent.dataTransfer.files;
		var file=files[0];
		var formData=new FormData();
		formData.append("file", file);
		
		$.ajax({
			
			url:"/board/dropfileinsert.do",
			data:formData,
			dataType:"text",
			type:"POST",
			processData:false,
			contentType:false,
			success:function(data){
				var template =Handlebars.compile($("#template").html());

	               var fileInfo =getFileInfo(data);
					
					var html =template(fileInfo);
					
					$(".uploadedList").append(html);
		
			}
		
		});
		
	});
	
	
	
	//첨부 파일 삭제
	$(".uploadedList").on("click", ".delbtn",function(event){
		event.preventDefault();
		var fileName=$(this).attr("href");
		var div =$(this).parent("div");
		//alert(fileName);
		$.ajax({
			
			url:"/board/getDelete",
			type:"post",
			contentType:"application/json",
			data: fileName,
			dataType:"text",
			success:function(result){
				
				if(result=='deleted'){
					
					div.parent("li").remove();
								
				}
			}
		})
		
		
	});
	
	
	
	
});


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


<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
 -->
<script id="template" type="text/x-handlebars-template">
<li style="min-width:200px; max-width:200px; min-height:150px; max-height:150px;">
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	<a href="{{fullName}}" 
     class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
  </div>
</li>                
</script>  

  
<%@ include file="../include/footer.jsp" %>
