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
			<div class="mypage-right-title">주문 상세정보</div>
			<div class="mypage-content">
				<!-- 단일상품 / 여러상품일때 구분 필요 -->

				<div class="myorder-view-item">
					<div class="myorder-order-no">
						<table>
							<tr>
								<th>주문번호</th>
								<td><div id="myorder-order-sheetno"></div></td>
							</tr>
							<tr>
								<th>주문날짜</th>
								<td><div id="myorder-order-dateonly"></div></td>
							</tr>
						</table>
						<input type="hidden" value="${o.orderDate}" name="orderDate">
						<input type="hidden" value="${o.orderNo}" name="orderNo">
					</div>


					<c:forEach items="${orderProductList }" var="i">
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
							<c:if test="${i.orderStatus eq 7}">
								<div class="myorder-btn-zone" style="position: static;">
								<form action="#">
									<button class="btn btn-pri size01">리뷰쓰기</button>
								</form>
								</div>
							</c:if>
						</div>
					</c:forEach>




					<!-- 배송지 정보 -->
					<div class="myorder-order-item order-detail-info">
						<div class="myorder-order-content-title">배송지 정보</div>
						<table class="tbl-box" style="margin-bottom: 20px;">
							<tr>
								<th>수령인</th>
								<td>${o.deliReceiver}</td>
							</tr>
							<tr>
								<th>연락처</th>
								<td>${o.deliPhone}</td>
							</tr>
							<tr>
								<th>배송지</th>
								<td>${o.deliAddr}</td>
							</tr>
							<tr>
								<th>배송메모</th>
								<td>${o.deliRequest}</td>
							</tr>
						</table>
					</div>

					<!-- 최초 주문금액 -->
					<!-- <div class="myorder-order-item order-detail-info">
						<div class="myorder-order-content-title">최종 결제금액</div>
						<table class="tbl-box" style="margin-bottom: 20px;">
							<tr>
								<th>주문금액</th>
								<td><fmt:formatNumber value="${o.orderPrice}"/> 원</td>
							</tr>
							<tr>
								<th>└ 상품 금액</th>
								<td>-원</td>
							</tr>
							<tr>
								<th>└ 상품 할인 금액</th>
								<td>-원</td>
							</tr>
							<tr>
								<th>최종 결제금액</th>
								<td><fmt:formatNumber value="${o.totalPrice}"/> 원</td>
							</tr>
						</table>
					</div> -->

					<!-- 결제 상세 -->
					<div class="myorder-order-item order-detail-info">
						<div class="myorder-order-content-title">결제 상세</div>
						<table class="tbl-box" style="margin-bottom: 20px;">
							<tr>
								<th>주문금액</th>
								<td><fmt:formatNumber value="${o.orderPrice}"/> 원</td>
							</tr>
							<tr>
								<th>쿠폰 사용</th>
								<td>-원</td>
							</tr>
							<tr>
								<th>적립금 사용</th>
								<td>- ${o.minusPointEa} 원</td>
							</tr>
							<tr>
								<th>카드 간편결제</th>
								<td><fmt:formatNumber value="${o.totalPrice}"/> 원</td>
							</tr>
						</table>
					</div>

					<!-- 적립금 혜택 -->
					<div class="myorder-order-item order-detail-info">
						<div class="myorder-order-content-title">적립금 혜택</div>
						<table class="tbl-box" style="margin-bottom: 20px;">
							<tr>
								<th>적립</th>
								<td>+ <fmt:formatNumber value="${o.plusPointEa}"/> 원</td>
							</tr>
						</table>
					</div>

					
				</div>
			</div>
		</div>
	</div>
	
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />


<script>

	// 주문번호 및 주문날짜 작성
	$(document).ready(function() {
		const orderNo = $("[name=orderNo]").val()
		const orderDate = $("[name=orderDate]").val();

		const numOrderDate = orderDate.replace(/\D/g, "");
		const dateOnlyString = orderDate.substring(0, 10);

		$("#myorder-order-sheetno").text(numOrderDate+""+orderNo);
		$("#myorder-order-dateonly").text(dateOnlyString);

	});
</script>
</body>
</html>