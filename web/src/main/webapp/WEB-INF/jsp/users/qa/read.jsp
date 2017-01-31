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
   
   
   	         <h3 class="box-title">Q & A</h3>
              
              
              <dl class="dl-horizontal">
				  <dt>제목</dt>
				  <dd>${vo.subject }</dd>
				  <dt>&nbsp;</dt>
				  <dd>&nbsp;</dd>
				  
				 <%--  <dt>유저</dt>
				  <dd>${vo.userid }</dd> --%>
				   <dt>&nbsp;</dt>
				  <dd>&nbsp;</dd>
				  
				  <dt>내용</dt>
				  <dd>${vo.content }</dd>
			 </dl>
				              
     
			<a href="/users/qna/qnaList" class="btn btn-success" >나의 문의 내용 목록 가기</a>	
		
        
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








