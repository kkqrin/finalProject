<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	
<div class="content-wrap">

	
<%-- 	<h1>상위 카테고리 : ${fCategory }</h1> --%>
<%-- 	<h1>하위 카테고리 : ${sCategory }</h1> --%>
	<div class="category-wrap">
		<h3>식품</h3>
		<ul class="subcategory-name-list">
			<li><a href="#">전체보기</a></li>
<%--  		<c:forEach items="${dCategoryList }" var="dc"> --%>
<%-- 			<li>${dc.dCategoryName }</li> --%>
<%-- 		</c:forEach> --%>
		</ul>
	</div>
    <div class="product-wrap">
    <!-- 전체 상품 wrap -->
	<c:forEach items="${list }" var="p">
        <div class="posting-item">
            <div class="posting-img">
                <a href="#">
                    <img src="/resources/upload/product/${p.thumbnail }" />
                </a>
                <div class="gonggu-info">${p.gongguNumber}인 공동구매</div>
            </div>
            <div class="posting-content">
                <p class="posting-title">
                    <a href="#">
                        ${p.productName}
                    </a>
                </p>
                <div class="posting-price-box">
                    <p class="price-through">70,000원</p>
                    <div class="sail-box">
                        <p class="sail-percent">${p.productDiscount}</p>
                        <p class="price-sail">${p.productPrice}</p>
                    </div>
                </div>
                <div class="posting-detail">
                    <div class="posting-info">
                        <div>
                            <span class="posting-info-box">무료배송</span>
                        </div>
                        <div class="star-rating">
                            <div class="material-symbols-outlined star-rate">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</c:forEach>
    </div>

</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />	

    <!-- 상품 js -->
    <script src="/resources/js/product.js"></script>
</body>
</html>