<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div style="text-align:center;">
	<c:choose>
		<c:when test="${sessionScope.macaronicUser.name ==null }">
		  <a href="/member/login">로그인</a>
		</c:when>
		<c:otherwise>
		${sessionScope.macaronicUser.name  }님이 로그인 중입니다. 
			<a href="/member/logout">로그아웃</a>
		</c:otherwise>
	</c:choose>



	
</div>