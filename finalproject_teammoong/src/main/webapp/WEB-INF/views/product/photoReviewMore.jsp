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
        #modalTer{
            max-width: none;
            width: 1200px;
        }
    </style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="content-wrap">
        <h1>포토후기 전체보기</h1>
        <div class="photo-review-wrap">
			<div class="photo-review-list">
				<div class="photo-review-item">
					<div class="photo-review-img" data-modal="#modalTer">
						<img src="#">
					</div>
				</div>
				
            </div>
		</div>
    </div>


    <!-- modal-pri -->
    <div id="modalTer" class="modal modal-pri">
        <div class="modal-content">
            <div class="modal-header">
                <h6>포토리뷰 상세보기</h6>
            </div>
            <div class="modal-body">
                <!--내용영역-->
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
                <!--//내용영역-->
            </div>
        </div>
    </div>
    <!-- //modal-pri -->




    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
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
</body>
</html>