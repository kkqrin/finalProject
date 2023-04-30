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
	<link rel="stylesheet" href="/resources/css/product/productView.css"/>
</head>
<style>
	
	@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);
.rate { display: inline-block;border: 0;margin-right: 15px;}
.rate > input 
{display: none;}

.rate > label 
{float: right;color: #ddd}

.rate > label:before 
{display: inline-block;font-size: 2rem;padding: .3rem .2rem;margin: 0;cursor: pointer;font-family: FontAwesome;content: "\f005 ";}

.rate .half:before 
{content: "\f089 "; position: absolute;padding-right: 0;}

.rate input:checked ~ label, 
.rate label:hover,
.rate label:hover ~ label 
{ color: gold !important;  } 

.rate input:checked + .rate label:hover,
.rate input input:checked ~ label:hover,
.rate input:checked ~ .rate label:hover ~ label,  
.rate label:hover ~ input:checked ~ label 
{ color: gold !important;  } 
/* 리뷰css */
.modal-body>form>.selectBox-widht-explain{
	width: 80%;
	margin: 0 auto;
}
.slick-prev:before, .slick-next:before {
	/* 슬릭 슬라이더 아이콘 */
	color: #565656;
	font-family: 'Font Awesome 5 Free';
	font-weight: 900;
}
.all-review-wrap .slick-prev,
#modal-photo-review-detail .slick-prev{
	left: 10px;
	z-index: 100;
}
.all-review-wrap .slick-next,
#modal-photo-review-detail .slick-next{
	right: 10px;
}
.slick-next:before{
	content: '\f054' !important;
}
.slick-prev:before{
	content: '\f053' !important;
}
.slick-prev.slick-disabled:before,
.slick-next.slick-disabled:before
{
	/* 슬릭 슬라이더 첫,마지막페이지 이전,다음 아이콘 숨김 */
	/* opacity: .25; */
	opacity: 0;
	cursor: default;
}
#modal-photo-review-more,
#modal-photo-review-detail{
	/* 포토후기 더보기, 상세보기 */
	max-width: none;
	width: 800px;
}
#modal-photo-review-detail .review-info,
#modal-photo-review-detail .review-content{
	width: 400px;
}
#modal-photo-review-more .photo-review-img{
	width: 150px;
	height: 150px;
}
/* 리뷰css 끝 */
.slick-prev:before, .slick-next:before {
/* 슬릭 슬라이더 아이콘 */
color: #565656;
font-family: 'Font Awesome 5 Free';
font-weight: 900;
}
.slick-prev{
left: 10px;
z-index: 100;
}
.slick-next {
right: 10px;
}
.slick-next:before{
content: '\f054' !important;
}
.slick-prev:before{
content: '\f053' !important;
}
.slick-prev.slick-disabled:before,
.slick-next.slick-disabled:before
{
/* 슬릭 슬라이더 첫,마지막페이지 이전,다음 아이콘 숨김 */
/* opacity: .25; */
opacity: 0;
cursor: default;
}
/* .material-symbols-outlined {
font-variation-settings:
'FILL' 0,
'wght' 400,
'GRAD' 0,
'opsz' 48
} */
.test {
color: #f88000;
font-variation-settings:
'FILL' 1,
'wght' 400,
'GRAD' 0,
'opsz' 48
}
.material-symbols-outlined:hover {
color: #f88000;
font-variation-settings:
'FILL' 1,
'wght' 400,
'GRAD' 0,
'opsz' 48
}
</style>
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
	<!-- <button type="button" id="insertReview" class="btn btn-pri size01" data-modal="#modalReview">리뷰하기</button> -->
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />


<script>
	  function readURL(input) {
            if (input.files && input.files[0]) {
              var reader = new FileReader();
              reader.onload = function(e) {
                document.getElementById('preview').src = e.target.result;
              };
              reader.readAsDataURL(input.files[0]);
            } else {
              document.getElementById('preview').src = "";
            }
          }
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

		$("#modal-myorder-product-list .modal-body").children().remove();
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

					$("#modal-myorder-product-list .modal-body").append(div);
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
						btn.attr('type','button')
						btn.attr('id',"insertReview");
						btn.attr('data-modal','#modalReview');
						btn.text("리뷰쓰기");

						// btnForm.append(btn);
						btnZoneDiv.append(btn);
						div.append(btnZoneDiv);

					}
					
					
					$("#modal-myorder-product-list .modal-body").append(div);
					modalOnfunction();
				}
			}
		});
	});
	function modalOnfunction(){
		//모달 관련 기능
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
	}
</script>
</body>
</html>