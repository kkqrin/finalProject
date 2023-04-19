<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<li><a href="#">식품</a></li>
            <li><a href="#">식품</a></li>
            <li><a href="#">식품</a></li>
            <li><a href="#">식품</a></li>
            <li><a href="#">식품</a></li>
            <li><a href="#">식품</a></li>
            <li><a href="#">식품</a></li>

            <li><a href="#">식품</a></li>
            <li><a href="#">식품</a></li>
            <li><a href="#">식품</a></li>
            <li><a href="#">식품</a></li>
            <li><a href="#">식품</a></li>
            <li><a href="#">식품</a></li>
            <li><a href="#">식품</a></li>
            <li><a href="#">식품</a></li>
            <li><a href="#">식품</a></li>
		</ul>
	</div>



</div>


</body>
</html>