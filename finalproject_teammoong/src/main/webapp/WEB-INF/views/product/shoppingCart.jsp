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
	<pre>
		남은 일 : 체크박스 전체선택 / 선택삭제 / form버튼 스티키안에 있는 걸로 동작되게
	</pre>
		<div class="cart-title">
			<h4>${sessionScope.m.memberName }님의 장바구니</h4>
		</div>
		<div class="cart-header">
			<div><label><input type="checkbox" id="all-product">전체선택</label></div>
			<div>선택삭제</div>
		</div>
		<div class="order-payment-wrap">
			<div>
				<form action="/orderSheet.do" method="post">
					<c:forEach items="${basketList}" var="i">
						<div class="cart-product-item">
							<div>
								<input type="checkbox" name="chk">
								<input type="hidden" name="productNo" value="${i.productNo}" disabled>
								<input type="hidden" name="optionNo" value="${i.optionNo}" disabled>
							</div>
							<div class="cart-product-img">
								<a href="/productView.do?productNo=${i.productNo}">
									<img src="/resources/upload/product/${i.thumbnail }" />
								</a>
							</div>
							<div class="cart-product-info">
								<div class="cart-product-title">
									<a href="/productView.do?productNo=${i.productNo}">
										${i.productName }
									</a>
								</div>
								<div class="cart-product-option">${i.optionDetailName }</div>
							</div>
							<div class="cart-product-volume">
								<button type="button" class="minus-count">-</button>
								<input type="text" name="pop_out" value="1" readonly="readonly" style="text-align:center;"/>
								<button type ="button" class="plus-count">+</button>
							</div>
							<div class="cart-product-price"><span></span>원</div>
							<input type="hidden" class="product-price" value="${i.productPrice }">
							<input type="hidden" class="product-discount" value="${i.productDiscount }">
						</div>
					</c:forEach>
					<!-- <button>주문하기</button> -->
				</form>
			</div>
			<div class="total-pay-box">
				<h5>결제 금액</h5>

				<!-- <div class="total-order-amount-box"> -->
				<div class="total-order-amount-1">
					<div>주문금액</div>
					<div><input type="hidden" class="hidden-product-price"><span>0</span> 원</div>
				</div>
				<div class="total-order-amount-2">
					<div>└ 상품 금액</div>
					<div><input type="hidden" class="hidden-product-price"><span>0</span> 원</div>
				</div>
				<div class="total-order-amount-3">
					<div>└ 상품 할인 금액</div>
					<div><input type="hidden" class="hidden-product-price">-<span>0</span> 원</div>
				</div>
				<!-- </div> -->
				<!-- <div class="total-order-delivery-fee">
					<div>무료배송</div>
					<div>0 원</div>
				</div> -->
				<!-- <div class="total-order-coupon">
					<div>쿠폰 할인</div>
					<div>0원</div>
				</div>
				<div class="total-order-saved-money">
					<div>적립금 사용</div>
					<div>0원</div>
				</div> -->
				<!-- <div class="total-order-pay">
					<div>최종 결제 금액</div>
					<div><span></span>원</div>
				</div> -->

				<div class="total-order-buy-save-point">
					<button type="button" class="btn btn-pri">적립</button>
					<div>구매시 </div>
					<div>2,180원 (5%)</div>
				</div>
				<div class="cart-pay-box area-btn full" style="margin-top: 30px;">
                    <button class="btn btn-pri size02" id="form-submit-order-btn">주문하기</button>
                </div>
			</div>
		</div>
		


	</div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
		$("[name=chk]").on("change", function(){
			if($(this).is(":checked")){
				// 선택 안 된 체크박스는 주문서 페이지로 전달안되게
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

		// 상품리스트 상품 가격 + 화폐 단위
		for(let i=0;i<$(".cart-product-price").length;i++){
			// console.log($(".cart-product-price").length);

			const productPrice = $(".product-price").eq(i).val();
			const productDiscount = $(".product-discount").eq(i).val();
			
			// Math.floor(productPrice*(100 - productDiscount)/1000)*10)
			$(".cart-product-price").eq(i).children().text((Math.floor(productPrice*(100 - productDiscount)/1000)*10).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		};


		// 선택된 상품 가격 계산
		$(document).ready(function() {
			$("#all-product").click(function() {
				// 상품 전체 선택
				if($("#all-product").is(":checked")){
					$("input[name=chk]").prop("checked", true);
				}else{
					$("input[name=chk]").prop("checked", false);
				} 
			});

			$("input[name=chk]").click(function() {
				// 체크박스 하나
				var total = $("input[name=chk]").length;
				var checked = $("input[name=chk]:checked").length;

				if(total != checked){
					$("#all-product").prop("checked", false);
				}else{
					$("#all-product").prop("checked", true); 
				}

				if($(this).is(":checked")){
					// 할인전 상품금액
					const amount2 = Number($(".total-order-amount-2>div").last().children().val());
					const price = Number($(this).parent().parent().children().last().prev().val());
					// input hidden에 number 넣어놓고 change 이벤트 발생시 span에 단위 표시한 string 보여줌
					$(".total-order-amount-2>div").last().children().val(amount2+price).trigger('change');
					
					// 할인되는 금액
					const amount3 = Number($(".total-order-amount-3>div").last().children().val());
					const discount = Number($(this).parent().parent().children().last().val());
					$(".total-order-amount-3>div").last().children().val(amount3+price-(Math.floor(price*(100 - discount)/1000)*10)).trigger('change');

					// 주문금액 (결제할 금액)
					const amount1 = Number($(".total-order-amount-1>div").last().children().val());
					$(".total-order-amount-1>div").last().children().val(amount1+(Math.floor(price*(100 - discount)/1000)*10)).trigger('change');
				}else{
					// 선택해제시 빼야됨ㅋㅋ
					// 할인전 상품금액
					const amount2 = Number($(".total-order-amount-2>div").last().children().val());
					const price = Number($(this).parent().parent().children().last().prev().val());
					$(".total-order-amount-2>div").last().children().val(amount2-price).trigger('change');
					
					// 할인되는 금액
					const amount3 = Number($(".total-order-amount-3>div").last().children().val());
					const discount = Number($(this).parent().parent().children().last().val());
					$(".total-order-amount-3>div").last().children().val(amount3-(price-(Math.floor(price*(100 - discount)/1000)*10))).trigger('change');

					// 주문금액 (결제할 금액)
					const amount1 = Number($(".total-order-amount-1>div").last().children().val());
					$(".total-order-amount-1>div").last().children().val(amount1-(Math.floor(price*(100 - discount)/1000)*10)).trigger('change');



				}
			});
		});

		// 페이박스 화폐 단위 표시
		$(".hidden-product-price").on("change", function(){
			console.log("change!");
			$(this).next().text($(this).val().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		});

		// 폼 제출
		$("#form-submit-order-btn").on("click", function(){
			$("form").submit();
		});


	</script>
</body>
</html>