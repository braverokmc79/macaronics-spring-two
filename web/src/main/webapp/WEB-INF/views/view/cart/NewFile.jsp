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


<form id="form1" name="form1" method="post" action="/shop/cart/update.do">
<table>
<c:forEach var="row" items="${map.list }" varStatus="i">
	<tr>
		<td>${row.product_name }</td>
<td>
<fmt:formatNumber  value="${row.price }"  pattern="###,###"/>
</td>
	<td>
<input type="number" name="amount[${i.index }]" value="${row.amount }" >
<input type="hidden" name="product_id[${i.index }]" value="${row.product_id }" >
	</td>

	</tr>
</c:forEach>

</table>
<input type="hidden" name="count" value="${map.count }">
여기서 count 값은 컨트롤에서 List size 를 저장 한 값 이다. 
<button id="btnUpdate" >업데이트</button>
</form>

</body>
</html>