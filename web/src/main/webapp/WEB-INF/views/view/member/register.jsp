
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<%@ include file="../include/header.jsp" %>


<%@ include file="../include/topmenu.jsp" %>


 <body>  
 

 
  <section id="aa-signin" >
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-signin-area">
            <div class="aa-signin-form">
              <div class="aa-signin-form-title">
                <a class="aa-property-home" href="index.html">회원 가입</a>
                <h4>
                <c:choose>
                	<c:when test="${ not empty ErrorMessage }">
                		<span style="color:red;">${ ErrorMessage}</span>
                	</c:when>
                	<c:otherwise>
                	  Create your account and Stay with us
                	</c:otherwise>
                </c:choose>
         
                </h4>
              </div>
              
              
              <form class="contactform" method="post" action ="/admin/memberWriter.do">
                <div class="aa-single-field">
                  <label for="name">아이디 <span class="required">*</span></label>
                  <input type="text" required="required" aria-required="true" value="${memberdto.userid }" name="userid">
                </div>
                                                               
                <div class="aa-single-field">
                  <label for="name">이름 <span class="required">*</span></label>
                  <input type="text" required="required" aria-required="true" value="${memberdto.username }" name="username">
                </div>
                <div class="aa-single-field">
                  <label for="email">이메일 <span class="required">*</span></label>
                  <input type="email" required="required" aria-required="true" value="${memberdto.email }" name="email">
                </div>
                <div class="aa-single-field">
                  <label for="password">Password <span class="required">*</span></label>
                  <input type="password" name="userpw" required="required"> 
                </div>
                <div class="aa-single-field">
                  <label for="confirm-password">Confirm Password <span class="required">*</span></label>
                  <input type="password" name="confirmPassword" required="required"> 
                </div>
                <div class="aa-single-submit">
                  <input type="submit" value="회원 가입하기" name="submit">                    
                </div>
              </form>
              
              
            </div>
          </div>
        </div>
      </div>
    </div>
  </section> 





<script>

var email_regx=/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
var pass_regx=/^[0-9a-zA-Z]{4,10}$/;
var num_regx=/^[0-9]*$/;

with(document.join_frm) {
	 
	if(!user_hname.value.trim()) {
	  alert("성명은 필수 입력항목입니다.");
	  user_hname.focus();
	  return false;
	 }
	 
	 
	 if(!user_email1.value.trim()) {
	  alert("이메일은 필수 입력항목입니다.");
	  user_email1.focus();
	  return false;
	 }
	 
	 
	 
	 if(!user_email2.value.trim()) {
	  alert("이메일은 필수 입력항목입니다.");
	  user_email2.focus();
	  return false;
	 }
	 
	 
	 if(!email_regx.test(user_email1.value + "@" + user_email2.value)) {
	  alert("이메일을 다시 확인해주세요.");
	  user_email1.focus();
	  return false;
	 }
	 
	 if(!num_regx.test(user_htel1.value) || !num_regx.test(user_htel2.value) || !num_regx.test(user_htel3.value)) {
	  alert("전화번호는 숫자만 입력해주세요.");
	  user_htel1.focus();
	  return false;
	 }
	 
	 if(!user_pwd.value) {
	  alert("비밀번호를 확인해 주십시오.");
	  user_pwd.focus();
	  return false;
	 }
	 
	 
	 if(user_pwd.value.length<4) {
	  alert("비밀번호는 4자 이상으로 입력해 주세요.");
	  user_pwd.focus();
	  return false;
	 }
	 
	 
	 if(!pass_regx.test(user_pwd.value)) {
	  alert("비밀번호는 영문, 숫자 조합만 가능합니다.");
	  user_pwd.focus();
	  return false;
	 }
 
	 if(user_pwd.value.trim() != user_pwd2.value.trim()) {
	  alert("비밀번호가 서로 일치하지 않습니다.");
	  user_pwd.focus();
	  return false;
	 }
 
	 
	 
}


	
	var pass_regx=/^[1-9a-fA-F]*$/;
			if(!pass_regx.test(obj.value)) {
			   alert("잘못된 값이 입력 되었습니다.\n입력가능 - 1~9, A~F");
			   document.getElementById("wifi_mac_adress_in").value = "";
			   document.getElementById("wifi_mac_adress").value = "";
			   return false;
			}




function checkNum( obj ) {
	
	var num_regx=/^[0-9]*$/;

	if( !num_regx.test(obj.value) ) {
		
		alert('숫자만 입력하세요!');
   	obj.value = obj.value.substring(0, obj.value.length-1 );
   }
   
}


onKeyup="checkNum(this)" 



 if( password_msg == '' && ((/[a-z]/i).test(pass_value) == false || (/\d/).test(pass_value) == false || (/(\~|\!|\@|\#|\$|\%|\^|\&|\*)/g).test(pass_value) == false) ) {
       if( iskorean ) {
			password_msg = "비밀번호는 영문자, 숫자, 특수기호(~!@#$%^&*) 조합으로 8자이상 입력하세요.";
		}else {
			password_msg = "Password is alphabetic, numeric, special symbols (!@#$%^&*) Please enter at least 8 characters with a combination.";
		}
  }



</script>




<%@ include file="../include/footer.jsp" %>