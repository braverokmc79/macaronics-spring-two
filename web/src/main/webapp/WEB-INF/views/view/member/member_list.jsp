<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<table border="1">
	<tr>
		<td>아이디</td>
		<td>이름</td>
		<td>이메일</td>
		<td>등록일자</td>
	</tr>
	<c:forEach items="${list }" var="row">
	<tr>
		<td>${row.userid }</td>
		<td>${row.username }</td>
		<td>${row.email }</td>
		<td>${row.regdate }</td>
	</tr>
	</c:forEach>

</table>


</body>
</html>