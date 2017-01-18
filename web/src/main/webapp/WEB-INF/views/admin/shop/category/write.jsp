<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
     
<%@ include file="../../include/header.jsp" %>      
      
<%@ include file="../../include/top_menu.jsp" %>

<%@ include file="../../include/side_menu.jsp" %>      
      
<style>
.fileDrop{
	width:100%;
	height:300px;
	border:1px solid #DD4B39;
	background-color : rgba(221, 75, 57, 0.5);
	margin-top:50px;
}

small{
	margin-left:3px;
	font-weight:bold;
	color:gray;
}

.uploadedList{
	margin-top: 50px;
}
</style> 
 
 
 
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">


    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        상품 카테고리 등록  
      </h1>
      <ol class="breadcrumb">
        <li><a href="/admin/index"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">category</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
     

<div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title"></h3>
           
            </div>
            <!-- /.box-header -->

            <div class="box-body" >
          
       
       
       
       <section class="content">
      <div class="row">
        <!-- left column -->
        <div class="col-md-6">
          <!-- general form elements -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">1차 카테고리 등록</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form1" method="post" action="/admin/category/categoryoneInsert.do" >
              <div class="box-body">
              <c:if test="${not empty categoryOne }">
              <div class="form-group">
                  <label >1차 카테고리 목록</label>
                  <select class="form-control" id="categoryOne" onchange="CategoryOneChange()">
                    <c:forEach items="${ categoryOne}" var="row">
                    	<option value="${row.idx }" >${row.title }</option>
					</c:forEach>
                  </select>
                </div>
    		</c:if>
              
                <div class="form-group">
                  <label for="categoryOneTitle"></label>
                  <input type="text" class="form-control" id="categoryOneTitle"  name="title" placeholder="1차 카테고리 입력">
                </div>

              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit" class="btn btn-primary" id="categoryOneSubmitBtn">1차 카테고리 등록</button>
                <button type="button" class="btn btn-warning" id="categoryOneAlterBtn">수정</button>
                <button type="button" class="btn btn-danger" id="categoryOneDelete">삭제</button>
              </div>
            </form>
          
          
          </div>
          <!-- /.box -->
          
          
          

          <!-- Form Element sizes -->
         
          <div class="box box-success">
            <div class="box-header with-border">
               <h3 class="box-title">2차 카테고리 등록</h3>
            </div>
            <div class="box-body">
           
            <!-- form start -->
            <form role='form2' method="post" action="/admin/category/categorytwoInsert.do" >
              <div class="box-body">
              <p>1차 카테고리 : <span id="categoryTwoP" style="color:red;"></span></p>
              
          
              <div class="form-group">
                  <label >2차 카테고리 목록</label>
                  <select class="form-control" id="categoryTwo" >
                    <c:forEach items="${ categoryTwo}" var="row">
                    	<option value="${row.bno }" >${row.title }</option>
					</c:forEach>
                  </select>
                </div>
    		
        
                <div class="form-group">
                  <label for="categoryTwoTitle"></label>
                  <input type="hidden" value="" name="idx" id="categoryTwoIdx">
                  <input type="hidden" value="" name="bno" id="categoryTwoBno">
                  <input type="text" class="form-control" id="categoryTwoTitle"  name="title" placeholder="2차 카테고리 입력">
                </div>

              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                <button type="button" class="btn btn-primary" id="categoryTwoSubmitBtn">2차 카테고리 등록</button>
                <button type="button" class="btn btn-warning" id="categoryTwoAlterBtn">수정</button>
                <button type="button" class="btn btn-danger" id="categoryTwoDelete">삭제</button>
              </div>
            </form>
 
           
            </div>
            <!-- /.box-body -->
          </div>
         
         
         
         
          <!-- /.box -->

          <div class="box box-danger">
            <div class="box-header with-border">
              <h3 class="box-title">Different Width</h3>
            </div>
            <div class="box-body">
              <div class="row">
                <div class="col-xs-3">
                  <input type="text" class="form-control" placeholder=".col-xs-3">
                </div>
                <div class="col-xs-4">
                  <input type="text" class="form-control" placeholder=".col-xs-4">
                </div>
                <div class="col-xs-5">
                  <input type="text" class="form-control" placeholder=".col-xs-5">
                </div>
              </div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

          <!-- Input addon -->
          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Input Addon</h3>
            </div>
            <div class="box-body">
              <div class="input-group">
                <span class="input-group-addon">@</span>
                <input type="text" class="form-control" placeholder="Username">
              </div>
              <br>

              <div class="input-group">
                <input type="text" class="form-control">
                <span class="input-group-addon">.00</span>
              </div>
              <br>

              <div class="input-group">
                <span class="input-group-addon">$</span>
                <input type="text" class="form-control">
                <span class="input-group-addon">.00</span>
              </div>

              <h4>With icons</h4>

              <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                <input type="email" class="form-control" placeholder="Email">
              </div>
              <br>

              <div class="input-group">
                <input type="text" class="form-control">
                <span class="input-group-addon"><i class="fa fa-check"></i></span>
              </div>
              <br>

              <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-dollar"></i></span>
                <input type="text" class="form-control">
                <span class="input-group-addon"><i class="fa fa-ambulance"></i></span>
              </div>

              <h4>With checkbox and radio inputs</h4>

              <div class="row">
                <div class="col-lg-6">
                  <div class="input-group">
                        <span class="input-group-addon">
                          <input type="checkbox">
                        </span>
                    <input type="text" class="form-control">
                  </div>
                  <!-- /input-group -->
                </div>
                <!-- /.col-lg-6 -->
                <div class="col-lg-6">
                  <div class="input-group">
                        <span class="input-group-addon">
                          <input type="radio">
                        </span>
                    <input type="text" class="form-control">
                  </div>
                  <!-- /input-group -->
                </div>
                <!-- /.col-lg-6 -->
              </div>
              <!-- /.row -->

              <h4>With buttons</h4>

              <p class="margin">Large: <code>.input-group.input-group-lg</code></p>

              <div class="input-group input-group-lg">
                <div class="input-group-btn">
                  <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown">Action
                    <span class="fa fa-caret-down"></span></button>
                  <ul class="dropdown-menu">
                    <li><a href="#">Action</a></li>
                    <li><a href="#">Another action</a></li>
                    <li><a href="#">Something else here</a></li>
                    <li class="divider"></li>
                    <li><a href="#">Separated link</a></li>
                  </ul>
                </div>
                <!-- /btn-group -->
                <input type="text" class="form-control">
              </div>
              <!-- /input-group -->
              <p class="margin">Normal</p>

              <div class="input-group">
                <div class="input-group-btn">
                  <button type="button" class="btn btn-danger">Action</button>
                </div>
                <!-- /btn-group -->
                <input type="text" class="form-control">
              </div>
              <!-- /input-group -->
              <p class="margin">Small <code>.input-group.input-group-sm</code></p>

              <div class="input-group input-group-sm">
                <input type="text" class="form-control">
                    <span class="input-group-btn">
                      <button type="button" class="btn btn-info btn-flat">Go!</button>
                    </span>
              </div>
              <!-- /input-group -->
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

        </div>
        <!--/.col (left) -->
        
        
        
        <!-- right column -->
        <div class="col-md-6">
         
          <!-- Horizontal Form -->
          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title"></h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
   
        	   <div class="form-group" style="min-height: 200px;">
                  <label>1차 카테고리 목록</label>
                  <c:if test="${not empty categoryOne }">
                   
                  <select multiple="" class="form-control" disabled="" style="height: 190px;">
                    <c:forEach items="${ categoryOne}" var="row">
                    	<option value="${row.idx }" >${row.title }</option>
					</c:forEach>
                  </select>
                 </c:if>
               
               </div>
        
          </div>
          <!-- /.box -->
          
          
                    <!-- Horizontal Form -->
          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title"></h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
   
        	   <div class="form-group" style="min-height: 260px;">
                  <label>2차 카테고리 목록</label>
                  <c:if test="${not empty categoryOne }">
                   
                  <select multiple="" class="form-control" disabled="" style="height: 190px;" id="showCategoryTwo">
                   
                  </select>
                 </c:if>
               
               </div>
        
          </div>
          <!-- /.box -->
          
          
          
          <!-- general form elements disabled -->
          <div class="box box-warning">
            <div class="box-header with-border">
              <h3 class="box-title">General Elements</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <form role="form">
                <!-- text input -->
                <div class="form-group">
                  <label>Text</label>
                  <input type="text" class="form-control" placeholder="Enter ...">
                </div>
                <div class="form-group">
                  <label>Text Disabled</label>
                  <input type="text" class="form-control" placeholder="Enter ..." disabled="">
                </div>

                <!-- textarea -->
                <div class="form-group">
                  <label>Textarea</label>
                  <textarea class="form-control" rows="3" placeholder="Enter ..."></textarea>
                </div>
                <div class="form-group">
                  <label>Textarea Disabled</label>
                  <textarea class="form-control" rows="3" placeholder="Enter ..." disabled=""></textarea>
                </div>

                <!-- input states -->
                <div class="form-group has-success">
                  <label class="control-label" for="inputSuccess"><i class="fa fa-check"></i> Input with success</label>
                  <input type="text" class="form-control" id="inputSuccess" placeholder="Enter ...">
                  <span class="help-block">Help block with success</span>
                </div>
                <div class="form-group has-warning">
                  <label class="control-label" for="inputWarning"><i class="fa fa-bell-o"></i> Input with
                    warning</label>
                  <input type="text" class="form-control" id="inputWarning" placeholder="Enter ...">
                  <span class="help-block">Help block with warning</span>
                </div>
                <div class="form-group has-error">
                  <label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> Input with
                    error</label>
                  <input type="text" class="form-control" id="inputError" placeholder="Enter ...">
                  <span class="help-block">Help block with error</span>
                </div>

                <!-- checkbox -->
                <div class="form-group">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox">
                      Checkbox 1
                    </label>
                  </div>

                  <div class="checkbox">
                    <label>
                      <input type="checkbox">
                      Checkbox 2
                    </label>
                  </div>

                  <div class="checkbox">
                    <label>
                      <input type="checkbox" disabled="">
                      Checkbox disabled
                    </label>
                  </div>
                </div>

                <!-- radio -->
                <div class="form-group">
                  <div class="radio">
                    <label>
                      <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="">
                      Option one is this and that—be sure to include why it's great
                    </label>
                  </div>
                  <div class="radio">
                    <label>
                      <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
                      Option two can be something else and selecting it will deselect option one
                    </label>
                  </div>
                  <div class="radio">
                    <label>
                      <input type="radio" name="optionsRadios" id="optionsRadios3" value="option3" disabled="">
                      Option three is disabled
                    </label>
                  </div>
                </div>

                <!-- select -->
                <div class="form-group">
                  <label>Select</label>
                  <select class="form-control">
                    <option>option 1</option>
                    <option>option 2</option>
                    <option>option 3</option>
                    <option>option 4</option>
                    <option>option 5</option>
                  </select>
                </div>
                <div class="form-group">
                  <label>Select Disabled</label>
                  <select class="form-control" disabled="">
                    <option>option 1</option>
                    <option>option 2</option>
                    <option>option 3</option>
                    <option>option 4</option>
                    <option>option 5</option>
                  </select>
                </div>

                <!-- Select multiple-->
                <div class="form-group">
                  <label>Select Multiple</label>
                  <select multiple="" class="form-control">
                    <option>option 1</option>
                    <option>option 2</option>
                    <option>option 3</option>
                    <option>option 4</option>
                    <option>option 5</option>
                  </select>
                </div>
                <div class="form-group">
                  <label>Select Multiple Disabled</label>
                  <select multiple="" class="form-control" disabled="">
                    <option>option 1</option>
                    <option>option 2</option>
                    <option>option 3</option>
                    <option>option 4</option>
                    <option>option 5</option>
                  </select>
                </div>

              </form>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!--/.col (right) -->
      </div>
      <!-- /.row -->
    </section>
       
       
       
       
       
       		
       	
       		</div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
      </div>





    </section>









<script>
  
$(document).ready(function(){
	var message ='${message}';
	if(message.length >3){
		alert(message);
	}
	//2차 카테고리 호출
	CategoryOneChange();
	
	// 1차 카테고리 등록
	$("#categoryOneSubmitBtn").click(function(event){
		event.preventDefault();
		if($("#categoryOneTitle").val().length < 1){
			alert("1차 카테고리를 입력 해 주세요!");
			$("#categoryOneTitle").focus();
			return;
		}
		
		$("form[role='form1']").submit();
		
	});
	
	//1차 카테고리 수정
	$("#categoryOneAlterBtn").click(function(){
	
		var idx =$("#categoryOne").val();
		var title =$("#categoryOne option:selected").text();
	
		//alert(idx + " : " +title);
		$(".modal-title").text("1차 카테고리 수정");
		$("#idx").val(idx);
		$("#title").val(title);
		
		$("#modalSave").css("display", "");
		$("#modalSave2").css("display", "none");
		$("#modalSave3").css("display", "none");
		
		
		$("#categoryModalOne").modal("toggle");

	});
	
	$("#modalSave").click(function(){
		
		var idx= $("#idx").val();
		
		
		if(idx ==""){
			
			alert("수정할 1차 카테고리가 없습니다.");
			$("#categoryModalOne").modal("toggle");
			return;
		}
		
		
		var title= $("#title").val();
		
		if(title.length <1){
			alert("1차 카테고리를 입력 해주세요.");
			
			return;
		}
		
		//alert(idx + " : "+ title);
		$.ajax({		
			url :"/admin/category/categoryUpdate.do",
			type:"PUT",
			datType:"text",
			contentType:"application/json",
			data:JSON.stringify({
				idx:idx,
				title:title
			}),
			success:function(result){
				
				if(result=="SUCCESS"){
					alert("수정 했습니다.");
					location.href="/admin/category/register.do";	
				}
			}
		});
		
	});
	
	
	//1차 카테고리 삭제
	$("#categoryOneDelete").click(function(){
	
		var idx =$("#categoryOne").val();
		
		if(idx==null){
			alert("삭제할 1차 카테고리가 없습니다.");
			return;
		}
		
		var title =$("#categoryOne option:selected").text();
	
		if(confirm("하위 카테고리 목록 까지 삭제 됩니다. 정말 삭제 하시겠습니까?")){
			$.ajax({
				url :"/admin/category/categoryDelete.do/"+idx,
				type:"delete",
				success:function(result){
					
					if(result=="deleted"){
						alert("삭제 했습니다.");
						location.href="/admin/category/register.do";	
					}else{
						alert(result);	
					}
						
				}
			});				
		}		
	});
	
	
	//2차 카테고리 등록
	$("#categoryTwoSubmitBtn").click(function(){
		var textconfirm =$("#categoryTwoP").text();
		var categoryTwoTitle =$("#categoryTwoTitle").val();
		if(textconfirm=="1차 카테고리 먼저 입력 해 주세요."){
			alert(textconfirm);
			return;
		}
		
		if(categoryTwoTitle.length<1){
			alert("2차 카테고리를 입력해주세요.");
			$("#categoryTwoTitle").focus();
			return;
		}
	
		$("form[role='form2']").submit();
		
	});
	
	
	
	//2차 카테고리 데이터 수정 모달 전송
	$("#categoryTwoAlterBtn").click(function(){
	
		var bno =$("#categoryTwo").val();
		var title =$("#categoryTwo option:selected").text();
		//alert(bno);
		//alert(idx + " : " +title);
		$(".modal-title").text("2차 카테고리 수정");
		$("#bno").val(bno);
		$("#title").val(title);
		
		$("#modalSave").css("display", "none");
		$("#modalSave2").css("display", "");
		$("#modalSave3").css("display", "none");
		
		$("#categoryModalOne").modal("toggle");

	});
	
	$("#modalSave2").click(function(){
		
		var idx= $("#idx").val();
		
		var bno= $("#bno").val();
		
		if(bno==""){
			alert("수정할 2차 카테고리가 없습니다.");
			$("#categoryModalOne").modal("toggle");
			return;
		}
		
		var title= $("#title").val();
		
		if(title.length <1){
			alert("2차 카테고리를 입력 해주세요.");
			
			return;
		}
		
		//alert(idx + " : "+ title);
		$.ajax({		
			url :"/admin/category/categoryTwoUpdate.do",
			type:"PUT",
			datType:"text",
			contentType:"application/json",
			data:JSON.stringify({
				bno:bno,
				title:title
			}),
			success:function(result){
				
				if(result=="SUCCESS"){
					alert("수정 했습니다.");
					//2차 카테고리 목록 불러오기
					CategoryTowList(idx);
					$("#categoryModalOne").modal("toggle");
				}
			}
		});
		
		
	});
	
	
	//2차 카테고리 삭제
	$("#categoryTwoDelete").click(function(){
	
		var bno =$("#categoryTwo").val();
		
		if(bno==null){
			alert("삭제할 2차 카테고리가 없습니다.");
			return;
		}
		
		var title =$("#categoryOne option:selected").text();
	
		if(confirm("하위 카테고리 목록 까지 삭제 됩니다. 정말 삭제 하시겠습니까?")){
			$.ajax({
				url :"/admin/category/categoryTwoDelete.do/"+bno,
				type:"delete",
				success:function(result){
					
					if(result=="deleted"){
						alert("삭제 했습니다.");
						location.href="/admin/category/register.do";	
					}else{
						alert(result);	
					}
						
				}
			});				
		}		
	});
	
	
	
	
	
});
 

//1 카테고리 체인지
function CategoryOneChange(){
	
	var idx =$("#categoryOne").val();
	$("#categoryTwoIdx").val(idx);
	
	var categoryOenText =$("#categoryOne option:selected").text();
	if(categoryOenText.length<1){
		$("#categoryTwoP").text("1차 카테고리 먼저 입력 해 주세요.");
	}else{
		$("#categoryTwoP").text(categoryOenText);	
	}
	//모달에 idx 전송
	$("#idx").val(idx);
	
	//2차 카테고리 목록 불러오기
	CategoryTowList(idx);
	
	
}

//2차 카테고리 목록 불러오기
function CategoryTowList(idx){
	
	
	$.getJSON("/admin/category/categoryTwoList.do/"+idx , function(data){
		var str ="";
		
		$(data).each(function(){
			str +="<option value="+this.bno+" >"+this.title+"</option>";
			
		});
		$("#categoryTwo").html(str);
		$("#showCategoryTwo").html(str);
	});
	
	
	
}



</script>






<div class="modal modal-info" id="categoryModalOne">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">×</span></button>
                <h4 class="modal-title"></h4>
              </div>
              <div class="modal-body">
                      <input type="hidden" name="idx" id="idx"  class="form-control" >
			          <input type="hidden" name="bno" id="bno"  class="form-control" >
			          <input type="hidden" name="rno" id="rno"  class="form-control" >
			          <input type="text" name="title" class="form-control" id="title">
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-outline" id="modalSave">수정하기</button>
                <button type="button" class="btn btn-outline" id="modalSave2" style="display: none;" >수정하기</button>
                <button type="button" class="btn btn-outline" id="modalSave3" style="display: none;">수정하기</button>
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
</div>
  
<%@ include file="../../include/content_footer.jsp" %>

  
<%@ include file="../../include/control_sidebar.jsp" %>
  
  
<%@ include file="../../include/footer.jsp" %>  
  