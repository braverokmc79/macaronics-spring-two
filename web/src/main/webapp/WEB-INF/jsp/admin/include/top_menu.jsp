<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<body class="sidebar-mini skin-yellow-light layout-boxed">


<div class="wrapper">


  <header class="main-header">
    <!-- Logo -->
    <a href="/admin/index" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>M</b>ca</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Macaronics</b></span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">

        
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <img src="/resources/admin/img/cjh.jpg" class="user-image" alt="User Image"> 
              <span class="hidden-xs">
              <c:choose>
              	<c:when test="${ not empty loginAdmin.username }">
              	  ${loginAdmin.username }
              	</c:when>
              	<c:otherwise>
              		 ${loginUser.username }
              	</c:otherwise>
              </c:choose>
           
              </span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="/resources/admin/img/cjh.jpg" class="img-circle" alt="User Image">

                <p>
                  JUNHO CHOI -  Developer
                  <small>2017년 01 월 PROJECT</small>
                </p>
              </li>
              <!-- Menu Body -->
              <li class="user-body">
                <div class="row">
                  <div class="col-xs-4 text-center">
                   <!--  <a href="#">Followers</a> -->
                  </div>
                  <div class="col-xs-4 text-center">
                     <!--  <a href="#">Followers</a> -->
                  </div>
                  <div class="col-xs-4 text-center">
                   <!--  <a href="#">Followers</a> -->
                  </div>
                </div>
                <!-- /.row -->
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="http://macaronics.comlu.com/" class="btn btn-default btn-flat">Macaronics</a>
                </div>
                <div class="pull-right">
                  <a href="/member/logout" class="btn btn-default btn-flat">로그아웃</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
          <!-- <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
          </li>
           -->
          
        </ul>
      </div>
    </nav>
  </header>

  
  
  