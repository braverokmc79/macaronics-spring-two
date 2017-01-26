<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<%@ include file="../include/menu.jsp" %>
<h2>페이브북 접속</h2>
<!--  스프링 부트에 내장되어 있는 /connect/facebook 액션으로 이동 -->
<!-- ConnectController -->



<%
	
    session.invalidate();
	
	response.sendRedirect("/hello");
%>


</body>
</html>