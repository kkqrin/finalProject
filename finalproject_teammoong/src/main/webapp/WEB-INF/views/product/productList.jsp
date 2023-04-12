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

	<!-- 카테고리 구분 -->
	<input type="hidden" id="fCategoryNo" value="${fCategory }">
	<input type="hidden" id="sCategoryNo" value="${sCategory }">
	<input type="hidden" id="startHidden" value="1" totalCount="${totalCount }" currentCount="0">

	<div class="category-wrap">
		<h3>${detailCategoryList[0].categoryName }</h3>
		<ul class="subcategory-name-list">
			<li><a href="/productList.do?category=${10000 + fCategory }" class="all-category">전체보기</a></li>
			<c:forEach items="${detailCategoryList}" var="i">
				<li value="${i.detailCategoryNo }"><a href="/productList.do?category=${i.categoryNo}${i.detailCategoryNo}" class="sub-category">${i.detailCategoryName}</a></li>
			</c:forEach>
		</ul>
	</div>


		<c:if test="${sCategory eq 0 }">
		<div class="popular-product-wrap">
			<!-- 인기상품 wrap -->
			<div class="posting-item popular">
				<div class="posting-img popular">
					<a href="#">
						<img src="/resources/img/product/lactofit.jpg" />
					</a>
					<div class="gonggu-info">2인 공동구매</div>
				</div>
				<div class="posting-content popular">
					<p class="posting-title">
						<a href="#">
							[3월 한정 파격특가][종근당건강] 락토핏 생유산균 골드(50포) 3통 (150일분) / 온가족 유산균
						</a>
					</p>
					<div class="posting-price-box">
						<p class="price-through">70,000원</p>
						<div class="sail-box popular">
							<div class="sail-box-popular">
								<p class="sail-percent">62%</p>
								<p class="price-sail">26,900원</p>
							</div>
							<div class="star-rating">
								<div class="material-symbols-outlined star-rate">star</div>
								<div class="rating-average">4.8</div>
								<div class="review-count">(152)</div>
							</div>
						</div>
					</div>
					<div class="posting-detail">
						<div class="posting-icon">
						</div>
						<div class="posting-info">
							<div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="posting-item popular">
				<div class="posting-img popular">
					<a href="#">
						<img src="/resources/img/product/lactofit.jpg" />
					</a>
					<div class="gonggu-info">2인 공동구매</div>
				</div>
				<div class="posting-content popular">
					<p class="posting-title">
						<a href="#">
							[3월 한정 파격특가][종근당건강] 락토핏 생유산균 골드(50포) 3통 (150일분) / 온가족 유산균
						</a>
					</p>
					<div class="posting-price-box">
						<p class="price-through">70,000원</p>
						<div class="sail-box popular">
							<div class="sail-box-popular">
								<p class="sail-percent">62%</p>
								<p class="price-sail">26,900원</p>
							</div>
							<div class="star-rating">
								<div class="material-symbols-outlined star-rate">star</div>
								<div class="rating-average">4.8</div>
								<div class="review-count">(152)</div>
							</div>
						</div>
					</div>
					<div class="posting-detail">
						<div class="posting-icon">
						</div>
						<div class="posting-info">
							<div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="posting-item popular">
				<div class="posting-img popular">
					<a href="#">
						<img src="/resources/img/product/lactofit.jpg" />
					</a>
					<div class="gonggu-info">2인 공동구매</div>
				</div>
				<div class="posting-content popular">
					<p class="posting-title">
						<a href="#">
							[3월 한정 파격특가][종근당건강] 락토핏 생유산균 골드(50포) 3통 (150일분) / 온가족 유산균
						</a>
					</p>
					<div class="posting-price-box">
						<p class="price-through">70,000원</p>
						<div class="sail-box popular">
							<div class="sail-box-popular">
								<p class="sail-percent">62%</p>
								<p class="price-sail">26,900원</p>
							</div>
							<div class="star-rating">
								<div class="material-symbols-outlined star-rate">star</div>
								<div class="rating-average">4.8</div>
								<div class="review-count">(152)</div>
							</div>
						</div>
					</div>
					<div class="posting-detail">
						<div class="posting-icon">
						</div>
						<div class="posting-info">
							<div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="posting-item popular">
				<div class="posting-img popular">
					<a href="#">
						<img src="/resources/img/product/lactofit.jpg" />
					</a>
					<div class="gonggu-info">2인 공동구매</div>
				</div>
				<div class="posting-content popular">
					<p class="posting-title">
						<a href="#">
							[3월 한정 파격특가][종근당건강] 락토핏 생유산균 골드(50포) 3통 (150일분) / 온가족 유산균
						</a>
					</p>
					<div class="posting-price-box">
						<p class="price-through">70,000원</p>
						<div class="sail-box popular">
							<div class="sail-box-popular">
								<p class="sail-percent">62%</p>
								<p class="price-sail">26,900원</p>
							</div>
							<div class="star-rating">
								<div class="material-symbols-outlined star-rate">star</div>
								<div class="rating-average">4.8</div>
								<div class="review-count">(152)</div>
							</div>
						</div>
					</div>
					<div class="posting-detail">
						<div class="posting-icon">
						</div>
						<div class="posting-info">
							<div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="posting-item popular">
				<div class="posting-img popular">
					<a href="#">
						<img src="/resources/img/product/lactofit.jpg" />
					</a>
					<div class="gonggu-info">2인 공동구매</div>
				</div>
				<div class="posting-content popular">
					<p class="posting-title">
						<a href="#">
							[3월 한정 파격특가][종근당건강] 락토핏 생유산균 골드(50포) 3통 (150일분) / 온가족 유산균
						</a>
					</p>
					<div class="posting-price-box">
						<p class="price-through">70,000원</p>
						<div class="sail-box popular">
							<div class="sail-box-popular">
								<p class="sail-percent">62%</p>
								<p class="price-sail">26,900원</p>
							</div>
							<div class="star-rating">
								<div class="material-symbols-outlined star-rate">star</div>
								<div class="rating-average">4.8</div>
								<div class="review-count">(152)</div>
							</div>
						</div>
					</div>
					<div class="posting-detail">
						<div class="posting-icon">
						</div>
						<div class="posting-info">
							<div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="posting-item popular">
				<div class="posting-img popular">
					<a href="#">
						<img src="/resources/img/product/lactofit.jpg" />
					</a>
					<div class="gonggu-info">2인 공동구매</div>
				</div>
				<div class="posting-content popular">
					<p class="posting-title">
						<a href="#">
							[3월 한정 파격특가][종근당건강] 락토핏 생유산균 골드(50포) 3통 (150일분) / 온가족 유산균
						</a>
					</p>
					<div class="posting-price-box">
						<p class="price-through">70,000원</p>
						<div class="sail-box popular">
							<div class="sail-box-popular">
								<p class="sail-percent">62%</p>
								<p class="price-sail">26,900원</p>
							</div>
							<div class="star-rating">
								<div class="material-symbols-outlined star-rate">star</div>
								<div class="rating-average">4.8</div>
								<div class="review-count">(152)</div>
							</div>
						</div>
					</div>
					<div class="posting-detail">
						<div class="posting-icon">
						</div>
						<div class="posting-info">
							<div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="posting-item popular">
				<div class="posting-img popular">
					<a href="#">
						<img src="/resources/img/product/lactofit.jpg" />
					</a>
					<div class="gonggu-info">2인 공동구매</div>
				</div>
				<div class="posting-content popular">
					<p class="posting-title">
						<a href="#">
							[3월 한정 파격특가][종근당건강] 락토핏 생유산균 골드(50포) 3통 (150일분) / 온가족 유산균
						</a>
					</p>
					<div class="posting-price-box">
						<p class="price-through">70,000원</p>
						<div class="sail-box popular">
							<div class="sail-box-popular">
								<p class="sail-percent">62%</p>
								<p class="price-sail">26,900원</p>
							</div>
							<div class="star-rating">
								<div class="material-symbols-outlined star-rate">star</div>
								<div class="rating-average">4.8</div>
								<div class="review-count">(152)</div>
							</div>
						</div>
					</div>
					<div class="posting-detail">
						<div class="posting-icon">
						</div>
						<div class="posting-info">
							<div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="posting-item popular">
				<div class="posting-img popular">
					<a href="#">
						<img src="/resources/img/product/lactofit.jpg" />
					</a>
					<div class="gonggu-info">2인 공동구매</div>
				</div>
				<div class="posting-content popular">
					<p class="posting-title">
						<a href="#">
							[3월 한정 파격특가][종근당건강] 락토핏 생유산균 골드(50포) 3통 (150일분) / 온가족 유산균
						</a>
					</p>
					<div class="posting-price-box">
						<p class="price-through">70,000원</p>
						<div class="sail-box popular">
							<div class="sail-box-popular">
								<p class="sail-percent">62%</p>
								<p class="price-sail">26,900원</p>
							</div>
							<div class="star-rating">
								<div class="material-symbols-outlined star-rate">star</div>
								<div class="rating-average">4.8</div>
								<div class="review-count">(152)</div>
							</div>
						</div>
					</div>
					<div class="posting-detail">
						<div class="posting-icon">
						</div>
						<div class="posting-info">
							<div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="posting-item popular">
				<div class="posting-img popular">
					<a href="#">
						<img src="/resources/img/product/lactofit.jpg" />
					</a>
					<div class="gonggu-info">2인 공동구매</div>
				</div>
				<div class="posting-content popular">
					<p class="posting-title">
						<a href="#">
							[3월 한정 파격특가][종근당건강] 락토핏 생유산균 골드(50포) 3통 (150일분) / 온가족 유산균
						</a>
					</p>
					<div class="posting-price-box">
						<p class="price-through">70,000원</p>
						<div class="sail-box popular">
							<div class="sail-box-popular">
								<p class="sail-percent">62%</p>
								<p class="price-sail">26,900원</p>
							</div>
							<div class="star-rating">
								<div class="material-symbols-outlined star-rate">star</div>
								<div class="rating-average">4.8</div>
								<div class="review-count">(152)</div>
							</div>
						</div>
					</div>
					<div class="posting-detail">
						<div class="posting-icon">
						</div>
						<div class="posting-info">
							<div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="posting-item popular">
				<div class="posting-img popular">
					<a href="#">
						<img src="/resources/img/product/lactofit.jpg" />
					</a>
					<div class="gonggu-info">2인 공동구매</div>
				</div>
				<div class="posting-content popular">
					<p class="posting-title">
						<a href="#">
							[3월 한정 파격특가][종근당건강] 락토핏 생유산균 골드(50포) 3통 (150일분) / 온가족 유산균
						</a>
					</p>
					<div class="posting-price-box">
						<p class="price-through">70,000원</p>
						<div class="sail-box popular">
							<div class="sail-box-popular">
								<p class="sail-percent">62%</p>
								<p class="price-sail">26,900원</p>
							</div>
							<div class="star-rating">
								<div class="material-symbols-outlined star-rate">star</div>
								<div class="rating-average">4.8</div>
								<div class="review-count">(152)</div>
							</div>
						</div>
					</div>
					<div class="posting-detail">
						<div class="posting-icon">
						</div>
						<div class="posting-info">
							<div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="posting-item popular">
				<div class="posting-img popular">
					<a href="#">
						<img src="/resources/img/product/lactofit.jpg" />
					</a>
					<div class="gonggu-info">2인 공동구매</div>
				</div>
				<div class="posting-content popular">
					<p class="posting-title">
						<a href="#">
							[3월 한정 파격특가][종근당건강] 락토핏 생유산균 골드(50포) 3통 (150일분) / 온가족 유산균
						</a>
					</p>
					<div class="posting-price-box">
						<p class="price-through">70,000원</p>
						<div class="sail-box popular">
							<div class="sail-box-popular">
								<p class="sail-percent">62%</p>
								<p class="price-sail">26,900원</p>
							</div>
							<div class="star-rating">
								<div class="material-symbols-outlined star-rate">star</div>
								<div class="rating-average">4.8</div>
								<div class="review-count">(152)</div>
							</div>
						</div>
					</div>
					<div class="posting-detail">
						<div class="posting-icon">
						</div>
						<div class="posting-info">
							<div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="posting-item popular">
				<div class="posting-img popular">
					<a href="#">
						<img src="/resources/img/product/lactofit.jpg" />
					</a>
					<div class="gonggu-info">2인 공동구매</div>
				</div>
				<div class="posting-content popular">
					<p class="posting-title">
						<a href="#">
							[3월 한정 파격특가][종근당건강] 락토핏 생유산균 골드(50포) 3통 (150일분) / 온가족 유산균
						</a>
					</p>
					<div class="posting-price-box">
						<p class="price-through">70,000원</p>
						<div class="sail-box popular">
							<div class="sail-box-popular">
								<p class="sail-percent">62%</p>
								<p class="price-sail">26,900원</p>
							</div>
							<div class="star-rating">
								<div class="material-symbols-outlined star-rate">star</div>
								<div class="rating-average">4.8</div>
								<div class="review-count">(152)</div>
							</div>
						</div>
					</div>
					<div class="posting-detail">
						<div class="posting-icon">
						</div>
						<div class="posting-info">
							<div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			
			
	
	
			<div class="posting-item popular">
				전체보기
			</div>
		</div>
		</c:if>






	<div class="product-wrap">
		<!-- 전체 상품 wrap -->
		<div class="product-sort-top-menu">
			<div class="product-count">총 142건</div>
			<ul>
				<li><a class="product-sort" value="recent-sort">최신 등록순</a></li>
				<li><a class="product-sort" value="popular-sort">인기순</a></li>
				<li><a class="product-sort" value="review-sort">리뷰 많은순</a></li>
				<li><a class="product-sort" value="discount-sort">할인률 <span class="material-symbols-outlined">arrow_upward</span></a></li>
				<li><a class="product-sort" value="lowprice-sort">가격 <span class="material-symbols-outlined">arrow_downward</span></a></li>
				<li><a class="product-sort" value="highprice-sort">가격 <span class="material-symbols-outlined">arrow_upward</span></a></li>
			</ul>
		</div>
		<!-- <c:forEach items="${list }" var="p">
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
							<p class="sail-percent">${p.productDiscount}%</p>
							<p class="price-sail">${p.productPrice}원</p>
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
		</c:forEach> -->
	</div>


</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />	

    <!-- 상품 js -->
    <script src="/resources/js/product.js"></script>
    
	<script>

	// 페이지 로드 되자마자 최신등록순으로 상품 출력
	$(".product-sort-top-menu>ul>li").first().children().addClass("active-sort");
	console.log("페이지 로드 : "+$("#startHidden").val());

		//////////////////////
		//////////////// 중복 출력 되는 경우, 로드 전에 스크롤을 내린다음에 버튼 클릭하면 그때 엠티 되면서 스크롤 마지막에 닿아서 두번출력됨
	productMoreAjax(true);
	console.log("페이지 로드 후 아작스1 : "+$("#startHidden").val());


	// 상품 정렬버튼 선택
	$(".product-sort").on("click", function(){
		// empty
		$(".product-wrap .posting-item").remove();

		$(".active-sort").removeClass("active-sort");
		$(this).addClass("active-sort");
		// console.log($(".active-sort").attr("value"));

		// 아작스 함수 실행
		console.log("초기화전 : "+$("#startHidden").val());
		$("#startHidden").val(1);
		productMoreAjax(true);
		console.log("정렬 : "+$("#startHidden").val());

	});


	// 무한 스크롤
		$(window).on("scroll", function(){
			let scrollTop = $(window).scrollTop();
			let windowHeight = $(window).height();
			let documentHeight = $(document).height();
			let isBottom = scrollTop + windowHeight >= documentHeight;

			// 아작스 함수 실행
			productMoreAjax(isBottom);
			// console.log(isBottom);

		});	// 함수 이벤트 종료


		function productMoreAjax(isBottom){
			const startHidden = $("#startHidden").val();
			const fCategoryNo = $("#fCategoryNo").val();
			const sCategoryNo = $("#sCategoryNo").val();
			const totalCount = Number($("#startHidden").attr("totalCount"));
			const currentVal = Number($("#startHidden").val());
			const sortType = $(".active-sort").attr("value");

			// (1) 2 3 (4) 5 6 (7) 8 9 (10) < 10
			if(isBottom && currentVal <= totalCount){
				console.log("productMoreAjax 실행 : " + $("#startHidden").val());
				$.ajax({
					url : "/productMore.do",
					data : {start : startHidden, amount : 3, fCategoryNo : fCategoryNo, sCategoryNo: sCategoryNo, sortType: sortType },
					success : function(data){
						console.log(data);
						
						for(let i=0; i<data.length ; i++) {
							const p = data[i];
							
	// 					<div class="posting-item">
	// 			            <div class="posting-img">
	// 			                <a href="#">
	// 			                    <img src="/resources/upload/product/${p.thumbnail }" />
	// 			                </a>
	// 			                <div class="gonggu-info">${p.gongguNumber}인 공동구매</div>
	// 			            </div>
							const div = $("<div>");
							div.addClass("posting-item");
							
							const imgDiv = $("<div>");
							imgDiv.addClass("posting-img");
							
							const imgA = $("<a>");
							imgA.attr("href", "#");
							
							const img = $("<img>");
							img.attr("src", "/resources/upload/product/"+p.thumbnail);
							
							const infoDiv = $("<div>");
							infoDiv.addClass("gonggu-info");
							infoDiv.text(p.gongguNumber + "인 공동구매");
							
							imgDiv.append(imgA);
							imgA.append(img);
							imgDiv.append(infoDiv);
							div.append(imgDiv);
							
	
	// 			            <div class="posting-content">
	
	// 			                <p class="posting-title">
	// 			                    <a href="#">
	// 			                        ${p.productName}
	// 			                    </a>
	// 			                </p>
							const contentDiv = $("<div>");
							contentDiv.addClass("posting-content");
							
							const titleP = $("<p>");
							titleP.addClass("posting-title");
							
							const titleA = $("<a>");
							titleA.attr("href", "#");
							titleA.text(p.productName);
							
							titleP.append(titleA);
							contentDiv.append(titleP);
	
	
	// 			                <div class="posting-price-box">
	// 			                    <p class="price-through">70,000원</p>
	// 			                    <div class="sail-box">
	// 			                        <p class="sail-percent">${p.productDiscount}%</p>
	// 			                        <p class="price-sail">${p.productPrice}</p>
	// 			                    </div>
	// 			                </div>
	
							const priceboxDiv = $("<div>");
							priceboxDiv.addClass("posting-price-box");
							
							const throughP = $("<p>");
							throughP.addClass("price-through");
							throughP.text(p.productPrice/(100 - p.productDiscount)*100+"원");
							
							const sailboxDiv = $("<div>");
							sailboxDiv.addClass("sail-box");
							
							const percentP = $("<p>");
							percentP.addClass("sail-percent");
							percentP.text(p.productDiscount+"%");
							
							const sailP = $("<p>");
							sailP.addClass("price-sail");
							sailP.text(p.productPrice+"원");
							
							sailboxDiv.append(percentP);
							sailboxDiv.append(sailP);
							
							priceboxDiv.append(throughP);
							priceboxDiv.append(sailboxDiv);
	
							contentDiv.append(priceboxDiv);
							
	
	
	// 			                <div class="posting-detail">
	// 			                    <div class="posting-info">
	// 			                        <div>
	// 			                            <span class="posting-info-box">무료배송</span>
	// 			                        </div>
	// 			                        <div class="star-rating">
	// 			                            <div class="material-symbols-outlined star-rate">star</div>
	// 			                            <div class="rating-average">4.8</div>
	// 			                            <div class="review-count">(152)</div>
	// 			                        </div>
	// 			                    </div>
	// 			                </div>
							
							const detailDiv = $("<div>");
							detailDiv.addClass("posting-detail");
							
							const postinginfoDiv = $("<div>");
							postinginfoDiv.addClass("posting-info");
							
							const postinginfoboxDiv = $("<div>");
							const postinginfoSpan = $("<span>");
							postinginfoSpan.addClass("posting-info-box");
							postinginfoSpan.text("무료배송");
							
							postinginfoboxDiv.append(postinginfoSpan);
							
							const ratingDiv = $("<div>");
							ratingDiv.addClass("star-rating");
							
							const stariconDiv = $("<div>");
							stariconDiv.addClass("material-symbols-outlined star-rate");
							stariconDiv.text("star");
							
							const averageDiv = $("<div>");
							averageDiv.addClass("rating-average");
							averageDiv.text("4.8");
							
							const countDiv = $("<div>");
							countDiv.addClass("review-count");
							countDiv.text("(152)");
							
							ratingDiv.append(stariconDiv);
							ratingDiv.append(averageDiv);
							ratingDiv.append(countDiv);
							
							postinginfoDiv.append(postinginfoboxDiv);
							postinginfoDiv.append(ratingDiv);
							
							detailDiv.append(postinginfoDiv);
							
							contentDiv.append(detailDiv);
	
	
	// 			            </div>
							div.append(contentDiv);
	
	// 			        </div>
						$(".product-wrap").append(div);
							
							
						}// for문 종료
						
						// 화면에 posting-item 추가 완료
						// 다음 아이템 보기 위한 값 수정 1~3 -> 4~6
						// const currentVal = Number($("#startHidden").val()); // 1
						
						$("#startHidden").val(currentVal + data.length);	// 1+3							
						
						// currentCount(ajax로 불러들인 상품 수) 값도 변경
						// const currentCount = Number($("#startHidden").attr("currentCount")); // 0
						// // 21개면 20개 출력후 select 할때 행이 없으니까 5개 아니라 1개만 불러오므로
						// // amount를 쓰지않고 data.length를 쓴다 !
						// const changeCount = currentCount + data.length; // 0 + 5(리스트길이)
						// $("#startHidden").attr("currentCount", changeCount); // 5
						
						
						
// 						if(changeCount == totalCount){
// 							// 변화된 currentCount(실제 가져온 게시물 수)랑 총 개수랑 같으면 끝
// 							$("#startHidden").remove();
// 						}
						
						
						
						
					} // success 종료
				}) // ajax 종료
			} // if문 종료
		}






		// 액티브 카테고리
		$(document).ready(function(){
			// class="active-category-name"
			if($("#sCategoryNo").val() == 0){
				$(".all-category").addClass("active-category-name");
			}else{
				$(".all-category").removeClass("active-category-name");
				
				const subCategoryLi = $(".sub-category").parent();
				for(let i=0; i<subCategoryLi.length ; i++){
					if($("#sCategoryNo").val() == $(".sub-category").parent().eq(i).val() ){
						// console.log($(".sub-category").parent().eq(i).val());
						$(".sub-category").eq(i).addClass("active-category-name");
					}
				}
			}
		});	


	</script>
</body>
</html>