<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>



      <!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu">                
                  <li class="active">
                      <a class="" href="/">
                          <i class="icon_house_alt"></i>
                          <span>Macaronic</span>
                      </a>
                  </li>
                  
                  <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="fa fa-fw fa-users"></i>
                          <span>회원 정보</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                      <ul class="sub">
                          <li><a class="" href="/users/userinfo?userid=${sessionScope.userid }">상세정보</a></li>                          
                          <li><a class="" href="form_validation.html">회원정보수정</a></li>
                          <li><a class="" href="form_validation.html">비밀번호변경</a></li>
                      </ul>
                  </li>  
                  
				  <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="icon_cart"></i>
                          <span>나의 상품</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                      <ul class="sub">
                          <li><a class="" href="/users/myproduct/cart.do">장바구니</a></li>                          
                          <li><a class="" href="/users/myproduct/paymentList.do">결제대기</a></li>
                          <li><a class="" href="form_validation.html">배송대기</a></li>
                      </ul>
                  </li>  
                       
                  <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="icon_clipboard"></i>
                          <span>한줄 메모장</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                   <ul class="sub">
                          <li><a class="" href="/users/memo/list.do">메모 목록</a></li>                          
                          <li><a class="" href="/users/memo/memoWriteForm">한줄 메목 적기</a></li>
                      </ul>
                  </li>
                  
  
                             
  
                  
                  <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="icon_documents_alt"></i>
                          <span>Q & A</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                      <ul class="sub">                          
                          <li><a class="" href="/users/qna/registerform.do">문의 등록</a></li>
                          <li><a class="" href="/users/qna/qnaList"><span>나의 문의 내용</span></a></li>
                         
                      </ul>
                  </li>
                  
              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->
      
   
   