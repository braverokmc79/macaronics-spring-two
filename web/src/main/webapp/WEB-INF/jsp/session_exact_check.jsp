<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<c:if test="${ sessionScope.loginUser.userid ==vo.userid || sessionScope.loginUserid.member_level >= 15 }" >
	<script>
		alert("비 정상적인 접근 입니다.!");
		location.href="/member/loginform.do";
	</script>
</c:if>