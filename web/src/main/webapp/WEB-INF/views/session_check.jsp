<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<c:if test="${ empty loginUser }" >
	<script>
		alert("로그인을 먼저 하세요!");
		location.href="/member/loginform.do";
	</script>
</c:if>