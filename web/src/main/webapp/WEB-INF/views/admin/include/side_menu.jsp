<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>


  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="/resources/admin/img/cjh.jpg" class="img-circle" alt="User Image"> 
        </div>
        <div class="pull-left info">
          <p>          
          <c:choose>
              	<c:when test="${ not empty loginAdmin.username }">
              	  ${loginAdmin.username }
              	</c:when>
              	<c:otherwise>
              		 ${loginUser.username }
              	</c:otherwise>
              </c:choose>
            </p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>
      <!-- search form -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <!-- /.search form -->



      
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <li class="header"><a href="/"  target="_blank">Macaronics Home</a></li>
        <li>
          <a href="#">
            <i class="fa fa-fw fa-users"></i><span>회원관리</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="/admin/memberList.do"><i class="fa fa-circle-o text-yellow"></i> 회원목록</a></li>
            <li><a href="index2.html"><i class="fa fa-circle-o text-aqua"></i> Dashboard v2</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-files-o"></i>
            <span>갤러리</span>
            <span class="pull-right-container">
              <span class="label label-primary pull-right"></span>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="/admin/gallery/uploadAjax"><i class="fa fa-circle-o"></i> 이미지 업로드</a></li>
            <li><a href="pages/layout/boxed.html"><i class="fa fa-circle-o"></i> Boxed</a></li>
            <li><a href="pages/layout/fixed.html"><i class="fa fa-circle-o"></i> Fixed</a></li>
            <li><a href="pages/layout/collapsed-sidebar.html"><i class="fa fa-circle-o"></i> Collapsed Sidebar</a></li>
          </ul>
        </li>
        
        
        <li>
          <a href="/admin/category/register">
            <i class="glyphicon glyphicon-align-right"></i> <span>카테고리등록</span>
            <span class="pull-right-container">
            
            </span>
          </a>
        </li>
        
        
        
        <li >
          <a href="/admin/shop/products/write">
            <i class="glyphicon glyphicon-gift"></i> <span>상품등록</span>
            <span class="pull-right-container">
            
            </span>
          </a>
        </li>
        
        <li>	
          <a href="/admin/shop/products/proudctList">
            <i class="glyphicon glyphicon-list"></i> <span>상품 목록</span>
            <span class="pull-right-container">
            
            </span>
          </a>
        </li>
        
         <li >
          <a href="/admin/recommended/registerForm">
            <i class="glyphicon glyphicon-heart-empty"></i> <span>오늘의 추천 상품 등록</span>
            <span class="pull-right-container"> 
            </span>
          </a>
        </li>
        
        <li>
          <a href="/admin/recommended/registerForm">
             <img src="/resources/admin/img/coupon.jpg"  style="max-height: 18px; max-width: 18px;"><span> 쿠폰 관리</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="/admin/coupon/registerForm"><i class="fa fa-circle-o text-red"></i> 쿠폰등록</a></li>
            <li><a href="/admin/coupon/couponList"><i class="fa fa-circle-o text-yellow"></i> 쿠폰목록</a></li>
          </ul>
        </li>
        
        
        <li>
          <a href="/admin/recommended/registerForm">
            <img src="/resources/admin/img/event.jpg"  style="max-height: 18px; max-width: 18px;"><span> 이벤트 관리</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
            <ul class="treeview-menu">
            <li class="active"><a href="/admin/memberList.do"><i class="fa fa-circle-o text-red"></i> 이벤트등록</a></li>
            <li><a href="index2.html"><i class="fa fa-circle-o text-yellow"></i> 이벤트목록</a></li>
          </ul>
        </li>
        
        
        
         <li>
          <a href="/admin/recommended/registerForm">
            <i class="glyphicon glyphicon-picture"></i> <span>메인상품 관리</span>
            <span class="pull-right-container">   
            </span>
          </a>
        </li>
        
        
    	<li>
          <a href="/admin/recommended/registerForm">
            <i class="glyphicon glyphicon-question-sign"></i> <span>Q&A 관리</span>
            <span class="pull-right-container">   
            </span>
          </a>
        </li>
        
        
        <li>
          <a href="/admin/recommended/registerForm">
            <i class="glyphicon glyphicon-shopping-cart"></i> <span>장바구니 관리</span>
            <span class="pull-right-container">   
            </span>
          </a>
        </li>
        
        
        
        <li>
          <a href="/admin/recommended/registerForm">
            <i class="glyphicon glyphicon-off" ></i> <span>결제 상품 관리</span>
            <span class="pull-right-container">   
            </span>
          </a>
        </li>
        
        
        
        
        <li class="treeview">
          <a href="#">
            <i class="fa fa-pie-chart"></i>
            <span>차트</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="/admin/chart/google"><i class="fa fa-circle-o text-aqua"></i>카테고리 별 등록된 상품 개수</a></li>
       
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-laptop"></i>
            <span>PDF</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="/admin/pdf/board"><i class="fa fa-circle-o text-yellow"></i>게시판 출력</a></li>
   <!--          <li><a href="pages/UI/icons.html"><i class="fa fa-circle-o"></i> Icons</a></li>
            <li><a href="pages/UI/buttons.html"><i class="fa fa-circle-o"></i> Buttons</a></li>
            <li><a href="pages/UI/sliders.html"><i class="fa fa-circle-o"></i> Sliders</a></li>
            <li><a href="pages/UI/timeline.html"><i class="fa fa-circle-o"></i> Timeline</a></li>
            <li><a href="pages/UI/modals.html"><i class="fa fa-circle-o"></i> Modals</a></li> -->
          </ul>
        </li>

        <li>
          <a href="pages/calendar.html">
            <i class="fa fa-calendar"></i> <span>Calendar</span>
            <span class="pull-right-container">
              <small class="label pull-right bg-red">3</small>
              <small class="label pull-right bg-blue">17</small>
            </span>
          </a>
        </li>
        <li>
          <a href="pages/mailbox/mailbox.html">
            <i class="fa fa-envelope"></i> <span>메일 보내기</span>
            <span class="pull-right-container">
              <small class="label pull-right bg-yellow">12</small>
              <small class="label pull-right bg-green">16</small>
              <small class="label pull-right bg-red">5</small>
            </span>
          </a>
        </li>



        <li><a href="documentation/index.html"><i class="fa fa-book"></i> <span>Documentation</span></a></li>


      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
      