<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


  <!-- Footer -->
  <footer id="aa-footer">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
        <div class="aa-footer-area">
          <div class="row">
            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="aa-footer-left">
               <p>Designed by <a rel="nofollow" href="http://www.markups.io/">MarkUps.io</a></p>
              </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-12">
              <div class="aa-footer-middle">
                <a href="#"><i class="fa fa-facebook"></i></a>
                <a href="#"><i class="fa fa-twitter"></i></a>
                <a href="#"><i class="fa fa-google-plus"></i></a>
                <a href="#"><i class="fa fa-youtube"></i></a>
              </div>
            </div>
            <div class="col-md-6 col-sm-12 col-xs-12">
              <div class="aa-footer-right">
                <a href="#">Home</a>
                <a href="#">Support</a>
                <a href="#">License</a>
                <a href="#">FAQ</a>
                <a href="#">Privacy & Term</a>
              </div>
            </div>            
          </div>
        </div>
      </div>
      </div>
    </div>
  </footer>
  <!-- / Footer -->


<script>
$(document).ready(function(){
	
	//관리자 접근 페이지 레벨 확인
	var adminInterceptorMessage ="${adminInterceptorMessage}";
	if(adminInterceptorMessage.length >3){
		alert(adminInterceptorMessage);
		<%
			session.removeAttribute("adminInterceptorMessage");
		%>
		location.href="/";
	}
	
});

</script>

  
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="/resources/view/js/bootstrap.js"></script>   
  <!-- slick slider -->
  <script type="text/javascript" src="/resources/view/js/slick.js"></script>
  <!-- Price picker slider -->
  <script type="text/javascript" src="/resources/view/js/nouislider.js"></script>
  
  <!-- Custom js -->
  <script src="/resources/view/js/custom.js"></script> 

  </body>
</html>