
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
  
<c:set value="<%= request.getRequestURI() %>" var="curUrl"  />

 <!-- Pre Loader -->
  <div id="aa-preloader-area">
    <div class="pulse"></div>
  </div>
  <!-- SCROLL TOP BUTTON -->
    <a class="scrollToTop" href="#"><i class="fa fa-angle-double-up"></i></a>
  <!-- END SCROLL TOP BUTTON -->

  <!-- Start header section -->
  <header id="aa-header">  
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="aa-header-area">
            <div class="row">
              <div class="col-md-6 col-sm-6 col-xs-6">
                <div class="aa-header-left">
                  <div class="aa-telephone-no">
                    <span class="fa fa-bars"></span>
                    서버 환경  :  <span style="color: red;">${ServerEnvironment }</span>
                  
                  </div>
                  <div class="aa-email hidden-xs">
                   <a href="/admin/index">개발자: JUNHO-CHOI</a> <span class="fa fa-envelope-o"></span><a href="mailto:braverokmc79@gmail.com">braverokmc79@gmail.com</a>
                  </div>
                </div>              
              </div>
              
              
              <div class="col-md-6 col-sm-6 col-xs-6">
                <div class="aa-header-right">
               <c:choose>
	               	<c:when test="${ not empty sessionScope.loginUser }">
	               	     <c:if test="${ loginUser.member_level  >= 15}"  >
	               	    	  <a href="/admin/index" class="aa-register">관리자</a>
	               	     </c:if>
		                  <a href="/users/index" class="aa-register">${ loginUser.userid } 회원님</a>
		                  <a href="/users/userinfo.do?userid=${loginUser.userid }" class="aa-register">회원정보</a>                  
		                  <a href="/member/register.do" class="aa-register">회원가입</a>
		                  <a href="/member/logout" class="aa-login">로그아웃</a>
	               	</c:when>
	               	<c:otherwise>
 
                  		<a href="/member/register.do" class="aa-register">회원가입</a>
                		<a href="/member/loginform.do" class="aa-login">Login</a>
	               	</c:otherwise>
               </c:choose>

 			   </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </header>
  <!-- End header section -->

  <!-- Start menu section -->
  <section id="aa-menu-area">
    <nav class="navbar navbar-default main-navbar" role="navigation">  
      <div class="container">
        <div class="navbar-header">
          <!-- FOR MOBILE VIEW COLLAPSED BUTTON -->
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <!-- LOGO -->                                               
          <!-- Text based logo -->
           <a class="navbar-brand aa-logo" href="/"> Macaronics <span>SHOP</span></a>
           <!-- Image based logo -->
           <!-- <a class="navbar-brand aa-logo-img" href="index.html"><img src="/resources/view/img/logo.png" alt="logo"></a> -->
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul id="top-menu" class="nav navbar-nav navbar-right aa-main-nav">

            <li <c:if test='${curUrl.contains("home") }'> class="active"</c:if> >
            	<a href="/">HOME</a>
            </li>
             <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" href="/board/listAll.do">Free 게시판 <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">                
                <li><a href="/board/listAll.do">Free 게시글목록</a></li>
                <li><a href="/board/write.do">게시글 등록하기</a></li> 
                <li><a href="/messages/messageform">메시지 전송테스트</a></li>
                 <li><a href="/upload/uploadForm">업로드 테스트</a></li> 
                 <li><a href="/upload/uploadiframe">업로드 iframe 테스트</a></li>                                            
              </ul>
            </li>
            
            
            <li class="dropdown">
            	<a class="dropdown-toggle" data-toggle="dropdown" href="/gallery/list">갤러리<span class="caret"></span></a>
            	<ul class="dropdown-menu" role="menu">                
                <li><a href="/gallery/view/list.do">GALLERY LIST</a></li> 
                <li><a href="/gallery/view/gallery2.do">GALLERY UPLOAD TEST</a></li>                                            
              </ul>
            </li>                                         
            
            <li class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" href="blog-archive.html">상품 <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">                
                <li><a href="/shop/products/list.do">상품목록</a></li>
                
                <c:if test="${not empty loginUser }">
                 <li><a href="/shop/cart/list.do">장바구니 목록</a></li>  
                 </c:if>                                          
              </ul>
            </li>
            <li><a href="contact.html">CONTACT</a></li>
           <li><a href="404.html">404 PAGE</a></li>
          </ul>                            
        </div><!--/.nav-collapse -->       
      </div>          
    </nav> 
  </section>
  <!-- End menu section -->

  
  
  
  