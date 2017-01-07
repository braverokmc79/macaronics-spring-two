<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<c:forEach items="${list }"  var="row">

 <li>
   <div class="media">
     <div class="media-left">    
         <img alt="img" src="img/testimonial-1.png" class="media-object news-img">      
     </div>
     <div class="media-body">
      <h4 class="author-name">1111Adam Barney</h4>
      <span class="comments-date"> 20th April, 2016</span>
      <p>${ row.replytext}</p>
      <a class="reply-btn" href="#">Reply</a>
     </div>
   </div>
</li>    


</c:forEach>