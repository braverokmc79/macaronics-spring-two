
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<%@ include file="../include/header.jsp" %>


<%@ include file="../include/topmenu.jsp" %>


 <body>  
 

   <section id="aa-signin">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-signin-area">
            <div class="aa-signin-form">
              <div class="aa-signin-form-title">
                <a class="aa-property-home" href="/">Macaronics Home</a>
                <c:choose>
                	<c:when test="${not empty errorMessage }">
                		<h4 style="color:red;">${errorMessage }</h4>
                	</c:when>
                	<c:otherwise>
                		<h4>계정에 로그인하십시오.</h4>	
                	</c:otherwise>
                </c:choose>
                
              </div>
              <form class="contactform" method="post" action="/member/login.do">                                                 
                <div class="aa-single-field">
                  <label for="email">메일 <span class="required">*</span></label>
                  <input type="email" required="required" aria-required="true" value="${messageEmail }" name="email">
                </div>
                <div class="aa-single-field">
                  <label for="password">패스워드 <span class="required">*</span></label>
                  <input type="password" name="userpw"> 
                </div>
                <div class="aa-single-field">
                <label>
                  <input type="checkbox"> Remember me
                </label>                                                          
                </div> 
                <div class="aa-single-submit">
                  <input type="submit" value="로그인" class="aa-browse-btn" name="submit" id="btnLogin">  
                  <p>아직 계정이 없으십니까? <a href="/member/register.do">지금 만드세요!</a></p>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
 



<script>




</script>




<%@ include file="../include/footer.jsp" %>