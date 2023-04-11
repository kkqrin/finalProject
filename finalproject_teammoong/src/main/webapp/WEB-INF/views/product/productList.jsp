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
		<h3>하잉</h3>
		<ul class="subcategory-name-list">
			<li><a href="#">전체보기</a></li>
			<c:forEach items="${detailCategoryList}" var="test">
				<li><a href="#">${test.detailCategoryName}</a></li>
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
<input type="hidden" id="sCategoryNo" value="${sCategory }">
<input type="hidden" id="startHidden" value="4" totalCount="10" currentCount="0">
<button type="button" class="temporBtn">일단더보기</button>

</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />	

    <!-- 상품 js -->
    <script src="/resources/js/product.js"></script>
    
	<script>
// 		$(window).on("scroll", function(){
// 			let scrollTop = $(window).scrollTop();
// 			let windowHeight = $(window).height();
// 			let documentHeight = $(document).height();
// 			let isBottom = scrollTop + windowHeight >= documentHeight;
			
// 			const startHidden = $("#startHidden").val();
// 			const sCategoryNo = $("#sCategoryNo").val();
			
// 			if(isBottom){
// 				console.log("마지막!!");
				
// 				$.ajax({
// 					url : "/productMore.do",
// 					data : {start : 4, amount : 3, sCategoryNo: sCategoryNo },
// 					success : function(data){
// 						console.log(data);
// // 						console.log("eez");
// 					}
// 				})
// 			}
// 		});
		
// 		$(".temporBtn").on("click", function(){
		$(window).on("scroll", function(){
			let scrollTop = $(window).scrollTop();
			let windowHeight = $(window).height();
			let documentHeight = $(document).height();
			let isBottom = scrollTop + windowHeight >= documentHeight;
			
			const startHidden = $("#startHidden").val();
			const sCategoryNo = $("#sCategoryNo").val();
			
			
			if(isBottom){
				console.log("마지막!!");
				$.ajax({
					url : "/productMore.do",
					data : {start : startHidden, amount : 3, detailCategoryNo: sCategoryNo },
	// 				contentType: false,
	// 				processData: false,
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
							
	// 						$(".product-wrap").append(div);
							
							
	
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
						const currentVal = Number($("#startHidden").val()); // 1
						$("#startHidden").val(currentVal + 3);	// 1+3
						
						// currentCount 값도 변경
						const currentCount = Number($("#startHidden").attr("currentCount")); // 0
						// 21개면 20개 출력후 select 할때 행이 없으니까 5개 아니라 1개만 불러오므로
						// amount를 쓰지않고 data.length를 쓴다 !
						const changeCount = currentCount + data.length; // 0 + 5(리스트길이)
						$("#startHidden").attr("currentCount", changeCount); // 5
						
						const totalCount = Number($("#startHidden").attr("totalCount"));
						
						if(changeCount == totalCount){
							// 변화된 currentCount(실제 가져온 게시물 수)랑 총 개수랑 같으면 끝
							$("#startHidden").remove();
						}
						
						
						
						
					} // success 종료
				}) // ajax 종료
			} // if문 종료
		});	// 함수 이벤트 종료
	</script>
</body>
</html>