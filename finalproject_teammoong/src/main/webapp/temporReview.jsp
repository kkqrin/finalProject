<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- 리뷰 css -->
    <link rel="stylesheet" href="/resources/css/product/review.css"/>
	<style>
		.modal-body>.selectBox-widht-explain{
			width: 80%;
			margin: 0 auto;
		}
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="content-wrap">
	
		<h1>포토후기</h1>
		<!-- 최근 5개의 리뷰만 노출 -->
		<div class="photo-review-wrap">
			<div class="photo-review-list">
				<div class="photo-review-item">
					<div class="photo-review-img">
						<img src="#">
					</div>
				</div>
				<div class="photo-review-item">
					<div class="photo-review-img">
						<img src="#">
					</div>
				</div>
				<div class="photo-review-item">
					<div class="photo-review-img">
						<img src="#">
					</div>
				</div>
				<div class="photo-review-item">
					<div class="photo-review-img">
						<img src="#">
					</div>
				</div>
				<div class="photo-review-item">
					<div class="photo-review-img">
						<img src="#">
						<div class="photo-review-more">더보기</div>
					</div>
				</div>
			</div>
		</div>

		<h1>전체리뷰</h1>
		<div class="all-review-wrap">
			<div class="review-header">
				<div class="review-count">총 121건</div>
				<div class="review-navi">
					<div class="review-filter" data-modal="#modalSec">
						<span class="material-symbols-outlined">tune</span>
						필터
					</div>
					<div class="review-range">
						<span class="material-symbols-outlined">swap_vert</span>
						정렬
						<div class="review-range-view">
							<div class="review-range-thing">최신순</div>
							<div class="review-range-thing">인기순</div>
							<div class="review-range-thing">별점낮은순</div>
							<div class="review-range-thing">별점높은순</div>
						</div>
					</div>
				</div>
			</div>
			<div class="review-mid">
				<div class="review-box">
					<div class="review-img">
						<img src="/resources/img/product/lactofit.jpg" />
					</div>
					<div class="review-right">
						<div class="review-info">
							<div class="review-rating">
								<div class="material-symbols-outlined star-rate">star</div>
								<div class="material-symbols-outlined star-rate">star</div>
								<div class="material-symbols-outlined star-rate">star</div>
								<div class="material-symbols-outlined star-rate">star</div>
								<div class="material-symbols-outlined star-rate">star_half</div>
							</div>
							<div class="review-option">
								<div class="review-report">
									<span class="material-symbols-outlined">warning</span>
								</div>
								<div class="review-enroll-date">2023-04-03</div>
							</div>
						</div>
						<div class="review-content">어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!!어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!!어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!!</div>
						<div class="review-like">
							<span class="material-symbols-outlined review-like-on">add_reaction</span>
							<span class="material-symbols-outlined">sentiment_very_satisfied</span>
							도움이 돼요
						</div>
					</div>
				</div>
				<div class="review-box">
					<div class="review-img">
						<img src="/resources/img/product/lactofit.jpg" />
					</div>
					<div class="review-right">
						<div class="review-info">
							<div class="review-rating">
								<div class="material-symbols-outlined star-rate">star</div>
								<div class="material-symbols-outlined star-rate">star</div>
								<div class="material-symbols-outlined star-rate">star</div>
								<div class="material-symbols-outlined star-rate">star</div>
								<div class="material-symbols-outlined star-rate">star</div>
							</div>
							<div class="review-option">
								<div class="review-report">
									<span class="material-symbols-outlined">warning</span>
								</div>
								<div class="review-enroll-date">2023-04-03</div>
							</div>
						</div>
						<div class="review-content">어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!!</div>
						<div class="review-like">
							<span class="material-symbols-outlined review-like-on">add_reaction</span>
							<span class="material-symbols-outlined">sentiment_very_satisfied</span>
							도움이 돼요
						</div>
					</div>
				</div>
				<div class="review-box">
					<div class="review-img">
						<img src="/resources/img/product/lactofit.jpg" />
					</div>
					<div class="review-right">
						<div class="review-info">
							<div class="review-rating">
								<div class="material-symbols-outlined star-rate">star</div>
								<div class="material-symbols-outlined star-rate">star</div>
								<div class="material-symbols-outlined star-rate">star</div>
								<div class="material-symbols-outlined star-rate">star</div>
								<div class="material-symbols-outlined star-rate">star</div>
							</div>
							<div class="review-option">
								<div class="review-report">
									<span class="material-symbols-outlined">warning</span>
								</div>
								<div class="review-enroll-date">2023-04-03</div>
							</div>
						</div>
						<div class="review-content">어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!!</div>
						<div class="review-like">
							<span class="material-symbols-outlined review-like-on">add_reaction</span>
							<span class="material-symbols-outlined">sentiment_very_satisfied</span>
							도움이 돼요
						</div>
					</div>
				</div>
			</div>
		</div>




		<!-- 필터 모달 -->
		<div id="modalSec" class="modal modal-sec">
			<div class="modal-content">
				<div class="modal-header">
					<h6>상품 옵션</h6>
				</div>
				<div class="modal-body">
					<!--내용영역-->
					<!-- <h5>내용타이틀</h5> -->
					<div class="selectBox-widht-explain">
                        <select class="select-custom review-color" id="ui-id-1">
                            <option value="0">색상</option>
                            <option value="Item6">Item</option>
                            <option value="Item7">Item</option>
                        </select>
						<select class="select-custom review-size" id="ui-id-1">
                            <option value="0">사이즈</option>
                            <option value="Item6">240</option>
                            <option value="Item7">245</option>
                        </select>
                    </div>
					<!--//내용영역-->
				</div>
				<div class="area-btn center">
					<button class="btn btn-pri size01" type="button">버튼</button>
					<a href="" rel="modal:close" class="btn btn-sec size01">닫기</a>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script src="/resources/js/review.js"></script>
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
	</script>
		<script>
			$( function() {
				$( ".select-custom" ).selectmenu();
			});
		</script>
</body>
</html>