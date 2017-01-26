<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hello Millky</title>
</head>
<body>
	<c:out value="<xmp>" escapeXml="true"></c:out>
	<h2>Hello! ${name}</h2>
	<div>JSP version</div>
	<div><a href="/member/login">로그인</a></div>
</body>
</html>