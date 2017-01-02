<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>




 
  </section>
  <!-- container section start -->

    <!-- javascripts -->
    <script src="/resources/users/js/jquery.js"></script>
	<script src="/resources/users/js/jquery-ui-1.10.4.min.js"></script>
    <script src="/resources/users/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui-1.9.2.custom.min.js"></script>
    <!-- bootstrap -->
    <script src="/resources/users/js/bootstrap.min.js"></script>
    <!-- nice scroll -->
    <script src="/resources/users/js/jquery.scrollTo.min.js"></script>
    <script src="/resources/users/js/jquery.nicescroll.js" type="text/javascript"></script>
    <!-- charts scripts -->
    <script src="/resources/users/assets/jquery-knob/js/jquery.knob.js"></script>
    <script src="/resources/users/js/jquery.sparkline.js" type="text/javascript"></script>
    <script src="/resources/users/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.js"></script>
    <script src="/resources/users/js/owl.carousel.js" ></script>
    <!-- jQuery full calendar -->
    <<script src="/resources/users/js/fullcalendar.min.js"></script> <!-- Full Google Calendar - Calendar -->
	<script src="/resources/users/assets/fullcalendar/fullcalendar/fullcalendar.js"></script>
    <!--script for this page only-->
    <script src="/resources/users/js/calendar-custom.js"></script>
	<script src="/resources/users/js/jquery.rateit.min.js"></script>
    <!-- custom select -->
    <script src="/resources/users/js/jquery.customSelect.min.js" ></script>
	<script src="/resources/users/assets/chart-master/Chart.js"></script>
   
    <!--custome script for all page-->
    <script src="/resources/users/js/scripts.js"></script>
    <!-- custom script for this page-->
    <script src="/resources/users/js/sparkline-chart.js"></script>
    <script src="/resources/users/js/easy-pie-chart.js"></script>
	<script src="/resources/users/js/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="/resources/users/js/jquery-jvectormap-world-mill-en.js"></script>
	<script src="/resources/users/js/xcharts.min.js"></script>
	<script src="/resources/users/js/jquery.autosize.min.js"></script>
	<script src="/resources/users/js/jquery.placeholder.min.js"></script>
	<script src="/resources/users/js/gdp-data.js"></script>	
	<script src="/resources/users/js/morris.min.js"></script>
	<script src="/resources/users/js/sparklines.js"></script>	
	<script src="/resources/users/js/charts.js"></script>
	<script src="/resources/users/js/jquery.slimscroll.min.js"></script>
  <script>

      //knob
      $(function() {
        $(".knob").knob({
          'draw' : function () { 
            $(this.i).val(this.cv + '%')
          }
        })
      });

      //carousel
      $(document).ready(function() {
          $("#owl-slider").owlCarousel({
              navigation : true,
              slideSpeed : 300,
              paginationSpeed : 400,
              singleItem : true

          });
      });

      //custom select box

      $(function(){
          $('select.styled').customSelect();
      });
	  
	  /* ---------- Map ---------- */
	$(function(){
	  $('#map').vectorMap({
	    map: 'world_mill_en',
	    series: {
	      regions: [{
	        values: gdpData,
	        scale: ['#000', '#000'],
	        normalizeFunction: 'polynomial'
	      }]
	    },
		backgroundColor: '#eef3f7',
	    onLabelShow: function(e, el, code){
	      el.html(el.html()+' (GDP - '+gdpData[code]+')');
	    }
	  });
	});

  </script>

  </body>
</html>
