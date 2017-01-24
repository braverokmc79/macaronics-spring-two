<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
     
<%@ include file="../include/header.jsp" %>      
      
<%@ include file="../include/top_menu.jsp" %>

<%@ include file="../include/side_menu.jsp" %>      
      
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
      
      
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script>

	google.load('visualization', '1', {

	'packages' : [ 'corechart' ]

		});

		google.setOnLoadCallback(drawChart);
		
 // 차트 그리기 함수
	function drawChart() {
		//json 데이터 받아로기
		// dataType : "json" 결과값이 json 형식
		// async :false  비동기식 옵션을 끔(동기식)
		// ajax 는 비동기식이다. 즉 기본값이 비동기식 true 이다
		// 즉 차트가 그려지기 전에는 다른 작업은 하지 못한다.
		//responseText  : 서버의 응답 텍스트
		var jsonData = $.ajax({
			
				url : "/admin/chart/chartCategorylist",
			
			dataType : "json",
			
			async : false
			
			}).responseText;
		
		//alert(jsonData);
		//json 데이터를 데이터 테이블로 변환
		var data = new google.visualization.DataTable(jsonData);
		
		// 차트 그리기 (PieChart, LineChart, ColumnChart)
		var chart = new google.visualization.ColumnChart(document
		
			.getElementById('chart_div'));
			
		
		var chart2 = new google.visualization.PieChart(document
				
				.getElementById('chart_div2'));
		
		
		var chart3 = new google.visualization.LineChart(document
				
				.getElementById('chart_div3'));
		
		
			//draw(데이터, 옵션)
			chart.draw(data, {
				title: "카테고리 별 등록된 상품 개수",
				width : 700,
				height : 500
			 });
			
			//draw(데이터, 옵션)
			chart2.draw(data, {
				title: "카테고리 별 등록된 상품 개수",
				width : 700,
				height : 500
			 });
			
			//draw(데이터, 옵션)
			chart3.draw(data, {
				title: "카테고리 별 등록된 상품 개수",
				/* curveType:"function", */
				width : 700,
				height : 500
			 });
 
	
 
 
   }


</script>




 
 
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">


    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
         상품 차트 (구글)
      </h1>

      
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Google Chart</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
     

<div class="row">
        <div class="col-xs-12">



          <div class="box">
            <div class="box-header">
              <h3 class="box-title"> <span class="badge bg-green">카테고리 별 등록된 상품 개수</span> </h3>
      <p style="margin-bottom: 50px;"></p>
              <div class="box-tools">
                <div class="input-group input-group-sm" style="width: 150px;">
         

         
                </div>
              </div>
            </div>
            <!-- /.box-header -->
                 <div style="margin-bottom: 15px;"> 
  
                 </div> 
            <div class="box-body table-responsive no-padding">
  
       
       
       			 
 <div id="chart_div">
 
 </div>
 
       
 <div id="chart_div2">
 
 </div> 
 
  <div id="chart_div3">
 
 </div> 
 
         
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
       
    
           
           
     <div class="aa-properties-content-bottom">
          
                      
                      </div>
                    
     


          <!-- /.box -->
        </div>
      </div>

    </section>






<form action="/admin/shop/products/prodductDelete" method="post" name="deleteForm">

 <input type="hidden" name="product_id" id="hidden_product_id" >
</form>


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






<script>
  
$(document).ready(function(){


	
});



</script>






  
<%@ include file="../include/content_footer.jsp" %>

  
<%@ include file="../include/control_sidebar.jsp" %>
  
  
<%@ include file="../include/footer.jsp" %>  



  