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
            <form role="form1" method="post" action="/admin/category/categoryoneInsert" >
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
            <form role='form2' method="post" action="/admin/category/categorytwoInsert" >
              <div class="box-body">
              <p>1차 카테고리 : <span id="categoryTwoP" style="color:red;"></span></p>
              
          
              <div class="form-group">
                  <label >2차 카테고리 목록</label>
                  <select class="form-control" id="categoryTwo" onchange="categoryTwoChange()">

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
         
         
         
         
         
          <!-- Form Element sizes -->
         
          <div class="box box-success">
            <div class="box-header with-border">
               <h3 class="box-title">3차 카테고리 등록</h3>
            </div>
            <div class="box-body">
           
            <!-- form start -->
            <form role='form3' method="post" action="/admin/category/categoryThreeInsert" >
              <div class="box-body">
              <p>1차 카테고리 : <span id="categoryThreeP" style="color:red;"></span></p>
              <p>2차 카테고리 : <span id="categoryThreePtext" style="color:red;"></span></p>
          	
         
           <div id="list3" >
              <div class="form-group">
                  <label >3차 카테고리 목록</label>
                  <select class="form-control" id="categoryThree" >

                  </select>
             </div>
    		
        
                <div class="form-group">
                  <label for="categoryThreeTitle"></label>
                 <input type="hidden" value="" name="idx" id="categoryThreeIdx">
                 <input type="hidden" value="" name="bno" id="categoryThreeBno">
                   <input type="hidden" value="" name="rno" id="categoryThreeRno">
                  <input type="text" class="form-control" id="categoryThreeTitle"  name="title" placeholder="3차 카테고리 입력">
                </div>

              
              <!-- /.box-body -->

              <div class="box-footer">
                <button type="button" class="btn btn-primary" id="categoryThreeSubmitBtn">3차 카테고리 등록</button>
                <button type="button" class="btn btn-warning" id="categoryThreeAlterBtn">수정</button>
                <button type="button" class="btn btn-danger" id="categoryThreeDelete">삭제</button>
              </div>
         
           </div> 
          
              </div>       
            </form>
 
           
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
               
                   
                  <select multiple="" class="form-control" disabled="" style="height: 190px;" id="showCategoryTwo">
                   
                  </select>
               
               
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
                  <label>3차 카테고리 목록</label>
                
                   
                  <select multiple="" class="form-control" disabled="" style="height: 190px;" id="showCategoryThree">          
                  </select>
                
               
               </div>
        
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
			url :"/admin/category/categoryUpdate",
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
					location.href="/admin/category/register";	
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
				url :"/admin/category/categoryDelete/"+idx,
				type:"delete",
				success:function(result){
					
					if(result=="deleted"){
						alert("삭제 했습니다.");
						location.href="/admin/category/register";	
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
			url :"/admin/category/categoryTwoUpdate",
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
				url :"/admin/category/categoryTwoDelete/"+bno,
				type:"delete",
				success:function(result){
					
					if(result=="deleted"){
						alert("삭제 했습니다.");
						location.href="/admin/category/register";	
					}else{
						alert(result);	
					}
						
				}
			});				
		}		
	});
	
	
	
	//3차 카테고리 등록
	$("#categoryThreeSubmitBtn").click(function(){
		var textconfirm =$("#categoryThreePtext").text();
		var categoryThreeTitle =$("#categoryThreeTitle").val();
		
		if(textconfirm=="2차 카테고리 먼저 입력 해 주세요."){
			alert(textconfirm);
			return;
		}
		
		if(categoryThreeTitle.length<1){
			alert("3차 카테고리를 입력해주세요.");
			$("#categoryThreeTitle").focus();
			return;
		}
	
		$("form[role='form3']").submit();
		
		
		
	});
	
	
	//3차 카테고리 데이터 수정 모달 전송
	$("#categoryThreeAlterBtn").click(function(){
	
		var bno =$("#categoryThreeBno").val();
		var rno =$("#categoryThree").val();
		var title =$("#categoryThree option:selected").text();
		//alert(bno);
		//alert(idx + " : " +title);
		$(".modal-title").text("3차 카테고리 수정");

		$("#bno").val(bno);
		$("#rno").val(rno);
		
		$("#title").val(title);
		
		$("#modalSave").css("display", "none");
		$("#modalSave2").css("display", "none");
		$("#modalSave3").css("display", "");
		
		$("#categoryModalOne").modal("toggle");

	});
	
	$("#modalSave3").click(function(){
		
		var idx= $("#idx").val();
		var bno= $("#bno").val();
		var rno=$("#rno").val();
	
		var title= $("#title").val();
		
		if(title.length <1){
			alert("3차 카테고리를 입력 해주세요.");
			
			return;
		}
		
		//alert(idx + " : "+ title);
		$.ajax({		
			url :"/admin/category/categoryThreeUpdate",
			type:"PUT",
			datType:"text",
			contentType:"application/json",
			data:JSON.stringify({
				rno:rno,
				title:title
			}),
			success:function(result){
				
				if(result=="SUCCESS"){
					alert("수정 했습니다.");
					//3차 카테고리 목록 불러오기
					CategoryThreeList(bno);
					$("#categoryModalOne").modal("toggle");
				}
			}
		});
		
		
	});
	
	
	//3차 카테고리 삭제하기
	$("#categoryThreeDelete").click(function(){
		var bno =$("#categoryThreeBno").val();
		var rno =$("#categoryThree option:selected").val();
		
		//alert(bno +" " + " :" +rno);

		var title =$("#categoryThree option:selected").text();
	
		
		if(confirm("카테고리  : '" + title + "' 을 정말 삭제 하시겠습니까?")){
			$.ajax({
				url :"/admin/category/categoryThreeDelete/"+rno,
				type:"delete",
				success:function(result){
					
					if(result=="deleted"){
						alert("삭제 했습니다.");
						//3차 카테고리 목록 불러오기
						CategoryThreeList(bno);
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
	//2차카테고리 idx
	$("#categoryTwoIdx").val(idx);
	//3차카테고리 idx
	$("#categoryThreeIdx").val(idx);
	
	
	var categoryOenText =$("#categoryOne option:selected").text();
	if(categoryOenText.length<1){
		$("#categoryTwoP").text("1차 카테고리 먼저 입력 해 주세요.");
	}else{
		//2차카테고리 텍스트
		$("#categoryTwoP").text(categoryOenText);
		//3차카테고리 텍스트
		$("#categoryThreeP").text(categoryOenText);
	}
	//모달에 idx 전송
	$("#idx").val(idx);
	
	//2차 카테고리 목록 불러오기
	CategoryTowList(idx);
	

}

//2차 카테고리 목록 불러오기
function CategoryTowList(idx){
	
	
	$.getJSON("/admin/category/categoryTwoList/"+idx , function(data){
		var str ="";
		
		$(data).each(function(){
			str +="<option value="+this.bno+" >"+this.title+"</option>";
			
		});
		$("#categoryTwo").html(str);
		$("#showCategoryTwo").html(str);
		
		//사이즈 호출
		//alert("2차 사이즈  :" +$("#categoryTwo option").size());
		//3차 카테고리 체인지
		var twoSize=$("#categoryTwo option").size();
		
		if(twoSize==0){
			//3차 숨김
			$("#list3").css("display","none");
			$("#showCategoryThree").html("");
		}else{
			//3차 보임
			$("#list3").css("display","");
		}
		categoryTwoChange();
		
		
	});
	
}


// 2차카테고리 체인지
function categoryTwoChange(){
		
	var bno =$("#categoryTwo").val();
	var bnoText=$("#categoryTwo option:selected").text();
	//alert("2차 체인지" +bno + "   :   "+ bnoText);
	//3차에 값 삽입
	$("#categoryThreeBno").val(bno);
	$("#categoryThreePtext").text(bnoText);
	
	CategoryThreeList(bno);
}



//3차 카테고리 목록 불러오기
function CategoryThreeList(bno){
	
	
	$.getJSON("/admin/category/categoryThreeList/"+bno , function(data){
		var str ="";
		
		$(data).each(function(){
			str +="<option value="+this.rno+" >"+this.title+"</option>";
			
		});
		$("#categoryThree").html(str);
		$("#showCategoryThree").html(str);
		
		
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
			          rno :<input type="text" name="rno" id="rno"  class="form-control" >
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
  