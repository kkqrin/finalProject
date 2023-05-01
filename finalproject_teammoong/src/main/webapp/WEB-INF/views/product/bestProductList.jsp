<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- 상품 css -->
	<link rel="stylesheet" href="/resources/css/product/product.css"/>
    <style>
        .material-symbols-outlined.star-rate{
        	/* 구글 아이콘 (별점) */
            font-variation-settings:
            'FILL' 1
        }
        .current-category-name{
            margin-top: 10px;
            margin-bottom: 40px;
            font-weight: 400;
        }

        /* 인기상품 간격 조정 */
        .product-wrap{
            margin-top: 150px;
        }

        /* 순위 */
        .best-product-ranking{
            width: 60px;
            height: 35px;
            line-height: 35px;
            background-color: rgba(248, 128, 0, 0.9);
            border-radius: 50%;
            color: #fff;
            text-align: center;
            position: absolute;
            z-index: 2;
            margin: 15px;
        }
    </style>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
	<c:if test="${not empty sessionScope.m }">
        <jsp:include page="/WEB-INF/views/common/stickyRight.jsp" />
    </c:if>
	
<div class="content-wrap">

    <!-- 카테고리 구분 -->
    <input type="hidden" id="sCategoryNo" value="${sCategory }">

    <div class="category-wrap">
		<h3>인기 상품</h3>
        <h5 class="current-category-name"></h5>
		<ul class="subcategory-name-list">
            <li><a href="/bestProductList.do" class="all-category">전체보기</a></li>
            <c:forEach items="${categoryList}" var="c">
            <li><a href="/bestProductList.do?categoryNo=${c.categoryNo}" class="sub-category">${c.categoryName}</a></li>
            </c:forEach>
		</ul>
	</div>


    <div class="product-wrap">
        <!-- 전체 상품 wrap -->
		<c:forEach items="${bestProductList }" var="p" varStatus="status">
			<div class="posting-item">
                <div class="best-product-ranking">BEST ${status.index+1}</div>
				<div class="posting-img">
					<a href="/productView.do?productNo=${p.productNo}">
						<img src="/resources/upload/product/${p.thumbnail }" />
					</a>
					<div class="gonggu-info">${p.gongguNumber}인 공동구매</div>
				</div>
				<div class="posting-content">
					<p class="posting-title">
						<a href="/productView.do?productNo=${p.productNo}">
							${p.productName}
						</a>
					</p>
					<div class="posting-price-box">
						<p class="price-through"><fmt:formatNumber value="${p.productPrice }"/>원</p>
						<div class="sail-box">
							<p class="sail-percent">${p.productDiscount}%</p>
							<p class="price-sail"><fmt:formatNumber value="${(Math.floor(p.productPrice*(100 - p.productDiscount)/1000)*10)}"/>원</p>
						</div>
					</div>
					<div class="posting-detail">
						<div class="posting-info">
							<div>
								<span class="posting-info-box">무료배송</span>
                                <span class="posting-info-box today-close">${p.purchasedVolume}개 구매</span>
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

<script>
    // 액티브 카테고리
    $(document).ready(function(){
        // class="active-category-name"

        const categoryNo = Number($("#sCategoryNo").val());

        console.log(categoryNo);

        if(categoryNo == 0){
            $(".all-category").addClass("active-category-name");
        }else{
            $(".all-category").removeClass("active-category-name");
            $(".sub-category").eq(categoryNo-1).addClass("active-category-name");

            $(".current-category-name").text($(".active-category-name").text());
        }
    });	

</script>
</body>
</html>