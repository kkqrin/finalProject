<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- 상품 css -->
    <link rel="stylesheet" href="/resources/css/product/product.css"/>
    <link rel="stylesheet" href="/resources/slick/slick-theme.css"/>
    <link rel="stylesheet" href="/resources/slick/slick.css"/>
    <!-- 구글 아이콘 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <style>
        .material-symbols-outlined {
        	/* 구글 아이콘 (별점) */
            font-variation-settings:
            'FILL' 1
        }
        .slick-prev:before, .slick-next:before {
        	/* 슬릭 슬라이더 아이콘 */
            color: black;
        }
        .slick-prev.slick-disabled:before,
		.slick-next.slick-disabled:before
		{
			/* 슬릭 슬라이더 첫,마지막페이지 이전,다음 아이콘 숨김 */
    		/* opacity: .25; */
    		opacity: 0;
    		cursor: default;
		}
    </style>
        <style>
            #time-zone {
                padding: 50px;
                font-size: 50px;
                font-weight: 900;
            }
        </style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	
<div class="content-wrap">
    
    
    <h1>인기상품</h1>
    <div class="popular-product-wrap">
    <!-- 인기상품 wrap -->
        <div class="posting-item popular">
            <div class="posting-img popular">
                <img src="/resources/img/product/lactofit.jpg" />
                <div class="gonggu-info">2인 공동구매</div>
            </div>
            <div class="posting-content popular">
                <p class="posting-title">[3월 한정 파격특가][종근당건강] 락토핏 생유산균 골드(50포) 3통 (150일분) / 온가족 유산균</p>
                <div class="posting-price-box">
                    <p class="price-through">70,000원</p>
                    <div class="sail-box popular">
                        <div class="sail-box-popular">
                            <p class="sail-percent">62%</p>
                            <p class="price-sail">26,900원</p>
                        </div>
                        <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div>
                    </div>
                </div>
                <div class="posting-detail">
                    <div class="posting-icon">
                        <!-- <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div> -->
                        <!-- <div class="comment-div">
                            <span class="material-symbols-outlined">chat_bubble</span>
                            <span class="comment-count">3</span>
                        </div> -->
                    </div>
                    <div class="posting-info">
                        <div>
                            <!-- <span class="posting-info-box today-close">오늘마감</span>
                            <span class="posting-info-box">무료배송</span> -->
                        </div>
                        <!-- <span class="posting-volume">0개 구매</span> -->
                        <!-- <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div> -->
                    </div>
                </div>
            </div>
        </div>
        <div class="posting-item popular">
            <div class="posting-img popular">
                <img src="/resources/img/product/lactofit.jpg" />
                <div class="gonggu-info">2인 공동구매</div>
            </div>
            <div class="posting-content popular">
                <p class="posting-title">[3월 한정 파격특가][종근당건강] 락토핏 생유산균 골드(50포) 3통 (150일분) / 온가족 유산균</p>
                <div class="posting-price-box">
                    <p class="price-through">70,000원</p>
                    <div class="sail-box popular">
                        <div class="sail-box-popular">
                            <p class="sail-percent">62%</p>
                            <p class="price-sail">26,900원</p>
                        </div>
                        <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div>
                    </div>
                </div>
                <div class="posting-detail">
                    <div class="posting-icon">
                        <!-- <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div> -->
                        <!-- <div class="comment-div">
                            <span class="material-symbols-outlined">chat_bubble</span>
                            <span class="comment-count">3</span>
                        </div> -->
                    </div>
                    <div class="posting-info">
                        <div>
                            <!-- <span class="posting-info-box today-close">오늘마감</span>
                            <span class="posting-info-box">무료배송</span> -->
                        </div>
                        <!-- <span class="posting-volume">0개 구매</span> -->
                        <!-- <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div> -->
                    </div>
                </div>
            </div>
        </div>
        <div class="posting-item popular">
            <div class="posting-img popular">
                <img src="/resources/img/product/lactofit.jpg" />
                <div class="gonggu-info">2인 공동구매</div>
            </div>
            <div class="posting-content popular">
                <p class="posting-title">[3월 한정 파격특가][종근당건강] 락토핏 생유산균 골드(50포) 3통 (150일분) / 온가족 유산균</p>
                <div class="posting-price-box">
                    <p class="price-through">70,000원</p>
                    <div class="sail-box popular">
                        <div class="sail-box-popular">
                            <p class="sail-percent">62%</p>
                            <p class="price-sail">26,900원</p>
                        </div>
                        <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div>
                    </div>
                </div>
                <div class="posting-detail">
                    <div class="posting-icon">
                        <!-- <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div> -->
                        <!-- <div class="comment-div">
                            <span class="material-symbols-outlined">chat_bubble</span>
                            <span class="comment-count">3</span>
                        </div> -->
                    </div>
                    <div class="posting-info">
                        <div>
                            <!-- <span class="posting-info-box today-close">오늘마감</span>
                            <span class="posting-info-box">무료배송</span> -->
                        </div>
                        <!-- <span class="posting-volume">0개 구매</span> -->
                        <!-- <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div> -->
                    </div>
                </div>
            </div>
        </div>
        <div class="posting-item popular">
            <div class="posting-img popular">
                <img src="/resources/img/product/lactofit.jpg" />
                <div class="gonggu-info">2인 공동구매</div>
            </div>
            <div class="posting-content popular">
                <p class="posting-title">[3월 한정 파격특가][종근당건강] 락토핏 생유산균 골드(50포) 3통 (150일분) / 온가족 유산균</p>
                <div class="posting-price-box">
                    <p class="price-through">70,000원</p>
                    <div class="sail-box popular">
                        <div class="sail-box-popular">
                            <p class="sail-percent">62%</p>
                            <p class="price-sail">26,900원</p>
                        </div>
                        <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div>
                    </div>
                </div>
                <div class="posting-detail">
                    <div class="posting-icon">
                        <!-- <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div> -->
                        <!-- <div class="comment-div">
                            <span class="material-symbols-outlined">chat_bubble</span>
                            <span class="comment-count">3</span>
                        </div> -->
                    </div>
                    <div class="posting-info">
                        <div>
                            <!-- <span class="posting-info-box today-close">오늘마감</span>
                            <span class="posting-info-box">무료배송</span> -->
                        </div>
                        <!-- <span class="posting-volume">0개 구매</span> -->
                        <!-- <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div> -->
                    </div>
                </div>
            </div>
        </div>
        <div class="posting-item popular">
            <div class="posting-img popular">
                <img src="/resources/img/product/lactofit.jpg" />
                <div class="gonggu-info">2인 공동구매</div>
            </div>
            <div class="posting-content popular">
                <p class="posting-title">[3월 한정 파격특가][종근당건강] 락토핏 생유산균 골드(50포) 3통 (150일분) / 온가족 유산균</p>
                <div class="posting-price-box">
                    <p class="price-through">70,000원</p>
                    <div class="sail-box popular">
                        <div class="sail-box-popular">
                            <p class="sail-percent">62%</p>
                            <p class="price-sail">26,900원</p>
                        </div>
                        <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div>
                    </div>
                </div>
                <div class="posting-detail">
                    <div class="posting-icon">
                        <!-- <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div> -->
                        <!-- <div class="comment-div">
                            <span class="material-symbols-outlined">chat_bubble</span>
                            <span class="comment-count">3</span>
                        </div> -->
                    </div>
                    <div class="posting-info">
                        <div>
                            <!-- <span class="posting-info-box today-close">오늘마감</span>
                            <span class="posting-info-box">무료배송</span> -->
                        </div>
                        <!-- <span class="posting-volume">0개 구매</span> -->
                        <!-- <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div> -->
                    </div>
                </div>
            </div>
        </div>
        <div class="posting-item popular">
            <div class="posting-img popular">
                <img src="/resources/img/product/lactofit.jpg" />
                <div class="gonggu-info">2인 공동구매</div>
            </div>
            <div class="posting-content popular">
                <p class="posting-title">[3월 한정 파격특가][종근당건강] 락토핏 생유산균 골드(50포) 3통 (150일분) / 온가족 유산균</p>
                <div class="posting-price-box">
                    <p class="price-through">70,000원</p>
                    <div class="sail-box popular">
                        <div class="sail-box-popular">
                            <p class="sail-percent">62%</p>
                            <p class="price-sail">26,900원</p>
                        </div>
                        <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div>
                    </div>
                </div>
                <div class="posting-detail">
                    <div class="posting-icon">
                        <!-- <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div> -->
                        <!-- <div class="comment-div">
                            <span class="material-symbols-outlined">chat_bubble</span>
                            <span class="comment-count">3</span>
                        </div> -->
                    </div>
                    <div class="posting-info">
                        <div>
                            <!-- <span class="posting-info-box today-close">오늘마감</span>
                            <span class="posting-info-box">무료배송</span> -->
                        </div>
                        <!-- <span class="posting-volume">0개 구매</span> -->
                        <!-- <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div> -->
                    </div>
                </div>
            </div>
        </div>
        <div class="posting-item popular">
            <div class="posting-img popular">
                <img src="/resources/img/product/lactofit.jpg" />
                <div class="gonggu-info">2인 공동구매</div>
            </div>
            <div class="posting-content popular">
                <p class="posting-title">[3월 한정 파격특가][종근당건강] 락토핏 생유산균 골드(50포) 3통 (150일분) / 온가족 유산균</p>
                <div class="posting-price-box">
                    <p class="price-through">70,000원</p>
                    <div class="sail-box popular">
                        <div class="sail-box-popular">
                            <p class="sail-percent">62%</p>
                            <p class="price-sail">26,900원</p>
                        </div>
                        <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div>
                    </div>
                </div>
                <div class="posting-detail">
                    <div class="posting-icon">
                        <!-- <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div> -->
                        <!-- <div class="comment-div">
                            <span class="material-symbols-outlined">chat_bubble</span>
                            <span class="comment-count">3</span>
                        </div> -->
                    </div>
                    <div class="posting-info">
                        <div>
                            <!-- <span class="posting-info-box today-close">오늘마감</span>
                            <span class="posting-info-box">무료배송</span> -->
                        </div>
                        <!-- <span class="posting-volume">0개 구매</span> -->
                        <!-- <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div> -->
                    </div>
                </div>
            </div>
        </div>
        <div class="posting-item popular">
            <div class="posting-img popular">
                <img src="/resources/img/product/lactofit.jpg" />
                <div class="gonggu-info">2인 공동구매</div>
            </div>
            <div class="posting-content popular">
                <p class="posting-title">[3월 한정 파격특가][종근당건강] 락토핏 생유산균 골드(50포) 3통 (150일분) / 온가족 유산균</p>
                <div class="posting-price-box">
                    <p class="price-through">70,000원</p>
                    <div class="sail-box popular">
                        <div class="sail-box-popular">
                            <p class="sail-percent">62%</p>
                            <p class="price-sail">26,900원</p>
                        </div>
                        <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div>
                    </div>
                </div>
                <div class="posting-detail">
                    <div class="posting-icon">
                        <!-- <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div> -->
                        <!-- <div class="comment-div">
                            <span class="material-symbols-outlined">chat_bubble</span>
                            <span class="comment-count">3</span>
                        </div> -->
                    </div>
                    <div class="posting-info">
                        <div>
                            <!-- <span class="posting-info-box today-close">오늘마감</span>
                            <span class="posting-info-box">무료배송</span> -->
                        </div>
                        <!-- <span class="posting-volume">0개 구매</span> -->
                        <!-- <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div> -->
                    </div>
                </div>
            </div>
        </div>
        <div class="posting-item popular">
            <div class="posting-img popular">
                <img src="/resources/img/product/lactofit.jpg" />
                <div class="gonggu-info">2인 공동구매</div>
            </div>
            <div class="posting-content popular">
                <p class="posting-title">[3월 한정 파격특가][종근당건강] 락토핏 생유산균 골드(50포) 3통 (150일분) / 온가족 유산균</p>
                <div class="posting-price-box">
                    <p class="price-through">70,000원</p>
                    <div class="sail-box popular">
                        <div class="sail-box-popular">
                            <p class="sail-percent">62%</p>
                            <p class="price-sail">26,900원</p>
                        </div>
                        <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div>
                    </div>
                </div>
                <div class="posting-detail">
                    <div class="posting-icon">
                        <!-- <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div> -->
                        <!-- <div class="comment-div">
                            <span class="material-symbols-outlined">chat_bubble</span>
                            <span class="comment-count">3</span>
                        </div> -->
                    </div>
                    <div class="posting-info">
                        <div>
                            <!-- <span class="posting-info-box today-close">오늘마감</span>
                            <span class="posting-info-box">무료배송</span> -->
                        </div>
                        <!-- <span class="posting-volume">0개 구매</span> -->
                        <!-- <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div> -->
                    </div>
                </div>
            </div>
        </div>
        <div class="posting-item popular">
            <div class="posting-img popular">
                <img src="/resources/img/product/lactofit.jpg" />
                <div class="gonggu-info">2인 공동구매</div>
            </div>
            <div class="posting-content popular">
                <p class="posting-title">[3월 한정 파격특가][종근당건강] 락토핏 생유산균 골드(50포) 3통 (150일분) / 온가족 유산균</p>
                <div class="posting-price-box">
                    <p class="price-through">70,000원</p>
                    <div class="sail-box popular">
                        <div class="sail-box-popular">
                            <p class="sail-percent">62%</p>
                            <p class="price-sail">26,900원</p>
                        </div>
                        <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div>
                    </div>
                </div>
                <div class="posting-detail">
                    <div class="posting-icon">
                        <!-- <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div> -->
                        <!-- <div class="comment-div">
                            <span class="material-symbols-outlined">chat_bubble</span>
                            <span class="comment-count">3</span>
                        </div> -->
                    </div>
                    <div class="posting-info">
                        <div>
                            <!-- <span class="posting-info-box today-close">오늘마감</span>
                            <span class="posting-info-box">무료배송</span> -->
                        </div>
                        <!-- <span class="posting-volume">0개 구매</span> -->
                        <!-- <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div> -->
                    </div>
                </div>
            </div>
        </div>
        
        


        <div class="posting-item popular">
            전체보기
        </div>
    </div>






    <h1>핫딜</h1>
    <div class="product-wrap hotdeal">
        <!-- 핫딜 상품 wrap -->
        <div class="posting-item">
            <div class="hotdeal-info">
                <div class="hotdeal-title">마감 임박</div>
                <div class="hotdeal-comment">오늘 종료되는 공동구매 딜</div>
                <div class="hotdeal-time-box">
                    <div class="material-symbols-outlined" style="font-variation-settings:'FILL' 0">schedule</div>
                    <div class="hotdeal-time">
                        <span class="hours"></span>
                        <span class="col">:</span>
                        <span class="minutes"></span>
                        <span class="col">:</span>
                        <span class="seconds"></span>
                    </div>
                </div>
                <div class="hotdeal-comment">망설이면 늦어요!</div>
            </div>
        </div>
        <div class="posting-item hotdeal">
            <div class="posting-img hotdeal">
                <img src="/resources/img/product/korean-melon.jpg" />
                <div class="gonggu-info">2인 공동구매</div>
                <div class="end-hotdeal">
                    판매시간이 종료되었습니다.
                </div>
            </div>
            <div class="posting-content">
                <p class="posting-title">[3월 한정 파격특가][종근당건강] 락토핏 생유산균 골드(50포) 3통 (150일분) / 온가족 유산균</p>
                <div class="posting-price-box">
                    <p class="price-through">70,000원</p>
                    <div class="sail-box">
                        <p class="sail-percent">62%</p>
                        <p class="price-sail">26,900원</p>
                    </div>
                </div>
                <div class="posting-detail">
                    <div class="posting-icon">
                        <!-- <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div> -->
                        <!-- <div class="comment-div">
                            <span class="material-symbols-outlined">chat_bubble</span>
                            <span class="comment-count">3</span>
                        </div> -->
                    </div>
                    <div class="posting-info">
                        <div>
                            <span class="posting-info-box today-close">오늘마감</span>
                            <span class="posting-info-box">무료배송</span>
                        </div>
                        <!-- <span class="posting-volume">0개 구매</span> -->
                        <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>








    <h1>전체</h1>
    <div class="product-wrap">
    <!-- 전체 상품 wrap -->
        <div class="posting-item">
            <div class="posting-img">
                <img src="/resources/img/product/lactofit.jpg" />
                <div class="gonggu-info">2인 공동구매</div>
            </div>
            <div class="posting-content">
                <p class="posting-title">[3월 한정 파격특가][종근당건강] 락토핏 생유산균 골드(50포) 3통 (150일분) / 온가족 유산균</p>
                <div class="posting-price-box">
                    <p class="price-through">70,000원</p>
                    <div class="sail-box">
                        <p class="sail-percent">62%</p>
                        <p class="price-sail">26,900원</p>
                    </div>
                </div>
                <div class="posting-detail">
                    <div class="posting-icon">
                        <!-- <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div> -->
                        <!-- <div class="comment-div">
                            <span class="material-symbols-outlined">chat_bubble</span>
                            <span class="comment-count">3</span>
                        </div> -->
                    </div>
                    <div class="posting-info">
                        <div>
                            <!-- <span class="posting-info-box today-close">오늘마감</span> -->
                            <span class="posting-info-box">무료배송</span>
                        </div>
                        <!-- <span class="posting-volume">0개 구매</span> -->
                        <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="posting-item">
            <div class="posting-img">
                <img src="/resources/img/product/cleansing_foam.jpeg" />
                <div class="gonggu-info">2인 공동구매</div>
            </div>
            <div class="posting-content">
                <p class="posting-title">[리얼베리어] 크림 클렌징 폼 </p>
                <!-- 120ml 1+1 기획세트 -->
                <div class="posting-price-box">
                    <p class="price-through">32,000원</p>
                    <div class="sail-box">
                        <p class="sail-percent">69%</p>
                        <p class="price-sail">9,900원</p>
                    </div>
                </div>
                <div class="posting-detail">
                    <div class="posting-icon">
                        <!-- <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div> -->
                        <!-- <div class="comment-div">
                            <span class="material-symbols-outlined">chat_bubble</span>
                            <span class="comment-count">3</span>
                        </div> -->
                    </div>
                    <div class="posting-info">
                        <div>
                            <span class="posting-info-box today-close">오늘마감</span>
                            <span class="posting-info-box">무료배송</span>
                        </div>
                        <!-- <span class="posting-volume">0개 구매</span> -->
                        <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="posting-item">
            <div class="posting-img">
                <img src="/resources/img/product/lactofit.jpg" />
                <div class="gonggu-info">2인 공동구매</div>
            </div>
            <div class="posting-content">
                <p class="posting-title">[3월 한정 파격특가][종근당건강] 락토핏 생유산균 골드(50포) 3통 (150일분) / 온가족 유산균</p>
                <div class="posting-price-box">
                    <p class="price-through">70,000원</p>
                    <div class="sail-box">
                        <p class="sail-percent">62%</p>
                        <p class="price-sail">26,900원</p>
                    </div>
                </div>
                <div class="posting-detail">
                    <div class="posting-icon">
                        <!-- <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div> -->
                        <!-- <div class="comment-div">
                            <span class="material-symbols-outlined">chat_bubble</span>
                            <span class="comment-count">3</span>
                        </div> -->
                    </div>
                    <div class="posting-info">
                        <div>
                            <span class="posting-info-box today-close">오늘마감</span>
                            <span class="posting-info-box">무료배송</span>
                        </div>
                        <!-- <span class="posting-volume">0개 구매</span> -->
                        <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="posting-item">
            <div class="posting-img">
                <img src="/resources/img/product/lactofit.jpg" />
                <div class="gonggu-info">2인 공동구매</div>
            </div>
            <div class="posting-content">
                <p class="posting-title">[3월 한정 파격특가][종근당건강] 락토핏 생유산균 골드(50포) 3통 (150일분) / 온가족 유산균</p>
                <div class="posting-price-box">
                    <p class="price-through">70,000원</p>
                    <div class="sail-box">
                        <p class="sail-percent">62%</p>
                        <p class="price-sail">26,900원</p>
                    </div>
                </div>
                <div class="posting-detail">
                    <div class="posting-icon">
                        <!-- <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div> -->
                        <!-- <div class="comment-div">
                            <span class="material-symbols-outlined">chat_bubble</span>
                            <span class="comment-count">3</span>
                        </div> -->
                    </div>
                    <div class="posting-info">
                        <div>
                            <span class="posting-info-box today-close">오늘마감</span>
                            <span class="posting-info-box">무료배송</span>
                        </div>
                        <!-- <span class="posting-volume">0개 구매</span> -->
                        <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="posting-item">
            <div class="posting-img">
                <img src="/resources/img/product/lactofit.jpg" />
                <div class="gonggu-info">2인 공동구매</div>
            </div>
            <div class="posting-content">
                <p class="posting-title">[3월 한정 파격특가][종근당건강] 락토핏 생유산균 골드(50포) 3통 (150일분) / 온가족 유산균</p>
                <div class="posting-price-box">
                    <p class="price-through">70,000원</p>
                    <div class="sail-box">
                        <p class="sail-percent">62%</p>
                        <p class="price-sail">26,900원</p>
                    </div>
                </div>
                <div class="posting-detail">
                    <div class="posting-icon">
                        <!-- <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div> -->
                        <!-- <div class="comment-div">
                            <span class="material-symbols-outlined">chat_bubble</span>
                            <span class="comment-count">3</span>
                        </div> -->
                    </div>
                    <div class="posting-info">
                        <div>
                            <span class="posting-info-box today-close">오늘마감</span>
                            <span class="posting-info-box">무료배송</span>
                        </div>
                        <!-- <span class="posting-volume">0개 구매</span> -->
                        <div class="star-rating">
                            <div class="material-symbols-outlined">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
    <!-- 상품 js -->
    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="/resources/slick/slick.min.js"></script>
    <script src="/resources/js/product.js"></script>

    <script>
        $('.popular-product-wrap').slick({
            dots: true,
            infinite: false,
            speed: 800,
            slidesToShow: 4,
            slidesToScroll: 4,
            responsive: [
                {
                breakpoint: 1024,
                settings: {
                    slidesToShow: 3,
                    slidesToScroll: 3,
                    infinite: true,
                    dots: true
                }
                },
                {
                breakpoint: 600,
                settings: {
                    slidesToShow: 2,
                    slidesToScroll: 2
                }
                },
                {
                breakpoint: 480,
                settings: {
                    slidesToShow: 1,
                    slidesToScroll: 1
                }
                }
            ]
        });
    </script>
</body>
	
</html>