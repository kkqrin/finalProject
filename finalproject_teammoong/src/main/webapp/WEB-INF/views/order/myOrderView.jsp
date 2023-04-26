<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
						<div>202304261047000001</div>
						<div>2023-04-26</div>
					</div>

					<!-- foreach -->
					<div class="myorder-order-item">
						<!-- <div class="myorder-product-count">
							<div class="myorder-order-status">결제완료</div>
						</div> -->
						<div class="myorder-product-img">
							<a href="/productView.do?productNo=${i.productNo}">
								<img src="/resources/upload/product/${i.thumbnail }" />
							</a>
							<!-- <div class="ab-product-count">
								<span>8</span>
							</div> -->
						</div>
						<div class="myorder-order-title-box">
							<div class="myorder-product-title">
								<a href="/productView.do?productNo=${i.productNo}">
									<!-- ${i.productName } -->
									[4월 한정 파격특가][우리동네과일가게]저탄소 GAP 파파야멜론 750g (2입) 
								</a>
							</div>
							<div class="myorder-product-option">
								${i.optionDetailName }
								푸실리 파스타
							</div>
						</div>
						<!-- <div class="myorder-product-volume">
							${i.basketCount}
						</div> -->
						<div class="myorder-total-count">3개</div>
						<div class="myorder-total-price">50,000 원</div>
						<!-- <div class="myorder-order-info">
							<div class="myorder-order-date">2023/04/25</div>
							<div class="myorder-product-total-count">총 8건</div>
							<div class="myorder-order-detail">
								<form action="/myOrderView.do">
									<button id="order-detail-btn">주문상세<div class="material-symbols-outlined">chevron_right</div></button>
								</form>
							</div>
						</div> -->
					</div>
					<div class="myorder-order-item">
						<!-- <div class="myorder-product-count">
							<div class="myorder-order-status">결제완료</div>
						</div> -->
						<div class="myorder-product-img">
							<a href="/productView.do?productNo=${i.productNo}">
								<img src="/resources/upload/product/${i.thumbnail }" />
							</a>
							<!-- <div class="ab-product-count">
								<span>8</span>
							</div> -->
						</div>
						<div class="myorder-order-title-box">
							<div class="myorder-product-title">
								<a href="/productView.do?productNo=${i.productNo}">
									<!-- ${i.productName } -->
									[4월 한정 파격특가][우리동네과일가게]저탄소 GAP 파파야멜론 750g (2입) 
								</a>
							</div>
							<div class="myorder-product-option">
								${i.optionDetailName }
								푸실리 파스타
							</div>
						</div>
						<!-- <div class="myorder-product-volume">
							${i.basketCount}
						</div> -->
						<div class="myorder-total-count">1개</div>
						<div class="myorder-total-price">30,000 원</div>
						<!-- <div class="myorder-order-info">
							<div class="myorder-order-date">2023/04/25</div>
							<div class="myorder-product-total-count">총 8건</div>
							<div class="myorder-order-detail">
								<form action="/myOrderView.do">
									<button id="order-detail-btn">주문상세<div class="material-symbols-outlined">chevron_right</div></button>
								</form>
							</div>
						</div> -->
					</div>

					<!-- 배송지 정보 -->
					<div class="myorder-order-item order-detail-info">
						<div class="myorder-order-content-title">배송지 정보</div>
						<table class="tbl-box" style="margin-bottom: 20px;">
							<tr>
								<th>수령인</th>
								<td>김명훈</td>
							</tr>
							<tr>
								<th>연락처</th>
								<td>010-1111-1234</td>
							</tr>
							<tr>
								<th>배송지</th>
								<td>10433</td>
							</tr>
							<tr>
								<th>배송메모</th>
								<td>문 앞에 놔주세요</td>
							</tr>
						</table>
					</div>

					<!-- 최초 주문금액 -->
					<div class="myorder-order-item order-detail-info">
						<div class="myorder-order-content-title">최종 결제금액</div>
						<table class="tbl-box" style="margin-bottom: 20px;">
							<tr>
								<th>주문금액</th>
								<td>1,000원</td>
							</tr>
							<tr>
								<th>└ 상품 금액</th>
								<td>1,000원</td>
							</tr>
							<tr>
								<th>└ 상품 할인 금액</th>
								<td>1,000원</td>
							</tr>
							<tr>
								<th>최종 결제금액</th>
								<td>1,000원</td>
							</tr>
						</table>
					</div>

					<!-- 결제 상세 -->
					<div class="myorder-order-item order-detail-info">
						<div class="myorder-order-content-title">결제 상세</div>
						<table class="tbl-box" style="margin-bottom: 20px;">
							<tr>
								<th>주문금액</th>
								<td>1,000원</td>
							</tr>
							<tr>
								<th>└ 상품 금액</th>
								<td>1,000원</td>
							</tr>
							<tr>
								<th>└ 상품 할인 금액</th>
								<td>1,000원</td>
							</tr>
							<tr>
								<th>최종 결제금액</th>
								<td>1,000원</td>
							</tr>
						</table>
					</div>

					<!-- 적립금 혜택 -->
					<div class="myorder-order-item order-detail-info">
						<div class="myorder-order-content-title">적립금 혜택</div>
						<table class="tbl-box" style="margin-bottom: 20px;">
							<tr>
								<th>주문금액</th>
								<td>1,000원</td>
							</tr>
							<tr>
								<th>└ 상품 금액</th>
								<td>1,000원</td>
							</tr>
							<tr>
								<th>└ 상품 할인 금액</th>
								<td>1,000원</td>
							</tr>
							<tr>
								<th>최종 결제금액</th>
								<td>1,000원</td>
							</tr>
						</table>
					</div>

					
				</div>
			</div>
		</div>
	</div>
	
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>