<%@page import="java.io.File"%>
<%@page import="com.macaronics.www.util.fileupload.UploadPath"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@ include file="../include/header.jsp" %>


<%@ include file="../include/topmenu.jsp" %>




<style type="text/css">

#aa-property-header {

  background-image: url("/resources/view/img/submenu/sub05.jpg");

  
}
.rowTitle a:hover{

	background-color: #F0AD4E;
	color: #fff;
	padding: 5px;
	
	
	border-radius: 0.5em;
}
#fileDrop{

	width: 100%;
	height:200px;
	board:1px dotted blue;

}
#uploadList{
	
	margin-top: 20px;
	
}

#uploadList li{

	margin-top: 10px;
	
}

.btn-danger{

	margin-left:5px;

}
</style>


  <!-- Start Proerty header  -->
  <section id="aa-property-header">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-property-header-inner">
            <h2>Gallery Page</h2>
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



 <section id="aa-gallery">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-gallery-area">
            <div class="aa-title">
              <h2>Gallery TEST</h2>
              <span></span>
              <p></p>
            </div>
            <!-- Start gallery -->
            <div class="aa-gallery-content">
              
              <!-- Start gallery image -->
              <div class="aa-gallery-body">
           
<p>C:\dev\macaronics-spring-two\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\web\WEB-INF\uploads\</p>
           
			<!-- 파일 업로드할 영역 -->
			<h5>업로드할 파일을 선택 영역에 올려 주세요</h5>
			
			
			<div id="fileDrop" style="height: 300px; background-color: #666666;"></div>

			<!-- 업로된 파일 목록 -->
            <ul id="uploadList">
            
            </ul>
              
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>



<script>
$(document).ready(function(){
	
	$("#fileDrop").on("dragenter dragover", function(event){
		event.preventDefault(); //기본 효과 막음
	});
	
	
	$("#fileDrop").on("drop", function(event){
		event.preventDefault();
		
		var files =event.originalEvent.dataTransfer.files;
		
		var file=files[0];
		
		console.log(file);
		
		
		var formData =new FormData();
		
		formData.append("file", file);
		
		$.ajax({
			
			type:"post",
			url:"/gallery/view/gallery2",
			data:formData,
			dataType:'text',
			processData:false,
			contentType:false,
			type:'POST',
			success:function(data){
				
				$("#uploadList").append(getFileList(data))
			}
			
		});
	
	});
	

});

function getFileList(fileName){
	
	var str="";	
	if(checkImageType(fileName)){
		//이미지인 경우 이미지 표시
		str +="<li><a href='/gallery/view/displayFile?fileName=" +getImageLink(fileName)+"' >";
		str +="<image src='/gallery/view/displayFile?fileName="+fileName +"' />";
		str +="</a><button class='btn btn-danger' onclick=\"javascript:uploadDelete('"+fileName+"', this)\">삭제</button></li>";
		
	}else{
		//이미지가 아닌경우 이름만 표시
		
		str +="<li><a href='/gallery/view/displayFile?fileName="+fileName+"'>";
		str +=getOriginalName(fileName);
		str +="</a><button class='btn btn-danger' onclick=\"javascript:uploadDelete('"+fileName+"', this)\">삭제</button></li>";		
		
	}
	return str;
}


function getOriginalName(fileName){
/* 	if(!checkImageType(fileName)){
		return;
	} */
	//uuid 를 제외한 원래 파일 이름을 리턴
	var idx=fileName.lastIndexOf("_")+1;
	return fileName.substr(idx);
}

function getImageLink(fileName){
	if(!checkImageType(fileName)){
		return;
	}
	var front =fileName.substr(0, 12);
	var end=fileName.substr(14);
	return front+end;
}

function checkImageType(fileName){
	var pattern =/jpg|gif|png|jpeg/i; //정규표현식
	return fileName.match(pattern);
}

function uploadDelete(fileName, event){
	
	$.ajax({
		
		url:"/gallery/view/deleteFile",
		type:"POST",
		data : {
			fileName:fileName
		},
		dataType :"text",
		success:function(result){
			
			if(result=='deleted'){
				$(event).parent("li").remove();			
			}
		}
		
	});
	
	
	
}


</script>


<%@ include file="../include/footer.jsp" %>
