<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- 슬릭 슬라이더 제이쿼리 -->
	<!-- <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script> -->
	<!-- <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script> -->
    <!-- 리뷰 css -->
    <link rel="stylesheet" href="/resources/css/product/review.css"/>
	<!-- 슬릭 슬라이더 -->
	<!-- <link rel="stylesheet" href="/resources/slick/slick-theme.css"/> -->
	<!-- <link rel="stylesheet" href="/resources/slick/slick.css"/> -->
	<!-- 슬라이더 화살표 아이콘 arrow -->
	<!-- <script src="https://kit.fontawesome.com/285f888d1c.js" crossorigin="anonymous"></script> -->

	<style>
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
		
	</style>
</head>
<body>
	<!-- <jsp:include page="/WEB-INF/views/common/header.jsp" /> -->
	<div class="content-wrap">
	<pre>
		남은 거 : 포토후기 더보기 > 상세보기 이미지 왜 바로 안뜨는지? 나중에 뜨는지?
	</pre>
		<h1>포토후기</h1>
		<!-- 최근 5개의 리뷰만 노출 -->
		<div class="photo-review-wrap">
			<div class="photo-review-list">
				<div class="photo-review-item">
					<div class="photo-review-img">
						<img src="/resources/img/review/banana_review1.jpg" />
					</div>
				</div>
				<div class="photo-review-item">
					<div class="photo-review-img">
						<img src="/resources/img/review/banana_review2.jpg" />
					</div>
				</div>
				<div class="photo-review-item">
					<div class="photo-review-img">
						<img src="/resources/img/review/banana_review3.jpg" />
					</div>
				</div>
				<div class="photo-review-item">
					<div class="photo-review-img">
						<img src="/resources/img/review/banana_review3.jpg" />
					</div>
				</div>
				<div class="photo-review-item">
					<div class="photo-review-img">
						<img src="/resources/img/review/banana_review3.jpg" />
						<div class="photo-review-more" data-modal="#modal-photo-review-more">더보기</div>
					</div>
				</div>
			</div>
		</div>

		<h1>전체리뷰</h1>
		<div class="all-review-wrap">
			<div class="review-header">
				<div class="review-count">총 121건</div>
				<div class="review-navi">
					<div class="review-filter" data-modal="#modal-review-filter">
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
						<img src="/resources/img/review/banana_review1.jpg" />
						<img src="/resources/img/review/banana_review2.jpg" />
						<img src="/resources/img/review/banana_review3.jpg" />
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
								<div class="review-report" data-modal="#modal-report-btn">
									<span class="material-symbols-outlined">warning</span>
								</div>
								<div class="review-enroll-date">2023-04-03</div>
							</div>
						</div>
						<div class="review-content">어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!!어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!!어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!!</div>
						<div class="review-like">
							<div>
								<span class="material-symbols-outlined review-like-on">add_reaction</span>
								<span class="material-symbols-outlined">sentiment_very_satisfied</span>
								<a>도움이 돼요</a>
							</div>
						</div>
					</div>
				</div>
				<div class="review-box">
					<div class="review-img">
						<!-- <img src="/resources/img/product/lactofit.jpg" /> -->
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
								<div class="review-report" data-modal="#modal-report-btn">
									<span class="material-symbols-outlined">warning</span>
								</div>
								<div class="review-enroll-date">2023-04-03</div>
							</div>
						</div>
						<div class="review-content">이미지없는 리뷰입니다. 이미지없는 리뷰입니다. 이미지없는 리뷰입니다. 이미지없는 리뷰입니다. </div>
						<div class="review-like">
							<div>
								<span class="material-symbols-outlined review-like-on">add_reaction</span>
								<span class="material-symbols-outlined">sentiment_very_satisfied</span>
								<a>도움이 돼요</a>
							</div>
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
								<div class="review-report" data-modal="#modal-report-btn">
									<span class="material-symbols-outlined">warning</span>
								</div>
								<div class="review-enroll-date">2023-04-03</div>
							</div>
						</div>
						<div class="review-content">어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!! 어쩌고 저쩌고 좋아요!!</div>
						<div class="review-like">
							<div>
								<span class="material-symbols-outlined review-like-on">add_reaction</span>
								<span class="material-symbols-outlined">sentiment_very_satisfied</span>
								<a>도움이 돼요</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>




		<!-- 필터 모달 -->
		<div id="modal-review-filter" class="modal modal-sec">
			<div class="modal-content">
				<div class="modal-header">
					<h6>상품 옵션</h6>
				</div>
				<div class="modal-body">
					<!--내용영역-->
					<!-- <h5>내용타이틀</h5> -->
					<form action="/test.do">
							<div class="selectBox-widht-explain">
								<select class="select-custom review-color" id="review-color" style="margin-bottom: 30px;">
									<option value="0" selected>색상</option>
									<option value="white">White</option>
									<option value="black">Black</option>
								</select>
								<select class="select-custom review-size" id="review-size">
									<option value="0" selected>사이즈</option>
									<option value="240">240</option>
									<option value="245">245</option>
								</select>
							</div>
					</form>
					<!--//내용영역-->
				</div>
				<div class="area-btn center">
					<a class="btn btn-pri size01" type="button" id="review-filter-btn" rel="modal:close">확인</a>
					<a href="" rel="modal:close" class="btn btn-sec size01">닫기</a>
				</div>
			</div>
		</div>

		<!-- 포토후기 더보기 -->
		<div id="modal-photo-review-more" class="modal modal-pri">
			<div class="modal-content">
				<div class="modal-header">
					<h6>포토후기</h6>
				</div>
				<div class="modal-body">
					<!--내용영역-->
					<div class="photo-review-wrap">
						<div class="photo-review-list">
							<div class="photo-review-item">
								<div class="photo-review-img" data-modal="#modal-photo-review-detail">
									<img src="/resources/img/review/banana_review1.jpg" />
								</div>
							</div>
							
						</div>
					</div>
					<!--//내용영역-->
				</div>
			</div>
		</div>

		<!-- 포토후기 더보기 > 상세보기 -->
		<div id="modal-photo-review-detail" class="modal modal-pri">
			<div class="modal-content">
				<div class="modal-header">
					<h6>포토리뷰 상세보기</h6>
				</div>
				<div class="modal-body">
					<!--내용영역-->
					<div class="review-box">
						<div class="review-img">
							<img src="/resources/img/review/banana_review1.jpg" />
							<img src="/resources/img/review/banana_review2.jpg" />
							<img src="/resources/img/review/banana_review3.jpg" />
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
								<div>
									<span class="material-symbols-outlined review-like-on">add_reaction</span>
									<span class="material-symbols-outlined">sentiment_very_satisfied</span>
									<a>도움이 돼요</a>
								</div>
							</div>
						</div>
					</div>
					<!--//내용영역-->
				</div>
				<div class="back-photo-review-more" data-modal="#modal-photo-review-more">
					<span class="material-symbols-outlined">grid_view</span>
					<div>사진 목록보기</div>
				</div>
			</div>
		</div>

		<!-- 신고하기 모달 -->
		<div id="modal-report-btn" class="modal modal-pri report-modal">
			<div class="modal-content">
				<div class="modal-header">
					<h6>리뷰 신고하기</h6>
				</div>
				<div class="modal-body">
					<!--내용영역-->
					<!-- <h5>내용타이틀</h5> -->
					<form action="/test.do">
						<div class="report-form">
							<div><label><input type="radio" name="report-reason" value="1">상품관련 비방 내용</label></div>
							<div><label><input type="radio" name="report-reason" value="2">음란, 욕설 등 부절적한 내용</label></div>
							<div><label><input type="radio" name="report-reason" value="3">개인, 판매자 상업적 홍보</label></div>
							<div><label><input type="radio" name="report-reason" value="4">상품과 관계없는 내용</label></div>
							<div><label><input type="radio" name="report-reason" value="5">개인정보 노출</label></div>
							<div><label><input type="radio" name="report-reason" value="6">저작권 불법도용(이미지,동영상)</label></div>
							<div><label><input type="radio" name="report-reason" value="7">상품 후기 취지에 어긋난 이용(복사글 등)</label></div>
							<div><label><input type="radio" name="report-reason" value="8">직접 입력</label></div>
							<div><textarea class="report-direct-input" disabled></textarea></div>
						</div>
					</form>
					<!--//내용영역-->
				</div>
				<div class="area-btn center">
					<a class="btn btn-pri size01" type="button" id="review-filter-btn" rel="modal:close">확인</a>
					<a rel="modal:close" class="btn btn-sec size01 report-modal-close">닫기</a>
				</div>
			</div>
		</div>



	</div>
	<!-- <jsp:include page="/WEB-INF/views/common/footer.jsp" /> -->
	<!-- 리뷰 js -->
	<script src="/resources/js/review.js"></script>
	<!-- 슬릭 슬라이더 js -->
	<!-- <script type="text/javascript" src="/resources/slick/slick.min.js"></script> -->

</body>
</html>