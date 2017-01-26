<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hello</title>
<%@ include file="include/header.jsp" %>


<script type="text/javascript">
$(document).ready(function(){
	//주소에 #_=_ 가 포함되어 있으면
	if(window.location.href.indexOf("#_=_") > 0){
		//alert(window.location.href.indexOf("#_=_"));  22 출력
		//주소에서 #_=_를 제거함
		window.location=window.location.href.replace("#_=_","");	
	}
	
});



</script>


</head>
<body>
<%@ include file ="include/menu.jsp" %>
<h2>spring boot application</h2>

${name } 님 환영합니다. <br>

<!-- 세션에 저장된 정보 -->



${sessionScope.username } 님 환영합니다. <br>



</body>
</html>