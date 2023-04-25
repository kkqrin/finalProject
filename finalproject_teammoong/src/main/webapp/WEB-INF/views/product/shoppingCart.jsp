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
<style>
	@font-face {
    font-family: 'Shilla_CultureB-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-02@1.0/Shilla_CultureB-Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
	}
	.empty{
		font-family: 'Shilla_CultureB-Bold';
		font-size: 150px;
		margin: 150px auto;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	
	<div class="content-wrap">

		<div class="cart-title">
			<h4>${sessionScope.m.memberName }님의 장바구니</h4>
		</div>

		<c:choose>
			<c:when test="${basketList.size() eq 0}">
				<div class="order-payment-wrap" style="justify-content: center;">
					<h1 class="empty">텅 ~</h1>
				</div>
			</c:when>
			<c:otherwise>

				<div class="cart-header">
					<div style="display: flex;">
						<!-- <label><input type="checkbox" id="all-product">전체선택</label> -->
						<label class="checkbox-container">
							<input type="checkbox" id="all-product">
							<span class="custom-checkbox"></span>
							전체선택
						</label>
					</div>
					<form action="/deleteCart.do" method="post" id="form-delet-cart">
						<button id="delete-cart">선택삭제</button>
						<c:forEach items="${basketList}" var="i">
							<input type="hidden" name="basketNo" value="${i.basketNo}" disabled>
						</c:forEach>
					</form>
				</div>

				<div class="order-payment-wrap">
					<div>
						<form action="/orderSheet.do" method="post">
							<c:forEach items="${basketList}" var="i" varStatus="status">
								<div class="cart-product-item">
									<div>
										<!-- <input type="checkbox" name="chk"> -->
										<label class="checkbox-container">
											<input type="checkbox" name="chk">
											<span class="custom-checkbox"></span>
										</label>
										<!-- <input type="hidden" name="productNo" value="${i.productNo}" disabled>
										<input type="hidden" name="optionNo" value="${i.optionNo}" disabled> -->
										<input type="hidden" name="productNo" value="${i.productNo}" disabled>
										<input type="hidden" name="optionNo" value="${i.optionNo}" disabled>
										<input type="hidden" name="orderDetailCnt" value="${i.basketCount}" disabled>
										<input type="hidden" name="page" value="0">
										<input type="hidden" name="chk-index" value="${status.index}">
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
										<!-- <button type="button" class="minus-count">-</button> -->
										<input type="text" name="pop_out" value="${i.basketCount}" readonly="readonly" style="text-align:center;"/>
										<!-- <button type ="button" class="plus-count">+</button> -->
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
			</c:otherwise>
		</c:choose>

	</div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
		$("[name=chk]").on("change", function(){
			if($(this).is(":checked")){
				// 선택 안 된 체크박스는 주문서 페이지로 전달안되게
				$(this).parent().next().prop("disabled", false);
				$(this).parent().next().next().prop("disabled", false);
				$(this).parent().next().next().next().prop("disabled", false);

				// 인덱스 가져오기
				const index = $(this).parent().next().next().next().next().next().val();
				$("#form-delet-cart input[name=basketNo]").eq(index).prop("disabled", false);

			}else{
				$(this).parent().next().prop("disabled", true);
				$(this).parent().next().next().prop("disabled", true);
				$(this).parent().next().next().next().prop("disabled", true);

				// 인덱스 가져오기
				const index = $(this).parent().next().next().next().next().next().val();
				$("#form-delet-cart input[name=basketNo]").eq(index).prop("disabled", true);
			}
		});

		$("form#form-delet-cart").submit(function (e) {
			if(($("input[name=chk]:checked")).length == 0){
				// 선택한 상품이 없을때
				alert("선택하신 상품이 없습니다");
			}else{
				// 선택삭제 alert
				cartjQueryAlert('error', this);
			}
				e.preventDefault();
				return false;
		});
		
		// 장바구니에서 선택삭제 alert
		function cartjQueryAlert(type, form) {
		let $type = type;
		switch ($type) {
			case 'error':
			messageBox = $.parseHTML('<div class="alert__error" style="text-align:center;"><div class="title" style="margin-bottom:10px;color:var(--error);padding:0;">뭉쳐야산다</div><div style="margin: 50px auto;"><div style="margin-top:10px;">선택한 상품을 장바구니에서 삭제하시겠습니까?</div></div></div>');			
			break;
		}
		$("body").append(messageBox);
		$(messageBox).dialog({
			dialogClass :$type,
			// open: $(messageBox).append(msg),
			draggable: false,
			modal: true,
			width: 400,
			buttons: [
				{
					text: "삭제",
					style: "margin-right:5px",
					click: function(){
						$(this).dialog("close");

						form.submit();
					}
				},
				{
					text: "취소",
					click: function(){
						$(this).dialog("close");
					}
				}
			],
			show: {
				effect: 'fade',
				duration: 200 //at your convenience
			},
			hide: {
				effect: 'fade',
				duration: 200 //at your convenience
			}
		});
	};



		
		// // 주문 수량 증감
		// $(".cart-product-volume>button").on("click", function(){
		// 	let inputCount = $(this).parent().find("input[name='pop_out']");
		// 	let inputCountVal = Number(inputCount.val());
		// 	// 상품 재고
		// 	const productEa = 10;

		// 	if($(this).hasClass("plus-count")){
		// 		if(inputCountVal < productEa){
		// 			inputCount.val(Number(inputCountVal)+1).trigger('change');
		// 		}
		// 	}else{
		// 		if(inputCountVal > 0 ){
		// 			inputCount.val(Number(inputCountVal)-1).trigger('change');
		// 		}
		// 	}
		// });

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
					$("input[name=chk]").prop("checked", true).trigger('change');
				}else{
					$("input[name=chk]").prop("checked", false).trigger('change');
				} 
			});

			$("input[name=chk]").change(function() {
				// 체크박스 하나
				var total = $("input[name=chk]").length;
				var checked = $("input[name=chk]:checked").length;
				// let productCount = $(this).parent().parent().find($("[name=pop_out]")).val();
				let productCount = $(this).parent().parent().next().next().next().children().val();

				if(total != checked){
					$("#all-product").prop("checked", false);
				}else{
					$("#all-product").prop("checked", true); 
				}

				if($(this).is(":checked")){
					// 할인전 상품금액
					const amount2 = Number($(".total-order-amount-2>div").last().children().val());
					const price = Number($(this).parent().parent().parent().children().last().prev().val());
					// input hidden에 number 넣어놓고 change 이벤트 발생시 span에 단위 표시한 string 보여줌
					$(".total-order-amount-2>div").last().children().val(amount2+price*productCount).trigger('change');
					
					// 할인되는 금액
					const amount3 = Number($(".total-order-amount-3>div").last().children().val());
					const discount = Number($(this).parent().parent().parent().children().last().val());
					$(".total-order-amount-3>div").last().children().val(amount3+price*productCount-(Math.floor(price*(100 - discount)/1000)*10)).trigger('change');

					// 주문금액 (결제할 금액)
					const amount1 = Number($(".total-order-amount-1>div").last().children().val());
					$(".total-order-amount-1>div").last().children().val(amount1+(Math.floor(price*productCount*(100 - discount)/1000)*10)).trigger('change');
				}else{
					// 선택해제시 빼야됨ㅋㅋ
					// 할인전 상품금액
					const amount2 = Number($(".total-order-amount-2>div").last().children().val());
					const price = Number($(this).parent().parent().parent().children().last().prev().val());
					$(".total-order-amount-2>div").last().children().val(amount2-price*productCount).trigger('change');
					
					// 할인되는 금액
					const amount3 = Number($(".total-order-amount-3>div").last().children().val());
					const discount = Number($(this).parent().parent().parent().children().last().val());
					$(".total-order-amount-3>div").last().children().val(amount3-(price*productCount-(Math.floor(price*(100 - discount)/1000)*10))).trigger('change');

					// 주문금액 (결제할 금액)
					const amount1 = Number($(".total-order-amount-1>div").last().children().val());
					$(".total-order-amount-1>div").last().children().val(amount1-(Math.floor(price*productCount*(100 - discount)/1000)*10)).trigger('change');

				}
			});
		});









		// 페이박스 화폐 단위 표시
		$(".hidden-product-price").on("change", function(){
			// console.log("change!");
			$(this).next().text($(this).val().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		});

		// 폼 제출
		$("#form-submit-order-btn").on("click", function(){
			$(".order-payment-wrap form").submit();
		});

		

	</script>
</body>
</html>