<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="../include/header.jsp" %>

<%@ include file="../include/top_menu.jsp" %>

   
   
<%@ include file="../include/side_menu.jsp" %>   
   
   
   
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">            
              <!--overview start-->
			  <div class="row">
				<div class="col-lg-12">
					<h3 class="page-header"><i class="icon_profile"></i> 회원상세 정보</h3>
					<ol class="breadcrumb">
						<li><i class="fa fa-home"></i><a href="/users/index">Home</a></li>
						<li><i class="icon_profile"></i>회원정보</li>						  	
					</ol>
				</div>
			</div>



<div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                            회원정보 Form
                          </header>
                          <div class="panel-body">
                              <form class="form-horizontal " method="get">
                                  <div class="form-group">
                                      <label class="col-sm-2 control-label">아이디</label>
                                      <div class="col-sm-10">
                                          <input type="text" class="form-control">
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-sm-2 control-label">이름</label>
                                      <div class="col-sm-10">
                                          <input type="text" class="form-control">
                                          <span class="help-block">A block of help text that breaks onto a new line and may extend beyond one line.</span>
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-sm-2 control-label">이메일</label>
                                      <div class="col-sm-10">
                                          <input type="text" class="form-control round-input">
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-sm-2 control-label">Input focus</label>
                                      <div class="col-sm-10">
                                          <input class="form-control" id="focusedInput" type="text" value="This is focused...">
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-sm-2 control-label">가입일</label>
                                      <div class="col-sm-10">
                                          <input class="form-control" id="disabledInput" type="text" placeholder="Disabled input here..." disabled="">
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-sm-2 control-label">Placeholder</label>
                                      <div class="col-sm-10">
                                          <input type="text" class="form-control" placeholder="placeholder">
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-sm-2 control-label">Password</label>
                                      <div class="col-sm-10">
                                          <input type="password" class="form-control" placeholder="">
                                      </div>
                                  </div>
                                  <div class="form-group">
                                      <label class="col-lg-2 control-label">Static control</label>
                                      <div class="col-lg-10">
                                          <p class="form-control-static">email@example.com</p>
                                      </div>
                                  </div>
                              </form>
                          </div>
                      </section>
          
                  
                  
                  </div>
              </div>




          </section>
         
         
          <div class="text-right">
          <div class="credits">
                <!-- 
                    All the links in the footer should remain intact. 
                    You can delete the links only if you purchased the pro version.
                    Licensing information: https://bootstrapmade.com/license/
                    Purchase the pro version form: https://bootstrapmade.com/buy/?theme=NiceAdmin
                -->
                <a href="https://bootstrapmade.com/free-business-bootstrap-themes-website-templates/">Business Bootstrap Themes</a> by <a href="https://bootstrapmade.com/">BootstrapMade</a>
            </div>
        </div>
      </section>
      <!--main content end-->
 
 
<%@ include file="../include/footer.jsp" %>







