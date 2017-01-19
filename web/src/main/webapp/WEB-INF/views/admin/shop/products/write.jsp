<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
     
<%@ include file="../../include/header.jsp" %>      
      
<%@ include file="../../include/top_menu.jsp" %>

<%@ include file="../../include/side_menu.jsp" %>      
      
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 


<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>      
      
      
<style>
.fileDrop{
  width: 80%;
  height: 150px;
  border: 1px dotted gray;
  background-color: lightslategrey;
  margin: auto;
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
        상품등록
        
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Gallery</li>
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
          
       
      <article class="container">
        <div class="page-header">
          <h1>Macaronics <small>상품 등록</small></h1>
        </div>
     
          <form role="form" method="post"  action="/admin/shop/products/insertProduct"  enctype="multipart/form-data">
             <div class="col-md-6 col-md-offset-3">
            <div class="form-group">
              <label for="categoryIdx">1차 카테고리</label>
           
           	  <select name="categoryIdx" class="form-control" id="categoryIdx" onchange="categoryOneChange()"> 
           	  	
           	  </select>
            </div>
            
            <div class="form-group">
              <label for="categoryBno">2차 카테고리</label>                 
           	  <select name="categoryBno" class="form-control" id="categoryBno" onchange="categoryTwoChange()"> 
           	  	
           	  </select>
           </div>
            
			<div class="form-group">
              <label for="categoryRno">3차 카테고리</label>                 
           	  <select name="categoryRno" class="form-control" id="categoryRno"> 
           	  	
           	  </select>
            </div>
            
       
            <div class="form-group">
              <label for="productName">상품명</label>
              <input type="text" class="form-control" id="productName" name="productName" placeholder="상품명">
            </div>
            
            
            <div class="form-group">
              <label for="price">가격(원)</label>
              <input type="text" class="form-control"  id="price" name="price" >
              <p class="help-block"></p>
            </div>
           
            <div class="form-group">
              <label for="amount">수량(개)</label>
              <input type="text" class="form-control"  id="amount" name="amount" >
              <p class="help-block"></p>
            </div>
      
           
           
            <div class="form-group">
              <label for="product_state">상품 상태</label>
              <select name="productState" class="form-control" id="productState"> 
           	  	<option value="보통">보통</option>
           	  	<option value="Best">Best</option>
           	  	<option value="빅이벤트">빅이벤트</option>
           	  	<option value="Sale">Sale</option>
           	  </select>
            </div>
         
         
            <div class="form-group">
              <label for="username">배송료 무료 상한 가격 설정 </label>
              <input type="text" name="deliver"   class="form-control" id="deliver" placeholder="30,000">
            </div>
            
            <div class="form-group">
              <label for="username">배송 비용 설정</label>
              <input type="text" name="deliverMoney"  class="form-control" id="deliverMoney" placeholder="2,500">
            </div>
            
            
            <div class="form-group">
              <label for="description">상품 간략 설명 (1000 글자 이하)</label>
              <textarea class="form-control" id="description" name="description" onkeyup="chkword(this, 1000)" ></textarea>
              
            </div>
            
     
     </div> 
       
           <div class="col-md-9">                
           
           
            <div class="form-group">
			<label for="picture_url">상품 대표 이미지 업로드</label>
			 <div class="fileDrop"></div>
			</div>      
       
       
            <div class="box-footer">
					<div>
						<hr>
					</div>

				<ul class="mailbox-attachments clearfix uploadedList">
		
				</ul>
			</div>
       
        
        
           <div class="form-group">
              <label for="bigDescription">상품 상세 내용</label>
              <textarea class="form-control" id="bigDescription" name="bigDescription"></textarea>
             <script type="text/javascript">
	$(document).ready(function() {
		//아이디가 content 에 서머노트를 적용 한다.
			  $('#bigDescription').summernote({
				  
				 	 height:600 , 
					minHeight: null,             // set minimum height of editor
				    maxHeight: null,             // set maximum height of editor
				    focus: true       
				  
			  });
		
	});
						
</script>
            </div>
      
        
            <div class="form-group text-center">
              <button type="button" class="btn btn-info" id="registerBtn">상품 등록<i class="fa fa-check spaceLeft"></i></button>
              <button type="reset" class="btn btn-warning">리셋<i class="fa fa-times spaceLeft"></i></button>
            </div>
      

      
      </div>
   
    </form>  
     
     
      </article>
	
       	
       		</div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
      </div>

    </section>


  <div class="modal modal-danger" id="checkPw">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span></button>
          <h4 class="modal-title">패스워드 입력</h4>
        </div>
        <div class="modal-body">
          <input type="hidden" name="userid" id="modal_Id"  class="form-control" >
          <input type="text" name="confirmPassword" class="form-control" id="confirmPassword">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-outline pull-left" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-outline" id="confirmPwd">패스워드 확인</button>
        </div>
      </div>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div>
   <!-- /.modal -->



 
<script id="template22" type="text/x-handlebars-template">
<li>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	<a href="{{fullName}}" 
     class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
	</span>
  </div>
</li>   

</script>




<script>
  
$(document).ready(function(){
	//카테고리 1차 목록 리스트
	getCategoryOneList();


	$("#registerBtn").click(function(){
		
		var form1 =$("form[role='form']");
		var categoryRno =$("#categoryRno").val();
		var price=$.trim($("#price").val());
		var amount=$.trim($("#amount").val());
		var deliver=$.trim($("#deliver").val());
		var deliverMoney=$.trim($("#deliverMoney").val());
		var description=$.trim($("#description").val());
		var bigDescription =$.trim($("#bigDescription").val());
		
		var imageUplodAmount=$(".uploadedList .delbtn").size();
		
	
		
		
		
		//alert( " productName :" + productName + " : categoryRno " +categoryRno);
		if($.trim(categoryRno) =='' ){
			alert("3차 카테고리를 설정 하세요!");
			$("#categoryRno").focus();
			return;
		}	
		
		if($.trim($("#productName").val())==''){
			alert("상품명을 입력 하세요!");
			$("#productName").focus();
			return;
		}
		
		
		if(!$.isNumeric( price )){
			
			alert("가격 입력이 잘 못 되었습니다.");
			$("#price").focus();
			return false;
		}
		if(price < 0){
			alert("가격은 양수 만 가능합니다.");
			$("#price").focus();
			return false;
		}
		
		if(!$.isNumeric(amount)){
			alert("수량이 잘못 입력 되었습니다.");
			$("#amount").focus();
			return false;
		}
		if(amount < 1){
			alert("수량은 0 보다 커야 합니다. ");
			$("#amount").focus();
			return false;
		}
		
		if(!$.isNumeric(deliver)){
			alert("배송료 상한 가가  잘못 입력 되었습니다.");
			$("#deliver").focus();
			return false;
		}
		if(deliver < 1){
			alert("배송료 상한 가는  0 보다 커야 합니다. ");
			$("#deliver").focus();
			return false;
		}
		
		
		if(!$.isNumeric(deliverMoney)){
			alert("배송료가  잘못 입력 되었습니다.");
			$("#deliverMoney").focus();
			return false;
		}
		if(deliverMoney < 1){
			alert("배송료는 0 보다 커야 합니다. ");
			$("#deliverMoney").focus();
			return false;
		}
		
		if(description==''){
			alert("상품 간략설명을 입력해 주세요.");
			$("#description").focus();
			return false;
		}
		
		if(bigDescription ==''){
			
			alert("상품 상세 내용을  입력 해 주세요.");
			$("#bigDescription").focus();
			return false;
		}

		if(imageUplodAmount==0){
			alert("한개 이상 이미지를 업로드 해주세요.");
			return false;
		}
		
		var str ="";
		
		$(".uploadedList .delbtn").each(function(index){
			
			str +="<input type='hidden' name='mfiles["+index+"]' value='"+$(this).attr("data-img") +"'>";
			
		});
		
		form1.append(str);
		form1.submit();
		
	});
	
	
	
	//파일 업로드 
	//var template =Handlebars.compile($("#template22").html());
	
	
	
	$(".fileDrop").on("dragenter dragover", function(event){
		event.preventDefault();
	});
	
	$(".fileDrop").on("drop", function(event){
		event.preventDefault();
		
		
		var files=event.originalEvent.dataTransfer.files;
		
		var file=files[0];
		var formData=new FormData();
		formData.append("file", file);
		//alert(formData);
		$.ajax({
			url:"/admin/shop/products/uploadAjax",
			data:formData,
			dataType:'text',
			processData :false,
			contentType:false,
			type:"POST",
			success:function(data){
				
				
				$(".uploadedList").append(data);	
			}
		});
		
		
	});
	
	
	
	
	
});

//카테고 1 체인지
function categoryOneChange(){
	var idx=$("#categoryIdx option:selected").val();
	
	getCategoryTwoList(idx);
	
	
}

//카테고 2 체인지

function categoryTwoChange(){
	var bno=$("#categoryBno option:selected").val();
	
	//alert("2" + bno);
	getCategoryThreeList(bno);
	
	
}
   
// 카테고리 1 목록 가져오기   
function getCategoryOneList(){
	
	$.getJSON("/admin/shop/products/categoryOneList" , function(data){
		
		var str ="";
		$(data).each(function(){
			
			str +="<option value='"+this.idx+"' >" +this.title +"</option>";
		});
		
		$("#categoryIdx").html(str);
		
		//카테고리 2 목록
		var idx=$("#categoryIdx option:selected").val();
		
		getCategoryTwoList(idx);
		
		
		
		
	});
		
}   


//카테고리 2 목록 가져오기   
function getCategoryTwoList(idx){
	
	$.getJSON("/admin/shop/products/categoryTwoList/"+idx , function(data){
		
		var str ="";
		$(data).each(function(){
			
			str +="<option value='"+this.bno+"' >" +this.title +"</option>";
		});
		
		$("#categoryBno").html(str);
		
		 bno=$("#categoryBno option:selected").val();
		 getCategoryThreeList(bno);
	});
}   


//카테고리 3 목록 가져오기   
function getCategoryThreeList(bno){
	
	
	$.getJSON("/admin/shop/products/categoryThreeList/"+bno , function(data){
		
		var str ="";
		$(data).each(function(){
			
			str +="<option value='"+this.rno+"' >" +this.title +"</option>";
		});
		
		$("#categoryRno").html(str);
	});
}   

//글자수 제한

 function chkword(obj, maxByte) {
 
        var strValue = obj.value;
        var strLen = strValue.length;
        var totalByte = 0;
        var len = 0;
        var oneChar = "";
        var str2 = "";
 
        for (var i = 0; i < strLen; i++) {
            oneChar = strValue.charAt(i);
            if (escape(oneChar).length > 4) {
                totalByte += 2;
            } else {
                totalByte++;
            }
 
            // 입력한 문자 길이보다 넘치면 잘라내기 위해 저장
            if (totalByte <= maxByte) {
                len = i + 1;
            }
        }
 
        // 넘어가는 글자는 자른다.
        if (totalByte > maxByte) {
            alert(maxByte + "자를 초과 입력 할 수 없습니다.");
            str2 = strValue.substr(0, len);
            obj.value = str2;
            chkword(obj, 4000);
        }
    }
</script>







  
<%@ include file="../../include/content_footer.jsp" %>

  
<%@ include file="../../include/control_sidebar.jsp" %>
  
  
<%@ include file="../../include/footer.jsp" %>  
  