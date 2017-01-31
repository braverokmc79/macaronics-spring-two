<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>


<%@ include file="../include/header.jsp" %>

<%@ include file="../include/top_menu.jsp" %>
 
<%@ include file="../include/side_menu.jsp" %>   

<jsp:include page="../../session_check.jsp" />   
 
 
   
 
      <!--main content start-->
      <section id="main-content">
         
          <section class="wrapper">
          <form method="post" action="/users/qna/write"  name="form1">
		  <div class="row">
				<div class="col-lg-12">
					<h3 class="page-header"><i class="fa fa-file-text-o"></i> Q & A</h3>
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i><a href="index.html">Home</a></li>
						<li><i class="icon_document_alt"></i>1:1</li>
						<li><i class="fa fa-file-text-o"></i>문의하기</li>
					</ol>
				</div>
			</div>
              <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                          
                          </header>
                          <div class="panel-body">

                                  <div class="form-group" >
                                      <label class="col-sm-2 control-label">제목</label>
                                      <div class="col-sm-10">
                                          <input type="text" class="form-control" name="subject" id="subject" onkeyup="chkword(this, 100)" value="${vo.subject }">
                                      </div>
                                  </div>
       						  <hr>
                          </div>
                      </section>
              </div>
              </div>

              <div class="row">
                  <div class="col-lg-12">                      

                      <div class="row">
                        
                         
                          <!-- CKEditor -->
                          <div class="col-lg-12">
                              <section class="panel">
                                  <header class="panel-heading">
                                      내용
                                  </header>
                                  <div class="panel-body">
                                      <div class="form">
                                          
                                              <div class="form-group">
                                                  <label class="control-label col-sm-2"></label>
                                                  <div class="col-sm-10">
                                                      <textarea class="form-control" name="content"  id="content" rows="6" onkeyup="chkword(this, 3500)">${vo.content }</textarea>
                                                  </div>
                                              </div>
                                         
  										
								<div class="form-group" >
                                      <label class="col-sm-2 control-label">비밀글</label>
                                      <div class="col-sm-10">
                                          <input type="checkbox" class="form-control" name="checkbox" id="checkbox"  value="hide">
                                      </div>
                                  </div>
                                         <input type="hidden"   name="secret" id="secret">
                                        <input type="hidden" value="${vo.userid }"  name="userid">
                                         <input type="button" value="등록하기" class="btn btn-primary" id="memoBtn" >
                                      </div>
                                  </div>
                              </section>
                          </div>
                      </div>
                  </div>
              </div>
              <!-- page end-->
        </form>
        
        
    <div class="text-right">
        <div class="credits">
      <a href="http://macaronics.comlu.com/">Macaronics</a> by <a href="http://macaronics.comlu.com/">JUNHO CHOI</a>
        </div>
    </div>
        
        
        
        
          </section>
     
     
     
      </section>
      <!--main content end-->
    
    


<script>
$(document).ready(function(){


	var errorMessage ="${errorMessage}";
	
	if(errorMessage.length > 1){
		alert(errorMessage);
	}
	
	
	$("#memoBtn").click(function(event){

		var subject =$("#subject");
		var content= $("#content");
		var checkbox =$("#checkbox");
		
		if(subject.val()==""){
			
			alert("제목을 입력 해주세요.");
			subject.focus();
			return;
		}
		
		if(content.val()==""){
			alert("내용을 입력해주세요.");
			content.focus();
			return;
		}
		
		
		if($("#checkbox").is(":checked")){
			//alert("체크 되었습니다.");
			$("#secret").val("hide");
		}
		
		if(!$("#checkbox").is(":checked")){
			//alert("체크 되었습니다.");
			$("#secret").val("show");
		}
		
		
		document.form1.submit();
	});
	


	
});


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
        chkword(obj, 3500);
    }
}
</script>


  
<%@ include file="../include/footer.jsp" %>








