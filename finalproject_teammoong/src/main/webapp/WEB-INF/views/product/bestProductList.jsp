<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- 상품 css -->
	<link rel="stylesheet" href="/resources/css/product/product.css"/>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
	<c:if test="${not empty sessionScope.m }">
        <jsp:include page="/WEB-INF/views/common/stickyRight.jsp" />
    </c:if>
	
<div class="content-wrap">

    <div class="category-wrap">
		<h3>인기 상품</h3>
		<ul class="subcategory-name-list">
            <li><a href="#">전체보기</a></li>
            <c:forEach items="${categoryList}" var="c">
            <li><a href="#">${c.categoryName}</a></li>
            </c:forEach>
		</ul>
	</div>



</div>


</body>
</html>