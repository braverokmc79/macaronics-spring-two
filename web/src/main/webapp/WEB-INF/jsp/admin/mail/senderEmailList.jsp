<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
     
<%@ include file="../include/header.jsp" %>      
      
<%@ include file="../include/top_menu.jsp" %>

<%@ include file="../include/side_menu.jsp" %>      
      
    
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        보낸 메일 함
        <small>${count }</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Mailbox</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
       
        <!-- /.col -->
        <div class="col-md-12">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">보낸 편지함</h3>


              <div class="box-tools pull-right">
                <div class="has-feedback">
                  <input type="text" class="form-control input-sm" placeholder="Search Mail">
                  <span class="glyphicon glyphicon-search form-control-feedback"></span>
                </div>
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <div class="mailbox-controls">
                <!-- Check all button -->
                <button type="button" class="btn btn-default btn-sm checkbox-toggle" id="checkall" ><i class="fa fa-square-o"></i>
                </button><input type="checkbox" id="ckall" style="display: none;">
                <div class="btn-group">
                  <button type="button" class="btn btn-default btn-sm" id="btnDelete"><i class="fa fa-trash-o"></i></button>
                </div>
                <!-- /.btn-group -->
                <button type="button" class="btn btn-default btn-sm" id="refresh"><i class="fa fa-refresh"></i></button>
                <div class="pull-right">
                  ${pas.start }-${pas.end }/${count}
                  <div class="btn-group">
                   
                   
                <c:if test="${pager.curPage > 1 }">

                   <a href="javascript:list('${ pageAndSearch.searchQuery(pager.curPage-1) }')" type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></a>
               </c:if>   
                 
                                     
           	<c:if test="${ pager.curBlock < pager.totBlock }">
       
                   <a href="javascript:list('${ pageAndSearch.searchQuery(pager.curPage+1) }')" type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></a>                            
            </c:if> 
                 
                  </div>
                  <!-- /.btn-group -->
                </div>
                <!-- /.pull-right -->
              </div>
              <div class="table-responsive mailbox-messages">
                <table class="table table-hover table-striped">
                  <tbody >
         
                   <tr>
                    <th></th>
                    <th class="mailbox-star"><a href="#"><i class="fa fa-star text-yellow"></i></a></th>
                    <th class="mailbox-name"><a href="read-mail.html">받는 사람</a></th>
                    <th class="mailbox-subject"><b>보낸 사람 </b> -  이메일 제목
                    </th>
                    <th class="mailbox-attachment"></th>
                    <th class="mailbox-date">보낸 날짜</th>
                  </tr>
   

                 
                 <c:forEach items="${emailList }" var="row">
                 
                  <tr>
                    <td><input type="checkbox" class="chk"  data-idx="${row.idx }"></td>
                    <td class="mailbox-star"><a href="#"><i class="fa fa-star text-yellow"></i></a></td>
                    <td class="mailbox-name"><a href="read-mail.html">${row.senderMail }</a></td>
                    <td class="mailbox-subject"><b>${row.senderName }</b> ${row.subject }
                    </td>
                    <td class="mailbox-attachment"></td>
                    <td class="mailbox-date"><fmt:formatDate value="${row.regdate }" pattern="yyyy-MM-dd HH:ss"/>  </td>
                  </tr>
   
                 </c:forEach>
                 
                 
                  </tbody>
             
             
             
                </table>
                <!-- /.table -->
              </div>
              <!-- /.mail-box-messages -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer no-padding">
              <div class="mailbox-controls">
                <!-- Check all button -->
                <button type="button" class="btn btn-default btn-sm checkbox-toggle" id="checkall2"><i class="fa fa-square-o"></i>
                </button>
                <div class="btn-group">
                  <button type="button" class="btn btn-default btn-sm" id="btnDelete2"><i class="fa fa-trash-o"></i></button>

                </div>
                <!-- /.btn-group -->
                <button type="button" class="btn btn-default btn-sm" id="refresh2"><i class="fa fa-refresh"></i></button>
                <div class="pull-right">
                  ${pas.start }-${pas.end }/${count}
                  <div class="btn-group">
             
             
             
               <c:if test="${pager.curPage > 1 }">
                   <a href="javascript:list('${ pageAndSearch.searchQuery(pager.curPage-1) }')" type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-left"></i></a>
          		</c:if>
                 
           	<c:if test="${ pager.curBlock < pager.totBlock }">
       
                   <a href="javascript:list('${ pageAndSearch.searchQuery(pager.curPage+1) }')" type="button" class="btn btn-default btn-sm"><i class="fa fa-chevron-right"></i></a>                            
            </c:if>
                 
                  </div>
                  <!-- /.btn-group -->
                </div>
                <!-- /.pull-right -->
              </div>
            </div>
          </div>
          <!-- /. box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
 
 
 

<script>

$(document).ready(function(){
	
   
	
	$("#refresh").click(function(){

		location.href="/admin/mail/senderEmailList";
		
	});
	
	$("#refresh2").click(function(){

		location.href="/admin/mail/senderEmailList";
		
	});
	
	
	 $("#checkall").click(function(){
		 allCheck();
	 });

	$("#checkall2").click(function(){
		allCheck();
	});
	
	$("#btnDelete").click(function(){
		mailDelete();
	});
	
	$("#btnDelete2").click(function(){
		mailDelete();
	});
	
});

function list(page){

	location.href='/admin/mail/senderEmailList'+page;

}

function allCheck(){
	
    //클릭되었으면
    $("#ckall").click();
    
    if($("#ckall").prop("checked")){
        //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
        $(".chk").prop("checked",true);
        $("#ckall").prop("checked",true);
        //클릭이 안되있으면
    }else{
        //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
        $(".chk").prop("checked",false);
        $("#ckall").prop("checked",false);
    }

}


function mailDelete(){
	
	
	$(".chk").each(function(index){
		
		if($(this).prop("checked")){
			var idx =$(this).attr("data-idx");
			
			$.ajax({
				
				url:"/admin/mail/maildelete/"+idx,
				type:"get",
				success:function(result){
						
				}	
			});
	    	
		}
	
	}); 
		
	setTimeout(function(){

		  if(confirm("삭제 했습니다.")){
			  location.href='/admin/mail/senderEmailList';
		  }else{
			  location.href='/admin/mail/senderEmailList';
		  }

	}, 2000);
	
	
	
		

	
}

</script>




  
<%@ include file="../include/content_footer.jsp" %>

  
<%@ include file="../include/control_sidebar.jsp" %>
  
  
<%@ include file="../include/footer.jsp" %>  



  