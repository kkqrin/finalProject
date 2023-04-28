<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 구매내역</title>
    <!--productView.css-->
    <link rel="stylesheet" href="/resources/css/member/myOrderList.css">
</head>

<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="content-wrap">
		<div class="mypage-wrap">
		
		<jsp:include page="/WEB-INF/views/common/myPageMenu.jsp" />
		
		<div class="mypage-right">
			<div class="mypage-right-title">내 구매내역</div>
			<div class="mypage-content">
				<!-- 단일상품 / 여러상품일때 구분 필요 -->


				<c:forEach items="${myOrderList }" var="i">
					<div class="myorder-order-item">
						<div class="myorder-product-count">
							<div class="myorder-order-status">
							<c:choose>
								<c:when test="${i.orderStatus eq 1}">
									결제완료
								</c:when>
								<c:when test="${i.orderStatus eq 2}">
									배송준비중
								</c:when>
								<c:when test="${i.orderStatus eq 3}">
									배송중
								</c:when>
								<c:when test="${i.orderStatus eq 4}">
									배송완료
								</c:when>
								<c:when test="${i.orderStatus eq 5}">
									결제취소
								</c:when>
								<c:when test="${i.orderStatus eq 6}">
									환불완료
								</c:when>
								<c:when test="${i.orderStatus eq 7}">
									구매확정
								</c:when>
							</c:choose>
							</div>
						</div>
						<div class="myorder-product-img">
							<!-- <a href="/productView.do?productNo=${i.productNo}"> -->
								<a class="modal-product-list" data-modal="#modal-myorder-product-list" style="cursor: pointer;">
									<img src="/resources/upload/product/${i.thumbnail }" />
								</a>
							<!-- </a> -->
							<c:if test="${i.orderProductCount gt 1}">
								<div class="ab-product-count">
									<span>${i.orderProductCount}</span>
								</div>
							</c:if>
						</div>
						<div class="myorder-order-title-box">
							<div class="myorder-product-title">
								<!-- <a href="/productView.do?productNo=${i.productNo}"> -->
									${i.productName }
									<c:if test="${i.orderProductCount gt 1}">
										.. 외
									</c:if>
								<!-- </a> -->
							</div>
						</div>
						<div class="myorder-total-price"><fmt:formatNumber value="${i.orderPrice}"/> 원
							<c:if test="${i.orderStatus eq 7}">
								<div class="myorder-btn-zone">
									<!-- <form action="#"> -->
										<button type="button" class="btn btn-border-pri size01 possible-review">리뷰 작성 가능</button>
									<!-- </form> -->
								</div>
							</c:if>
						</div>
						<div class="myorder-order-info">
							<div class="myorder-order-date">${i.orderDate}</div>
							<c:if test="${i.orderProductCount gt 1}">
							<div class="myorder-product-total-count">총 ${i.orderProductCount} 건</div>
							</c:if>
							<div class="myorder-order-detail">
								<form action="/myOrderDetail.do" method="post">
									<input type="hidden" name="orderNo" value="${i.orderNo}">
									<button id="order-detail-btn">주문상세<div class="material-symbols-outlined">chevron_right</div></button>
								</form>
							</div>
						</div>
					</div>
				</c:forEach>




				<!-- 여러 상품일때 상품들 리스트 (더보기) 모달 -->
				<div id="modal-myorder-product-list" class="modal modal-sec" style="min-width: fit-content;">
					<div class="modal-content">
						<div class="modal-header">
							<h6>주문한 상품 목록</h6>
						</div>
						<div class="modal-body">
							<!--내용영역-->
							<!-- <h5>내용타이틀</h5> -->
							<!-- <c:forEach items="${orderProductList }" var="i">
								<div class="myorder-order-item">
									<div class="myorder-product-img">
										<a href="/productView.do?productNo=${i.productNo}">
											<img src="/resources/upload/product/${i.thumbnail }" />
										</a>
									</div>
									<div class="myorder-order-title-box">
										<div class="myorder-product-title">
											<a href="/productView.do?productNo=${i.productNo}">
												${i.productName }
											</a>
										</div>
										<div class="myorder-product-option">
											${i.optionDetailName }
										</div>
									</div>
									<div class="myorder-total-count"> ${i.orderDetailCnt}개</div>
									<div class="myorder-total-price"><fmt:formatNumber value="${i.orderSalePrice}"/> 원</div>
								</div>
							</c:forEach> -->
							<!--//내용영역-->
						</div>
						<div class="area-btn center">
							<a class="btn btn-pri size01" type="button" id="review-filter-btn" rel="modal:close">확인</a>
							<a href="" rel="modal:close" class="btn btn-sec size01">닫기</a>
						</div>
					</div>
				</div>


			</div>
		</div>
	</div>
	
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />


<script>
	//모달 관련 기능
	$(function () {
		$('[data-modal]').click(function (event) {
			const modalId = $(this).data('modal');
			if ($(modalId).hasClass('modal-pri')) {
				$($(this).data('modal')).modal({
					fadeDuration: 100
				});
				return false;
			} else if ($(modalId).hasClass('modal-sec')) {
				$($(this).data('modal')).modal({
					escapeClose: false,
					showClose: false,
					fadeDuration: 100
				});
				return false;
			} else {
				return false;
			}
		});
	});


	$(".possible-review").on("click", function(){
		$(this).parent().parent().parent().find($(".modal-product-list")).click();
	});


// modal-product-list
	$(".modal-product-list").on("click", function(){
		const orderNo = $(this).parent().parent().find("[name=orderNo]").val();

		$(".modal-body").children().remove();
		$.ajax({
			url : "/myOrderProductList.do",
			data : {orderNo : orderNo},

			success : function(data){
				console.log(data);

				for(let i=0;i<data.length;i++){
					const p = data[i];
					// console.log("p : "+p.productName);
					// $(".modal-body").append(p.productName);
					
					// 				<div class="myorder-order-item">
					// 					<div class="myorder-product-img">
					// 						<a href="/productView.do?productNo=${i.productNo}">
					// 							<img src="/resources/upload/product/${i.thumbnail }" />
					// 						</a>
					// 					</div>

					const div = $("<div>");
					div.addClass("myorder-order-item");

					const imgDiv = $("<div>");
					imgDiv.addClass("myorder-product-img");

					const imgA = $("<a>");
					imgA.attr("href", "/productView.do?productNo="+p.productNo);
						
					const img = $("<img>");
					img.attr("src", "/resources/upload/product/"+p.thumbnail);
					
					imgDiv.append(imgA);
					imgA.append(img);
					div.append(imgDiv);

					$(".modal-body").append(div);
					// 					<div class="myorder-order-title-box">
					// 						<div class="myorder-product-title">
					// 							<a href="/productView.do?productNo=${i.productNo}">
					// 								${i.productName }
					// 							</a>
					// 						</div>
					// 						<div class="myorder-product-option">
					// 							${i.optionDetailName }
					// 						</div>
					// 					</div>

					const titleBoxDiv = $("<div>");
					titleBoxDiv.addClass("myorder-order-title-box");

					const titleDiv = $("<div>");
					titleDiv.addClass("myorder-product-title");

					const titleA = $("<a>");
					titleA.attr("href", "/productView.do?productNo="+p.productNo);
					titleA.text(p.productName);

					const optionDiv = $("<div>");
					optionDiv.addClass("myorder-product-option");
					optionDiv.text(p.optionDetailName);

					titleDiv.append(titleA);
					titleBoxDiv.append(titleDiv);
					titleBoxDiv.append(optionDiv);
					div.append(titleBoxDiv);


					// 					<div class="myorder-total-count"> ${i.orderDetailCnt}개</div>
					// 					<div class="myorder-total-price"><fmt:formatNumber value="${i.orderSalePrice}"/> 원</div>
					// 				</div>

					const countDiv = $("<div>");
					countDiv.addClass("myorder-total-count");
					countDiv.text(p.orderDetailCnt);

					const priceDiv = $("<div>");
					priceDiv.text(p.orderSalePrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+" 원");
					priceDiv.addClass("myorder-total-price");
					

					div.append(countDiv);
					div.append(priceDiv);


					// <c:if test="${i.orderStatus eq 7}">
					// 	<div class="myorder-btn-zone">
					// 		<form action="#">
					// 			<button class="btn btn-pri size01">리뷰쓰기</button>
					// 		</form>
					// 	</div>
					// </c:if>

					if(Number(p.orderStatus) == 7){
						const btnZoneDiv = $("<div>");
						const btnForm = $("<form>");
						const btn = $("<button>");
						btn.addClass("btn btn-pri size01");
						btn.text("리뷰쓰기");

						btnForm.append(btn);
						btnZoneDiv.append(btnForm);
						div.append(btnZoneDiv);
					}
					
					
					$(".modal-body").append(div);
				}
			}
		});
	});

</script>
</body>
</html>