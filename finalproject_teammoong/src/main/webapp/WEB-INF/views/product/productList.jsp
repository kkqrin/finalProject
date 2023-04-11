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

	

	<div class="category-wrap">
		<h3>${detailCategoryList[0].categoryName }</h3>
		<ul class="subcategory-name-list">
			<li><a href="/productList.do?category=${10000 + fCategory }">전체보기</a></li>
			<c:forEach items="${detailCategoryList}" var="i">
				<li><a href="/productList.do?category=${i.categoryNo}${i.detailCategoryNo}">${i.detailCategoryName}</a></li>
			</c:forEach>
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
<input type="hidden" id="fCategoryNo" value="${fCategory }">
<input type="hidden" id="sCategoryNo" value="${sCategory }">
<input type="hidden" id="startHidden" value="4" totalCount="${totalCount }" currentCount="0">

</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />	

    <!-- 상품 js -->
    <script src="/resources/js/product.js"></script>
    
	<script>
	
	// 무한 스크롤
		$(window).on("scroll", function(){
			let scrollTop = $(window).scrollTop();
			let windowHeight = $(window).height();
			let documentHeight = $(document).height();
			let isBottom = scrollTop + windowHeight >= documentHeight;
			
			const startHidden = $("#startHidden").val();
			const fCategoryNo = $("#fCategoryNo").val();
			const sCategoryNo = $("#sCategoryNo").val();
			const totalCount = Number($("#startHidden").attr("totalCount"));
			const currentVal = Number($("#startHidden").val())
			
			// (1) 2 3 (4) 5 6 (7) 8 9 (10) < 10
			if(isBottom && currentVal <= totalCount){
				console.log("마지막!!");
				$.ajax({
					url : "/productMore.do",
					data : {start : startHidden, amount : 3, fCategoryNo : fCategoryNo, sCategoryNo: sCategoryNo },
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
// 						const currentCount = Number($("#startHidden").attr("currentCount")); // 0
// 						// 21개면 20개 출력후 select 할때 행이 없으니까 5개 아니라 1개만 불러오므로
// 						// amount를 쓰지않고 data.length를 쓴다 !
// 						const changeCount = currentCount + data.length; // 0 + 5(리스트길이)
// 						$("#startHidden").attr("currentCount", changeCount); // 5
						
						
						
// 						if(changeCount == totalCount){
// 							// 변화된 currentCount(실제 가져온 게시물 수)랑 총 개수랑 같으면 끝
// 							$("#startHidden").remove();
// 						}
						
						
						
						
					} // success 종료
				}) // ajax 종료
			} // if문 종료
		});	// 함수 이벤트 종료
	</script>
</body>
</html>