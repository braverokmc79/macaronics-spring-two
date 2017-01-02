<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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






<%@ include file="../include/footer.jsp" %>