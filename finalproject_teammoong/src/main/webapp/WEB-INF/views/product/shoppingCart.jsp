<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/resources/css/product/cart.css"/>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	
	
	<div class="content-wrap">
		<h1>${sessionScope.m.memberName }님의 장바구니</h1>	














		<div class="order-payment-wrap">
			<div>
				<form action="/orderSheet.do" method="post">
					<c:forEach items="${basketList}" var="i">
						<div class="cart-product-item">
							<div class="cart-product-img">
								<a href="#">
									<img src="/resources/upload/product/${i.thumbnail }" />
								</a>
							</div>
							<div class="cart-product-info">
								<div class="cart-product-title">
									<a href="#">
										${i.productName }
									</a>
								</div>
								<div class="cart-product-option">${i.optionDetailName }</div>
							</div>
							<div class="cart-product-volume">
								<button type="button" class="minus-count">-</button>
								<input type="text" name="pop_out" value="0" readonly="readonly" style="text-align:center;"/>
								<button type ="button" class="plus-count">+</button>
							</div>
							<div class="cart-product-price"></div>
							<input type="hidden" class="product-price" value="${i.productPrice }">
							<input type="hidden" class="product-discount" value="${i.productDiscount }">
							<!-- ${i.productDiscount}% <fmt:formatNumber value="${i.productPrice }"/>원 -->
							<!-- ${i.productPrice } * ( 100 - ${i.productDiscount }) / 100 -->
						</div>
					</c:forEach>
					<button>주문하기</button>
				</form>
			</div>
			<div class="total-pay-box">
				<h5>결제 금액</h5>

				<!-- <div class="total-order-amount-box"> -->
				<div class="total-order-amount-1">
					<div>주문금액</div>
					<div>42,800원</div>
				</div>
				<div class="total-order-amount-2">
					<div>└ 상품 금액</div>
					<div>44,800원</div>
				</div>
				<div class="total-order-amount-3">
					<div>└ 상품 할인 금액</div>
					<div>- 2,000원</div>
				</div>
				<!-- </div> -->

				<div class="total-order-delivery-fee">
					<div>배송비</div>
					<div>0원</div>
				</div>
				<div class="total-order-coupon">
					<div>쿠폰 할인</div>
					<div>0원</div>
				</div>
				<div class="total-order-saved-money">
					<div>적립금 사용</div>
					<div>0원</div>
				</div>

				<div class="total-order-pay">
					<div>최종 결제 금액</div>
					<div>42,800원</div>
				</div>

				<div class="total-order-buy-save-point">
					<button type="button" class="btn btn-pri">적립</button>
					<div>구매시</div>
					<div>2,180원 (5%)</div>
				</div>
			</div>
		</div>
		


	</div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
		$(".order-check").on("change", function(){
			if($(this).is(":checked")){
				// 선택 안된 체크박스는 전달안되게
				$(this).next().prop("disabled", false);
				$(this).next().next().prop("disabled", false);
			}else{
				$(this).next().prop("disabled", true);
				$(this).next().next().prop("disabled", true);
			}
		})
		
		// 주문 수량
		$(".cart-product-volume>button").on("click", function(){
			let inputCount = $(this).parent().find("input[name='pop_out']");
			let inputCountVal = Number(inputCount.val());
			// 상품 재고
			const productEa = 10;

			if($(this).hasClass("plus-count")){
				if(inputCountVal < productEa){
					inputCount.val(Number(inputCountVal)+1);
				}
			}else{
				if(inputCountVal > 0 ){
					inputCount.val(Number(inputCountVal)-1);
				}
			}
		});

		// 가격
		for(let i=0;i<$(".cart-product-price").length;i++){
			// console.log($(".cart-product-price").length);

			const productPrice = $(".product-price").eq(i).val();
			const productDiscount = $(".product-discount").eq(i).val();
			
			$(".cart-product-price").eq(i).text((Math.floor(productPrice*(100 - productDiscount)/1000)*10).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+"원");
		};


	</script>
</body>
</html>