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
	<!-- 리뷰css -->
	<link rel="stylesheet" href="/resources/css/product/review.css"/>
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


					<!-- 주문한 상품리스트 -->
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
								<!-- <form action="#"> -->
									<button id="insertReiview" type="button" class="btn btn-pri size01"  data-modal="#modalReview">리뷰쓰기</button>
									<!-- </form> -->
								</div>
							</c:if>
						</div>
					</c:forEach>
					<button type="button" id="insertReview" class="btn btn-pri size01" data-modal="#modalReview">리뷰하기</button>




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
								<td>- <fmt:formatNumber value="${couponPrice}"/> 원</td>
							</tr>
							<tr>
								<th>적립금 사용</th>
								<td>- <fmt:formatNumber value="${o.minusPointEa}"/> 원</td>
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
<!--리뷰관련 HTML 시작-->
	<!--리뷰작성 모달 시작-->
	<div id="modalReview" class="modal modal-pri" style="max-width: none;">
		<form action="/insertReview.do" method="post" enctype="multipart/form-data">
		<div class="modal-content">
			<div class="modal-header">
				<h6>리뷰작성</h6>
			</div>
				<input type="hidden" name="reviewWriter" value="${sessionScope.m.memberId}">
				<input type="hidden" name="productNo" value="${p.productNo}">
			<div class="modal-body">
				<!--내용영역-->
				<div style="display: flex;">
					<div>
						<div id="root">
							<h5>사진등록</h5>
							<div class="contents">
							  <div class="upload-box">
								<div id="drop-file" class="drag-file">
								  <img src="https://img.icons8.com/pastel-glyph/2x/image-file.png" alt="파일 아이콘" class="image" >
								  <p class="message">사진 드래그 업로드</p>
								  <img src="" alt="미리보기 이미지" class="preview">
								</div>
								<label class="file-label" for="chooseFile">사진선택</label>
								<input class="file" name="reviewFile" id="chooseFile" type="file" onchange="dropFile.handleFiles(this.files)" accept="image/png, image/jpeg, image/gif, image/jpg" multiple>
							  </div>
							</div>
						  </div>
						<!-- <input type="file" name="reviewFile" multiple onchange="readURL(this)"> -->
						<!-- <img id="preview"> -->
					</div>
					<div style="width: 100%; margin-left: 10px;">
						<div>
						<fieldset class="rate" style="padding: 0;"><h5 style="padding-bottom: 10px;">별점</h5>
							<input type="radio" id="rating10" name="rating" value="5"><label for="rating10" title="5점"></label>
							<input type="radio" id="rating9" name="rating" value="4.5"><label class="half" for="rating9" title="4.5점"></label>
							<input type="radio" id="rating8" name="rating" value="4"><label for="rating8" title="4점"></label>
							<input type="radio" id="rating7" name="rating" value="3.5"><label class="half" for="rating7" title="3.5점"></label>
							<input type="radio" id="rating6" name="rating" value="3"><label for="rating6" title="3점"></label>
							<input type="radio" id="rating5" name="rating" value="2.5"><label class="half" for="rating5" title="2.5점"></label>
							<input type="radio" id="rating4" name="rating" value="2"><label for="rating4" title="2점"></label>
							<input type="radio" id="rating3" name="rating" value="1.5"><label class="half" for="rating3" title="1.5점"></label>
							<input type="radio" id="rating2" name="rating" value="1"><label for="rating2" title="1점"></label>
							<input type="radio" id="rating1" name="rating" value="0.5"><label class="half" for="rating1" title="0.5점"></label>
						</fieldset>
						</div>
						<br>
						<h5>리뷰내용</h5>
						<textarea name="reviewContent" style="height:65%; "></textarea>
					</div>
				</div>
			</div>
			<div class="area-btn right">
				<!-- class="btn btn-pri size01 reviewInsertBtn" id="reviewInsertBtn" -->
				<button type="submit" class="btn btn-sec size01">작성</button>
				<a href="" rel="modal:close" class="btn btn-sec size01">닫기</a>
			</div>
		</div>
	</form>
	</div>
	<!--리뷰관련 HTML 끝-->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />


<script>
	//모달 애니메이션
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