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
		  <div class="row">
				<div class="col-lg-12">
					<h3 class="page-header"><i class="fa fa fa-bars"></i> Q&A</h3>
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i><a href="/users/index">Home</a></li>
						<li><i class="fa fa-bars"></i>Q&A</li>
						<li><i class="fa fa-square-o"></i>Q & A 목록 </li>
					</ol>
				</div>
			</div>
              <!-- page start-->
             
             
             <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                             <a href="/users/qna/registerform.do">1:1 문의</a>
                          </header>
                         <div class="table-responsive"> 
                          <table class="table table-striped table-advance table-hover">
                           <tbody>
                              <tr>
                                 <th>번호</th>
                                 
                                 <th> 제목</th>
                                
                                 <th>등록일</th>
                             
                                 <th><i class="icon_cogs"></i> Action</th>
                              </tr>
                       
                       <c:if test="${ empty list }">
                       		<tr>
                       			<td colspan="4" style="text-align: center;">
                       				<span style="color:red;"> 문의 내용이 없습니다.</span>              				 
                       			</td>
                       		</tr>
                       </c:if>      
              			
              			 <c:forEach items="${list}" var="row" varStatus="step"> 
                              <tr>
                                 <td>${ step.index+1 }</td>             
                               
                                <td> 
                               
                                <c:choose>
	                                 <c:when test="${fn:length(row.subject) >20 }">
	                                 	<small><c:out value="${  XssDefender.removeTag(fn:substring(row.subject, 0, 20))}"/>....</small>
	                                 </c:when>
	                                <c:otherwise>
	                                	<small><c:out value="${row.subject}" /></small>
	                                </c:otherwise>
                                </c:choose>
                                </td>
                                 
                                 <td><fmt:formatDate value="${row.regdate }"  type="both" dateStyle="short" timeStyle="short" /></td>
                                 <td>
                                  <div class="btn-group">
                                      <a class="btn btn-primary" href="#" onclick="modalOpen(${row.idx})"><i class="icon_plus_alt2"></i></a>
                                  </div>
                                  </td>
                              </tr>
             
                          </c:forEach>
     
                           </tbody>
                        </table>
     
            
                        </div>
                      </section>
                  </div>
              </div>
             
             
             
             
             
    <div class="text-right">
        <div class="credits">
      <a href="http://macaronics.comlu.com/">Macaronics</a> by <a href="http://macaronics.comlu.com/">JUNHO CHOI</a>
        </div>
    </div>
             
             
             
          </section>
      </section>
      
     
 
 



  
<%@ include file="../include/footer.jsp" %>








