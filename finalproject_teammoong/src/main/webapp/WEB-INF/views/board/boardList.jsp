<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 슬릭 슬라이더 제이쿼리 -->
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<!-- 상품 css -->
<link rel="stylesheet" href="/resources/css/product/product.css"/>
<!-- 슬릭 슬라이더 -->
<link rel="stylesheet" href="/resources/slick/slick-theme.css"/>
<link rel="stylesheet" href="/resources/slick/slick.css"/>
<!-- 구글 아이콘 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<!-- 슬라이더 화살표 아이콘 arrow -->
<script src="https://kit.fontawesome.com/285f888d1c.js" crossorigin="anonymous"></script>

<style>
    .material-symbols-outlined.star-rate{
        /* 구글 아이콘 (별점) */
        font-variation-settings:
        'FILL' 1
    }
    .slick-prev:before, .slick-next:before {
        /* 슬릭 슬라이더 아이콘 */
        color: #565656;
        font-family: 'Font Awesome 5 Free';
        font-weight: 900;
    }
    .slick-next:before{
        content: '\f054' !important;
    }
    .slick-prev:before{
        content: '\f053' !important;
    }
    .popular-product-wrap>.slick-prev.slick-disabled,
    .popular-product-wrap>.slick-next.slick-disabled
    {
        /* 슬릭 슬라이더 첫,마지막페이지 이전,다음 아이콘 숨김 */
        /* opacity: .25; */
        opacity: 0;
        cursor: default;
    }
</style>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    
    
    
    
    
    
    
    <div class="content-wrap">
    
       <c:if test="${not empty sessionScope.m}">
           <div class="area-btn right" style="padding-top : 25px;">
              <button class="btn btn-sec size02"  data-modal="#modalBasic" style="color: #3a3a3a">여기여기붙어봐<span class="material-symbols-outlined" style="color: #3a3a3a; font-size: 24px; padding-bottom: 3px;">recommend</span></button>
         </div>
       </c:if>
    
    <!-- modal-basic -->
                <div id="modalBasic" class="modal modal-pri">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h6>판매자 준수사항</h6>
                        </div>
                        <div class="modal-body" style="font-size: 12px; margin-left: 2px; margin-bottom: 2px;">
                            <!--내용영역-->
                            <h6>판매자님, 약속해 주세요!</h6>
                            <p>1 배송이 지연된다면 구매자에게 꼭 안내를 해야해요. </p>
                            <p>2 구매자와의 연락 수단은 쪽지를 필수로 사용해 주세요. </p>
                            <p>3 구매자의 개인정보는 마케팅 등의 다른 목적으로 사용 할 수 없어요. </p>
                            <p>4 개인정보는 배송/반품/환불 또는 고객 상담이 완료되는 즉시 삭제해 주세요. </p>
                            <div style="padding: 20px 0 ; background-color: #f8f8f8;">
                            <h6 style="text-align: center;">위 사항을 성실히 이행하지 않을시,</h6>
                            <h6 style="text-align: center;">관련법에 의거하여 법적인 조치를 받을 수 있음을 인지하였습니다. </h6>
                            </div>
                            <!--//내용영역-->
                        </div>
                        <div class="area-btn right">
                            <button class="btn btn-pri size01" type="button" onclick="location.href='/boardWriteFrm.do'" style="margin: 0 auto;">동의 합니다.</button>
                        </div>
                    </div>
                </div>
    
    
        <div class="board-wrap-header">
            <h4>최근 등록 상품</h4>
            <div>
                <a href="#">
                    <div>더보기</div>
                    <span class="material-symbols-outlined">add_box</span>
                </a>
            </div>
        </div>
        <div class="popular-product-wrap">
        <!-- 여여붙 상품 wrap -->
        <c:forEach items="${list }" var="b">
            <div class="posting-item popular board-item">
                <div class="posting-img popular">
                    <a href="/boardView.do?boardNo=${b.boardNo }">
                    <c:set var="oneFile" value="0" />
                    <c:forEach items="${b.fileList }" var="i">
                       <c:if test="${b.boardNo eq i.boardNo && oneFile eq 0}">
                     <img src="/resources/upload/board/${i.filepath}">
                     <c:set var="oneFile" value="1" />
                       </c:if>
               </c:forEach>
                    </a>
                    <!-- <div class="gonggu-info">2인 공동구매</div> -->
                </div>
                <div class="posting-content popular">
                    <p class="posting-title">
                        <a href="/boardView.do?boardNo=${b.boardNo }">${b.boardName }
                        </a>
                    </p>
                    <div class="posting-price-box">
                        <!-- <p class="price-through">70,000원</p> -->
                        <div class="board-date-box">
                            <span class="material-symbols-outlined">calendar_month</span>
                            <div class="board-start-date">2023-04-04</div>
                            <div class="board-wave"> ~ </div>
                            <div class="board-end-date">2023-04-10</div>
                        </div>
                        <div class="sail-box popular board-seller-profile-box">
                            <div class="sail-box-popular">
                                <div class="board-seller-profile">
                                   <img src="/resources/upload/member/moongs.png">
                                </div>
                                <div class="board-seller-id">뭉산오렌지</div>
                            </div>
                            <div class="board-view-count">
                                <!-- <div class="material-symbols-outlined star-rate">star</div> -->
                                <div class="rating-average">조회수</div>
                                <div class="review-count">1,551</div>
                            </div>
                        </div>
                    </div>
                    <div class="posting-detail">
                        <div class="posting-icon">
                        </div>
                        <div class="posting-info">
                            <div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
      </c:forEach>
            
            
            
            
            
            
            <div class="posting-item popular board-item">
                <div class="posting-img popular">
                    <a href="#">
                        <img src="/resources/img/board/pizza.jpeg" />
                    </a>
                    <!-- <div class="gonggu-info">2인 공동구매</div> -->
                </div>
                <div class="posting-content popular">
                    <p class="posting-title">
                        <a href="#">
                            [우주인 피자] 허니 갈릭 페퍼로니 냉동 종이포장 공동구매 폼
                        </a>
                    </p>
                    <div class="posting-price-box">
                        <!-- <p class="price-through">70,000원</p> -->
                        <div class="board-date-box">
                            <span class="material-symbols-outlined">calendar_month</span>
                            <div class="board-start-date">2023-04-04</div>
                            <div class="board-wave"> ~ </div>
                            <div class="board-end-date">2023-04-10</div>
                        </div>
                        <div class="sail-box popular board-seller-profile-box">
                            <div class="sail-box-popular">
                                <div class="board-seller-profile">
                                    <img src="/resources/upload/member/common/moongs.png">
                                </div>
                                <div class="board-seller-id">뭉산오렌지</div>
                            </div>
                            <div class="board-view-count">
                                <!-- <div class="material-symbols-outlined star-rate">star</div> -->
                                <div class="rating-average">조회수</div>
                                <div class="review-count">1,551</div>
                            </div>
                        </div>
                    </div>
                    <div class="posting-detail">
                        <div class="posting-icon">
                        </div>
                        <div class="posting-info">
                            <div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="posting-item popular board-item">
                <div class="posting-img popular">
                    <a href="#">
                        <img src="/resources/img/board/pizza.jpeg" />
                    </a>
                    <!-- <div class="gonggu-info">2인 공동구매</div> -->
                </div>
                <div class="posting-content popular">
                    <p class="posting-title">
                        <a href="#">
                            [우주인 피자] 허니 갈릭 페퍼로니 냉동 종이포장 공동구매 폼
                        </a>
                    </p>
                    <div class="posting-price-box">
                        <!-- <p class="price-through">70,000원</p> -->
                        <div class="board-date-box">
                            <span class="material-symbols-outlined">calendar_month</span>
                            <div class="board-start-date">2023-04-04</div>
                            <div class="board-wave"> ~ </div>
                            <div class="board-end-date">2023-04-10</div>
                        </div>
                        <div class="sail-box popular board-seller-profile-box">
                            <div class="sail-box-popular">
                                <div class="board-seller-profile">
                                    <img src="/resources/upload/member/common/moongs.png">
                                </div>
                                <div class="board-seller-id">뭉산오렌지</div>
                            </div>
                            <div class="board-view-count">
                                <!-- <div class="material-symbols-outlined star-rate">star</div> -->
                                <div class="rating-average">조회수</div>
                                <div class="review-count">1,551</div>
                            </div>
                        </div>
                    </div>
                    <div class="posting-detail">
                        <div class="posting-icon">
                        </div>
                        <div class="posting-info">
                            <div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="posting-item popular board-item">
                <div class="posting-img popular">
                    <a href="#">
                        <img src="/resources/img/board/pizza.jpeg" />
                    </a>
                    <!-- <div class="gonggu-info">2인 공동구매</div> -->
                </div>
                <div class="posting-content popular">
                    <p class="posting-title">
                        <a href="#">
                            [우주인 피자] 허니 갈릭 페퍼로니 냉동 종이포장 공동구매 폼
                        </a>
                    </p>
                    <div class="posting-price-box">
                        <!-- <p class="price-through">70,000원</p> -->
                        <div class="board-date-box">
                            <span class="material-symbols-outlined">calendar_month</span>
                            <div class="board-start-date">2023-04-04</div>
                            <div class="board-wave"> ~ </div>
                            <div class="board-end-date">2023-04-10</div>
                        </div>
                        <div class="sail-box popular board-seller-profile-box">
                            <div class="sail-box-popular">
                                <div class="board-seller-profile">
                                    <img src="/resources/upload/member/common/moongs.png">
                                </div>
                                <div class="board-seller-id">뭉산오렌지</div>
                            </div>
                            <div class="board-view-count">
                                <!-- <div class="material-symbols-outlined star-rate">star</div> -->
                                <div class="rating-average">조회수</div>
                                <div class="review-count">1,551</div>
                            </div>
                        </div>
                    </div>
                    <div class="posting-detail">
                        <div class="posting-icon">
                        </div>
                        <div class="posting-info">
                            <div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="posting-item popular board-item">
                <div class="posting-img popular">
                    <a href="#">
                        <img src="/resources/img/board/pizza.jpeg" />
                    </a>
                    <!-- <div class="gonggu-info">2인 공동구매</div> -->
                </div>
                <div class="posting-content popular">
                    <p class="posting-title">
                        <a href="#">
                            [우주인 피자] 허니 갈릭 페퍼로니 냉동 종이포장 공동구매 폼
                        </a>
                    </p>
                    <div class="posting-price-box">
                        <!-- <p class="price-through">70,000원</p> -->
                        <div class="board-date-box">
                            <span class="material-symbols-outlined">calendar_month</span>
                            <div class="board-start-date">2023-04-04</div>
                            <div class="board-wave"> ~ </div>
                            <div class="board-end-date">2023-04-10</div>
                        </div>
                        <div class="sail-box popular board-seller-profile-box">
                            <div class="sail-box-popular">
                                <div class="board-seller-profile">
                                    <img src="/resources/upload/member/common/moongs.png">
                                </div>
                                <div class="board-seller-id">뭉산오렌지</div>
                            </div>
                            <div class="board-view-count">
                                <!-- <div class="material-symbols-outlined star-rate">star</div> -->
                                <div class="rating-average">조회수</div>
                                <div class="review-count">1,551</div>
                            </div>
                        </div>
                    </div>
                    <div class="posting-detail">
                        <div class="posting-icon">
                        </div>
                        <div class="posting-info">
                            <div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            
            
            



        </div>











        <div class="board-wrap-header">
            <h4>더보기 누르면 나오는 상품 리스트</h4>
            <!-- <div>
                <a href="#">
                    <div>더보기</div>
                    <span class="material-symbols-outlined">add_box</span>
                </a>
            </div> -->
        </div>
        <div class="board-product-wrap">
            <!-- 여여붙 상품 wrap -->
            <div class="posting-item popular board-item">
                <div class="posting-img popular">
                    <a href="#">
                        <img src="/resources/img/board/pizza.jpeg" />
                    </a>
                    <!-- <div class="gonggu-info">2인 공동구매</div> -->
                </div>
                <div class="posting-content popular">
                    <p class="posting-title">
                        <a href="#">
                            [우주인 피자] 허니 갈릭 페퍼로니 냉동 종이포장 공동구매 폼
                        </a>
                    </p>
                    <div class="posting-price-box">
                        <!-- <p class="price-through">70,000원</p> -->
                        <div class="board-date-box">
                            <span class="material-symbols-outlined">calendar_month</span>
                            <div class="board-start-date">2023-04-04</div>
                            <div class="board-wave"> ~ </div>
                            <div class="board-end-date">2023-04-10</div>
                        </div>
                        <div class="sail-box popular board-seller-profile-box">
                            <div class="sail-box-popular">
                                <div class="board-seller-profile">
                                    <img src="/resources/upload/member/common/moongs.png">
                                </div>
                                <div class="board-seller-id">뭉산오렌지</div>
                            </div>
                            <div class="board-view-count">
                                <!-- <div class="material-symbols-outlined star-rate">star</div> -->
                                <div class="rating-average">조회수</div>
                                <div class="review-count">1,551</div>
                            </div>
                        </div>
                    </div>
                    <div class="posting-detail">
                        <div class="posting-icon">
                        </div>
                        <div class="posting-info">
                            <div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="posting-item popular board-item">
                <div class="posting-img popular">
                    <a href="#">
                        <img src="/resources/img/board/pizza.jpeg" />
                    </a>
                    <!-- <div class="gonggu-info">2인 공동구매</div> -->
                </div>
                <div class="posting-content popular">
                    <p class="posting-title">
                        <a href="#">
                            [우주인 피자] 허니 갈릭 페퍼로니 냉동 종이포장 공동구매 폼
                        </a>
                    </p>
                    <div class="posting-price-box">
                        <!-- <p class="price-through">70,000원</p> -->
                        <div class="board-date-box">
                            <span class="material-symbols-outlined">calendar_month</span>
                            <div class="board-start-date">2023-04-04</div>
                            <div class="board-wave"> ~ </div>
                            <div class="board-end-date">2023-04-10</div>
                        </div>
                        <div class="sail-box popular board-seller-profile-box">
                            <div class="sail-box-popular">
                                <div class="board-seller-profile">
                                    <img src="/resources/upload/member/common/moongs.png">
                                </div>
                                <div class="board-seller-id">뭉산오렌지</div>
                            </div>
                            <div class="board-view-count">
                                <!-- <div class="material-symbols-outlined star-rate">star</div> -->
                                <div class="rating-average">조회수</div>
                                <div class="review-count">1,551</div>
                            </div>
                        </div>
                    </div>
                    <div class="posting-detail">
                        <div class="posting-icon">
                        </div>
                        <div class="posting-info">
                            <div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="posting-item popular board-item">
                <div class="posting-img popular">
                    <a href="#">
                        <img src="/resources/img/board/pizza.jpeg" />
                    </a>
                    <!-- <div class="gonggu-info">2인 공동구매</div> -->
                </div>
                <div class="posting-content popular">
                    <p class="posting-title">
                        <a href="#">
                            [우주인 피자] 허니 갈릭 페퍼로니 냉동 종이포장 공동구매 폼
                        </a>
                    </p>
                    <div class="posting-price-box">
                        <!-- <p class="price-through">70,000원</p> -->
                        <div class="board-date-box">
                            <span class="material-symbols-outlined">calendar_month</span>
                            <div class="board-start-date">2023-04-04</div>
                            <div class="board-wave"> ~ </div>
                            <div class="board-end-date">2023-04-10</div>
                        </div>
                        <div class="sail-box popular board-seller-profile-box">
                            <div class="sail-box-popular">
                                <div class="board-seller-profile">
                                    <img src="/resources/upload/member/common/moongs.png">
                                </div>
                                <div class="board-seller-id">뭉산오렌지</div>
                            </div>
                            <div class="board-view-count">
                                <!-- <div class="material-symbols-outlined star-rate">star</div> -->
                                <div class="rating-average">조회수</div>
                                <div class="review-count">1,551</div>
                            </div>
                        </div>
                    </div>
                    <div class="posting-detail">
                        <div class="posting-icon">
                        </div>
                        <div class="posting-info">
                            <div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="posting-item popular board-item">
                <div class="posting-img popular">
                    <a href="#">
                        <img src="/resources/img/board/pizza.jpeg" />
                    </a>
                    <!-- <div class="gonggu-info">2인 공동구매</div> -->
                </div>
                <div class="posting-content popular">
                    <p class="posting-title">
                        <a href="#">
                            [우주인 피자] 허니 갈릭 페퍼로니 냉동 종이포장 공동구매 폼
                        </a>
                    </p>
                    <div class="posting-price-box">
                        <!-- <p class="price-through">70,000원</p> -->
                        <div class="board-date-box">
                            <span class="material-symbols-outlined">calendar_month</span>
                            <div class="board-start-date">2023-04-04</div>
                            <div class="board-wave"> ~ </div>
                            <div class="board-end-date">2023-04-10</div>
                        </div>
                        <div class="sail-box popular board-seller-profile-box">
                            <div class="sail-box-popular">
                                <div class="board-seller-profile">
                                    <img src="/resources/upload/member/common/moongs.png">
                                </div>
                                <div class="board-seller-id">뭉산오렌지</div>
                            </div>
                            <div class="board-view-count">
                                <!-- <div class="material-symbols-outlined star-rate">star</div> -->
                                <div class="rating-average">조회수</div>
                                <div class="review-count">1,551</div>
                            </div>
                        </div>
                    </div>
                    <div class="posting-detail">
                        <div class="posting-icon">
                        </div>
                        <div class="posting-info">
                            <div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="posting-item popular board-item">
                <div class="posting-img popular">
                    <a href="#">
                        <img src="/resources/img/board/pizza.jpeg" />
                    </a>
                    <!-- <div class="gonggu-info">2인 공동구매</div> -->
                </div>
                <div class="posting-content popular">
                    <p class="posting-title">
                        <a href="#">
                            [우주인 피자] 허니 갈릭 페퍼로니 냉동 종이포장 공동구매 폼
                        </a>
                    </p>
                    <div class="posting-price-box">
                        <!-- <p class="price-through">70,000원</p> -->
                        <div class="board-date-box">
                            <span class="material-symbols-outlined">calendar_month</span>
                            <div class="board-start-date">2023-04-04</div>
                            <div class="board-wave"> ~ </div>
                            <div class="board-end-date">2023-04-10</div>
                        </div>
                        <div class="sail-box popular board-seller-profile-box">
                            <div class="sail-box-popular">
                                <div class="board-seller-profile">
                                    <img src="/resources/upload/member/common/moongs.png">
                                </div>
                                <div class="board-seller-id">뭉산오렌지</div>
                            </div>
                            <div class="board-view-count">
                                <!-- <div class="material-symbols-outlined star-rate">star</div> -->
                                <div class="rating-average">조회수</div>
                                <div class="review-count">1,551</div>
                            </div>
                        </div>
                    </div>
                    <div class="posting-detail">
                        <div class="posting-icon">
                        </div>
                        <div class="posting-info">
                            <div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="posting-item popular board-item">
                <div class="posting-img popular">
                    <a href="#">
                        <img src="/resources/img/board/pizza.jpeg" />
                    </a>
                    <!-- <div class="gonggu-info">2인 공동구매</div> -->
                </div>
                <div class="posting-content popular">
                    <p class="posting-title">
                        <a href="#">
                            [우주인 피자] 허니 갈릭 페퍼로니 냉동 종이포장 공동구매 폼
                        </a>
                    </p>
                    <div class="posting-price-box">
                        <!-- <p class="price-through">70,000원</p> -->
                        <div class="board-date-box">
                            <span class="material-symbols-outlined">calendar_month</span>
                            <div class="board-start-date">2023-04-04</div>
                            <div class="board-wave"> ~ </div>
                            <div class="board-end-date">2023-04-10</div>
                        </div>
                        <div class="sail-box popular board-seller-profile-box">
                            <div class="sail-box-popular">
                                <div class="board-seller-profile">
                                    <img src="/resources/upload/member/common/moongs.png">
                                </div>
                                <div class="board-seller-id">뭉산오렌지</div>
                            </div>
                            <div class="board-view-count">
                                <!-- <div class="material-symbols-outlined star-rate">star</div> -->
                                <div class="rating-average">조회수</div>
                                <div class="review-count">1,551</div>
                            </div>
                        </div>
                    </div>
                    <div class="posting-detail">
                        <div class="posting-icon">
                        </div>
                        <div class="posting-info">
                            <div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    

        
        <div class="pagination">
            <a href="javascript:void(0);" class="btn-pagi ctrl">처음으로</a>
            <a href="javascript:void(0);" class="btn-pagi ctrl">이전</a>
            <ul class="pagination-list">
                <li>
                    <a href="javascript:void(0);" class="btn-pagi page-active">1</a>
                </li>
                <li>
                    <a href="javascript:void(0);" class="btn-pagi">2</a>
                </li>
                <li>
                    <a href="javascript:void(0);" class="btn-pagi">3</a>
                </li>
                <li>
                    <a href="javascript:void(0);" class="btn-pagi">4</a>
                </li>
                <li>
                    <a href="javascript:void(0);" class="btn-pagi">5</a>
                </li>
            </ul>
            <a href="javascript:void(0);" class="btn-pagi ctrl">다음</a>
            <a href="javascript:void(0);" class="btn-pagi ctrl">끝으로</a>
        </div>

   </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />   


    <!-- 상품 js -->
    <script type="text/javascript" src="/resources/slick/slick.min.js"></script>
    <script src="/resources/js/product.js"></script>
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