<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	
	
	<div class="content-wrap">
		<h1>${sessionScope.m.memberName }님의 장바구니</h1>	
		
		<table>
		<c:forEach items="${basketList}" var="i">
		<tr>
			<td><input type="checkbox"></td>
			<td>${i.thumbnail }</td>
			<td>${i.productName }</td>
			<td>${i.productPrice }</td>
			<td>${i.optionDetailName }</td>
			<td>${i.optionPrice }</td>
		</tr>			
		</c:forEach>
		</table>
	</div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>