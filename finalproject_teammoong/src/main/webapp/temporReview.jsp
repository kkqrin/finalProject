<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- 리뷰 css -->
    <link rel="stylesheet" href="/resources/css/product/review.css"/>
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
					<div class="review-filter">
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
								<div class="material-symbols-outlined">star</div>
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
							<span class="material-symbols-outlined">add_reaction</span>
							<span class="material-symbols-outlined review-like-on">sentiment_very_satisfied</span>
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
								<div class="material-symbols-outlined">star</div>
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
							<span class="material-symbols-outlined">add_reaction</span>
							<span class="material-symbols-outlined review-like-on">sentiment_very_satisfied</span>
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
								<div class="material-symbols-outlined">star</div>
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
							<span class="material-symbols-outlined">add_reaction</span>
							<span class="material-symbols-outlined review-like-on">sentiment_very_satisfied</span>
							도움이 돼요
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>