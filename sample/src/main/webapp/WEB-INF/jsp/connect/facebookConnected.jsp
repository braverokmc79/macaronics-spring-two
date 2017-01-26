<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>



<h3>페이스북에 로그인 되었습니다.</h3>

		<p>
			You are now connected to your Facebook account.
			Click <a href="/">here</a> to see some entries from your Facebook feed.
		</p>

<a href="/">메인으로 이동</a>

<%
	response.sendRedirect("/");
%>
</body>
</html>