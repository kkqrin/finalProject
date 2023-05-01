    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뭉쳐야산다</title>
    <!-- 웹페이지 로고 -->
    <link rel="shortcut icon" href="/resources/upload/member/free-icon-tangerine-1450252.png" />
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

        #time-zone {
            padding: 50px;
            font-size: 50px;
            font-weight: 900;
        }

        @font-face {
        font-family: 'SEBANG_Gothic_Bold';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2104@1.0/SEBANG_Gothic_Bold.woff') format('woff');
        font-weight: normal;
        font-style: normal;
        }

        
        .bookmark {
        width: 50px;
        height: 70px;
        line-height: 70px;
        position: relative;
        /* background-color: #f88000; */
        background: #f12711;  /* fallback for old browsers */
        background: -webkit-linear-gradient(to top, #f5af19, #f12711);  /* Chrome 10-25, Safari 5.1-6 */
        background: linear-gradient(to top, #f5af19, #f12711); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

        color: #fffff6;
        margin-left: 15px;
        border-radius: 5%;
        box-shadow: 1px 2px 6px 0px #9f9f9f;
        font-family: 'SEBANG_Gothic_Bold';
        font-weight: 100;
        top: -5px;
        }

        .bookmark::before {
        content: "";
        position: absolute;
        bottom: -23px;
        left: 0;
        width: 0;
        height: 0;
        border-style: solid;
        border-width: 0 25px 25px 25px;
        border-color: #f5af19 #f5af19 transparent #f5af19;
        }

        /* wrap 타이틀 */
        .wrap-title{
            text-align: center;
            margin-top: 100px;
            margin-bottom: 30px;
        }
        .wrap-sub-title{
            text-align: center;
            font-weight: 400;
            font-size: 16px;
            margin-bottom: 30px;
        }

        /*메인 slick 관련*/
        .slick-box .addZone{display: flex;justify-content: center;}
        .slick-box .addZone img{margin:0 auto;}
        #mainSlick{max-height: 370px;padding-top: 120px;overflow:hidden;}
        #mainSlick .slick-prev:before,#mainSlick .slick-next:before{display: none;}
        #mainSlick .slick-dots{opacity: 0.3;position: absolute;top: 220px;}
        .add1{background-color: rgb(249,244,241);}
        .add3{background-color: rgb(226,209,175);}

        /* 롱배너 */
        .long-banner{
            margin: 200px 0px;
        }
        .long-banner>img{
            width: 1200px;
        }
    </style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <c:if test="${not empty sessionScope.m }">
        <jsp:include page="/WEB-INF/views/common/stickyRight.jsp" />
    </c:if>
    
<div id="mainSlick">
	<div class="slick-box">
			<div class="addZone add1">
				<img src="/resources/img/common/add-banner1.png">
			</div>
			<div class="addZone add2">
				<a href="#"><img src="/resources/img/common/add-banner2.png"></a>
			</div>
			<div class="addZone add3">
				<a href="#"><img src="/resources/img/common/add-banner3.png"></a>
			</div>
	</div>
</div>

<div class="main-content-wrap">

    <!-- 임시 인기상품리스트, 밑에 있는 wrap으로 수정예정 -->
    <!-- <div class="popular-product-wrap">
       <c:forEach items="${productList }" var="p">
        <div class="posting-item popular">
            <div class="posting-img popular">
                <a href="/productView.do?productNo=${p.productNo }">
           		<c:forEach var="pf" items="${p.fileList}" begin="0" end="0" step="1">
                    <img src="/resources/upload/product/${pf.filepath }" />
                </c:forEach>
                </a>
                <div class="gonggu-info">2인 공동구매</div>
            </div>
            <div class="posting-content popular">
                <p class="posting-title">
                    <a href="/productView.do?productNo=${p.productNo }">
                        [3월 한정 파격특가][종근당건강] 락토핏 생유산균 골드(50포) 3통 (150일분) / 온가족 유산균
                    </a>
                </p>
                <div class="posting-price-box">
                    <p class="price-through">70,000원</p>
                    <div class="sail-box popular">
                        <div class="sail-box-popular">
                            <p class="sail-percent">62%</p>
                            <p class="price-sail">26,900원</p>
                        </div>
                        <div class="star-rating">
                            <div class="material-symbols-outlined star-rate">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
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
        <div class="posting-item popular">
            <div class="posting-img popular">
                <a href="#">
                    <img src="/resources/img/product/lactofit.jpg" />
                </a>
                <div class="gonggu-info">2인 공동구매</div>
            </div>
            <div class="posting-content popular">
                <p class="posting-title">
                    <a href="#">
                        [3월 한정 파격특가][종근당건강] 락토핏 생유산균 골드(50포) 3통 (150일분) / 온가족 유산균
                    </a>
                </p>
                <div class="posting-price-box">
                    <p class="price-through">70,000원</p>
                    <div class="sail-box popular">
                        <div class="sail-box-popular">
                            <p class="sail-percent">62%</p>
                            <p class="price-sail">26,900원</p>
                        </div>
                        <div class="star-rating">
                            <div class="material-symbols-outlined star-rate">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
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


        <div class="posting-item popular all-product">
            전체보기
        </div>
    </div> -->





    

    <h3 class="wrap-title"># 인기 상품 ⭐</h3>
    <div class="popular-product-wrap">
        <!-- 인기상품 wrap -->
        <c:forEach items="${bestProductList }" var="p">
            <div class="posting-item popular">
                <div class="posting-img popular">
                    <a href="/productView.do?productNo=${p.productNo }">
                        <img src="/resources/upload/product/${p.thumbnail }" />
                    </a>
                    <div class="gonggu-info">${p.gongguNumber}인 공동구매</div>
                </div>
                <div class="posting-content popular">
                    <p class="posting-title">
                        <a href="/productView.do?productNo=${p.productNo }">
                            ${p.productName}
                        </a>
                    </p>
                    <div class="posting-price-box">
                        <p class="price-through"><fmt:formatNumber value="${p.productPrice}"/> 원</p>
                        <div class="sail-box popular">
                            <div class="sail-box-popular">
                                <p class="sail-percent">${p.productDiscount}%</p>
                                <p class="price-sail"><fmt:formatNumber value="${(Math.floor(p.productPrice*(100 - p.productDiscount)/1000)*10)}"/>원</p>
                            </div>
                            <div class="star-rating">
                                <div class="material-symbols-outlined star-rate">star</div>
                                <div class="rating-average">4.8</div>
                                <div class="review-count">(152)</div>
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

            <div class="posting-item popular all-product">
                <a href="/bestProductList.do">전체보기</a>
            </div>
    </div>









    <h3 class="wrap-title"># 핫딜 🔥</h3>
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
                <a href="#">
                    <img src="/resources/img/product/korean-melon.jpg" />
                </a>
                <div class="gonggu-info">2인 공동구매</div>
                <div class="end-hotdeal shutdown">
                    판매시간이 종료되었습니다.
                </div>
            </div>
            <div class="posting-content">
                <p class="posting-title">
                    <a href="#">
                        [3월 한정 파격특가][종근당건강] 락토핏 생유산균 골드(50포) 3통 (150일분) / 온가족 유산균
                    </a>
                </p>
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
                            <div class="material-symbols-outlined star-rate">star</div>
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
                            <div class="material-symbols-outlined star-rate">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>


    <!-- 롱배너 -->
    <div class="long-banner">
        <img src="/resources/img/common/long_banner1.jpg">
    </div>
        



    <h3 class="wrap-title" style="margin-bottom: 0px;"># 짝을 찾아라 👨🏻‍🤝‍👨🏻</h3>
    <h5 class="wrap-sub-title">둘이서 진행 가능한 공동구매 상품이에요</h5>
    <div class="popular-product-wrap">
        <!-- 인기상품 wrap -->
        <c:forEach items="${gongguTwoList }" var="p">
            <div class="posting-item popular">
                <div class="posting-img popular">
                    <a href="/productView.do?productNo=${p.productNo }">
                        <img src="/resources/upload/product/${p.thumbnail }" />
                    </a>
                    <div class="gonggu-info">${p.gongguNumber}인 공동구매</div>
                </div>
                <div class="posting-content popular">
                    <p class="posting-title">
                        <a href="/productView.do?productNo=${p.productNo }">
                            ${p.productName}
                        </a>
                    </p>
                    <div class="posting-price-box">
                        <p class="price-through"><fmt:formatNumber value="${p.productPrice}"/> 원</p>
                        <div class="sail-box popular">
                            <div class="sail-box-popular">
                                <p class="sail-percent">${p.productDiscount}%</p>
                                <p class="price-sail"><fmt:formatNumber value="${(Math.floor(p.productPrice*(100 - p.productDiscount)/1000)*10)}"/>원</p>
                            </div>
                            <div class="star-rating">
                                <div class="material-symbols-outlined star-rate">star</div>
                                <div class="rating-average">4.8</div>
                                <div class="review-count">(152)</div>
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

            <!-- <div class="posting-item popular all-product">
                <a href="/bestProductList.do">전체보기</a>
            </div> -->
    </div>







    <h3 class="wrap-title"># 품절 임박 ⏰</h3>
    <div class="product-wrap soldout">
        <!-- <div class="posting-item soldout">
            <div class="hotdeal-info">
                <div class="hotdeal-title">재고가 얼마 남지 않았어요</div>
                <div class="hotdeal-comment">품절 임박</div>
                <div class="hotdeal-comment">서둘러 구매하세요!</div>
            </div>
        </div> -->

        <c:forEach items="${soldOutList }" var="p">
            <div class="posting-item soldout">
                <div class="posting-img soldout">
					<a href="/productView.do?productNo=${p.productNo}">
						<img src="/resources/upload/product/${p.thumbnail }" />
					</a>
                    <div class="gonggu-info">${p.gongguNumber}인 공동구매</div>
                    <div class="end-hotdeal soldout color-v06">
                        <div class="bookmark">
                            ${p.productEa}개
                            <!-- 품절임박 -->
                        </div>
                    </div>
                    
                </div>
                <div class="posting-content">
                    <p class="posting-title">
						<a href="/productView.do?productNo=${p.productNo}">
							${p.productName}
						</a>
                    </p>
					<div class="posting-price-box">
						<p class="price-through"><fmt:formatNumber value="${p.productPrice }"/>원</p>
						<div class="sail-box">
							<p class="sail-percent">${p.productDiscount}%</p>
							<p class="price-sail"><fmt:formatNumber value="${(Math.floor(p.productPrice*(100 - p.productDiscount)/1000)*10)}"/>원</p>
						</div>
					</div>
                    <div class="posting-detail">
                        <div class="posting-icon">
                        </div>
                        <div class="posting-info">
                            <div>
                                <span class="posting-info-box today-close">오늘마감</span>
                                <span class="posting-info-box">무료배송</span>
                            </div>
                            <div class="star-rating">
                                <div class="material-symbols-outlined star-rate">star</div>
                                <div class="rating-average">4.8</div>
                                <div class="review-count">(152)</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

    </div>









    <!-- 롱배너 -->
    <div class="long-banner">
        <img src="/resources/img/common/long_banner2.jpg">
    </div>





    <h3 class="wrap-title" style="margin-bottom: 0px;"># 다같이 뭉쳐볼까요 🤜🤛</h3>
    <h5 class="wrap-sub-title">많이 모일수록 혜택이 쏟아져요!</h5>
    <div class="popular-product-wrap">
        <!-- 인기상품 wrap -->
        <c:forEach items="${gongguFiveList }" var="p">
            <div class="posting-item popular">
                <div class="posting-img popular">
                    <a href="/productView.do?productNo=${p.productNo }">
                        <img src="/resources/upload/product/${p.thumbnail }" />
                    </a>
                    <div class="gonggu-info">${p.gongguNumber}인 공동구매</div>
                </div>
                <div class="posting-content popular">
                    <p class="posting-title">
                        <a href="/productView.do?productNo=${p.productNo }">
                            ${p.productName}
                        </a>
                    </p>
                    <div class="posting-price-box">
                        <p class="price-through"><fmt:formatNumber value="${p.productPrice}"/> 원</p>
                        <div class="sail-box popular">
                            <div class="sail-box-popular">
                                <p class="sail-percent">${p.productDiscount}%</p>
                                <p class="price-sail"><fmt:formatNumber value="${(Math.floor(p.productPrice*(100 - p.productDiscount)/1000)*10)}"/>원</p>
                            </div>
                            <div class="star-rating">
                                <div class="material-symbols-outlined star-rate">star</div>
                                <div class="rating-average">4.8</div>
                                <div class="review-count">(152)</div>
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

            <!-- <div class="posting-item popular all-product">
                <a href="/bestProductList.do">전체보기</a>
            </div> -->
    </div>





    <h3 class="wrap-title"># 할인률 높은 상품 ✨</h3>
    <div class="product-wrap highsale">
        <!-- <div class="posting-item highsale">
            <div class="hotdeal-info">
                <div class="hotdeal-title">지금이 가장 저렴해요</div>
                <div class="hotdeal-comment">높은 할인률 상품을 만나보세요!</div>
                <div class="hotdeal-comment">이 가격 놓치지마세요!</div>
            </div>
        </div> -->

        <c:forEach items="${highSaleList }" var="p">
            <div class="posting-item highsale">
                <div class="posting-img highsale">
					<a href="/productView.do?productNo=${p.productNo}">
						<img src="/resources/upload/product/${p.thumbnail }" />
					</a>
                    <div class="gonggu-info">${p.gongguNumber}인 공동구매</div>
                    <div class="end-hotdeal highsale color-v06">
                        <div class="bookmark">
                            ${p.productDiscount}%
                            <!-- SALE -->
                        </div>
                    </div>
                </div>
                <div class="posting-content">
                    <p class="posting-title">
						<a href="/productView.do?productNo=${p.productNo}">
							${p.productName}
						</a>
                    </p>
					<div class="posting-price-box">
						<p class="price-through"><fmt:formatNumber value="${p.productPrice }"/>원</p>
						<div class="sail-box">
							<p class="sail-percent">${p.productDiscount}%</p>
							<p class="price-sail"><fmt:formatNumber value="${(Math.floor(p.productPrice*(100 - p.productDiscount)/1000)*10)}"/>원</p>
						</div>
					</div>
                    <div class="posting-detail">
                        <div class="posting-icon">
                        </div>
                        <div class="posting-info">
                            <div>
                                <span class="posting-info-box today-close">오늘마감</span>
                                <span class="posting-info-box">무료배송</span>
                            </div>
                            <div class="star-rating">
                                <div class="material-symbols-outlined star-rate">star</div>
                                <div class="rating-average">4.8</div>
                                <div class="review-count">(152)</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>

    </div>















    <h3 class="wrap-title" style="margin-bottom: 0px;"># 오늘 저녁 뭐먹지? 🥂</h3>
    <h5 class="wrap-sub-title">뭉쳐야산다의 식품 코너를 소개합니다!</h5>
    <div class="popular-product-wrap">
        <c:forEach items="${category3List }" var="p">
            <div class="posting-item popular">
                <div class="posting-img popular">
                    <a href="/productView.do?productNo=${p.productNo }">
                        <img src="/resources/upload/product/${p.thumbnail }" />
                    </a>
                    <div class="gonggu-info">${p.gongguNumber}인 공동구매</div>
                </div>
                <div class="posting-content popular">
                    <p class="posting-title">
                        <a href="/productView.do?productNo=${p.productNo }">
                            ${p.productName}
                        </a>
                    </p>
                    <div class="posting-price-box">
                        <p class="price-through"><fmt:formatNumber value="${p.productPrice}"/> 원</p>
                        <div class="sail-box popular">
                            <div class="sail-box-popular">
                                <p class="sail-percent">${p.productDiscount}%</p>
                                <p class="price-sail"><fmt:formatNumber value="${(Math.floor(p.productPrice*(100 - p.productDiscount)/1000)*10)}"/>원</p>
                            </div>
                            <div class="star-rating">
                                <div class="material-symbols-outlined star-rate">star</div>
                                <div class="rating-average">4.8</div>
                                <div class="review-count">(152)</div>
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

            <div class="posting-item popular all-product">
                <a href="/bestProductList.do">전체보기</a>
            </div>
    </div>






    <h3 class="wrap-title" style="margin-bottom: 0px;"># 가정의달 우리 아이 👶🏻</h3>
    <h5 class="wrap-sub-title">최근 별점 5점을 받은 상품이에요!</h5>


    <h3 class="wrap-title" style="margin-bottom: 0px;"># 이건 꼭 사세요 📢</h3>
    <h5 class="wrap-sub-title">최근 별점 5점을 받은 상품이에요!</h5>


    <h3 class="wrap-title" style="margin-bottom: 0px;"># 공동구매가 대세 👍 </h3>
    <h5 class="wrap-sub-title">활발하게 공동구매가 이루어지고 있는 상품이에요!</h5>










    <h1>전체</h1>
    <div class="product-wrap">
    <!-- 전체 상품 wrap -->
        <div class="posting-item">
            <div class="posting-img">
                <a href="#">
                    <img src="/resources/img/product/lactofit.jpg" />
                </a>
                <div class="gonggu-info">2인 공동구매</div>
            </div>
            <div class="posting-content">
                <p class="posting-title">
                    <a href="#">
                        [3월 한정 파격특가][종근당건강] 락토핏 생유산균 골드(50포) 3통 (150일분) / 온가족 유산균
                    </a>
                </p>
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
                            <div class="material-symbols-outlined star-rate">star</div>
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
                            <div class="material-symbols-outlined star-rate">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="posting-item">
            <div class="posting-img">
                <a href="#">
                    <img src="/resources/img/product/cleansing_foam.jpeg" />
                </a>
                <div class="gonggu-info">2인 공동구매</div>
            </div>
            <div class="posting-content">
                <p class="posting-title">
                    <a href="#">
                        [리얼베리어] 크림 클렌징 폼
                    </a>
                </p>
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
                            <div class="material-symbols-outlined star-rate">star</div>
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
                            <div class="material-symbols-outlined star-rate">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="posting-item">
            <div class="posting-img">
                <a href="#">
                    <img src="/resources/img/product/lactofit.jpg" />
                </a>
                <div class="gonggu-info">2인 공동구매</div>
            </div>
            <div class="posting-content">
                <p class="posting-title">
                    <a href="#">
                        [3월 한정 파격특가][종근당건강] 락토핏 생유산균 골드(50포) 3통 (150일분) / 온가족 유산균
                    </a>
                </p>
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
                            <div class="material-symbols-outlined star-rate">star</div>
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
                            <div class="material-symbols-outlined star-rate">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="posting-item">
            <div class="posting-img">
                <a href="#">
                    <img src="/resources/img/product/lactofit.jpg" />
                </a>
                <div class="gonggu-info">2인 공동구매</div>
            </div>
            <div class="posting-content">
                <p class="posting-title">
                    <a href="#">
                        [3월 한정 파격특가][종근당건강] 락토핏 생유산균 골드(50포) 3통 (150일분) / 온가족 유산균
                    </a>
                </p>
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
                            <div class="material-symbols-outlined star-rate">star</div>
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
                            <div class="material-symbols-outlined star-rate">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="posting-item">
            <div class="posting-img">
                <a href="#">
                    <img src="/resources/img/product/lactofit.jpg" />
                </a>
                <div class="gonggu-info">2인 공동구매</div>
            </div>
            <div class="posting-content">
                <p class="posting-title">
                    <a href="#">
                        [3월 한정 파격특가][종근당건강] 락토핏 생유산균 골드(50포) 3통 (150일분) / 온가족 유산균
                    </a>
                </p>
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
                            <div class="material-symbols-outlined star-rate">star</div>
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
                            <div class="material-symbols-outlined star-rate">star</div>
                            <div class="rating-average">4.8</div>
                            <div class="review-count">(152)</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



    

</div>



<jsp:include page="/WEB-INF/views/common/footer.jsp" />	




    <!-- 상품 js -->
    <script type="text/javascript" src="/resources/slick/slick.min.js"></script>
    <script src="/resources/js/product.js"></script>

    <script>
    $(document).ready(function(){
	    // 슬릭 padding-bottom
	    $(".popular-product-wrap .slick-list").attr("style", "padding-bottom: 10px; margin-bottom: 250px;");
	
	
	    $(".slick-box").slick({
	        autoplay: true,
	        autoplaySpeed: 5000,
	        infinite: true,
	        fade: true,
	        dots: true
	    });
	    
	    
// 	    $(".slick-dots").hover(function(event){
// 	    	event.stopPropagation();
// 	    });
    });
    </script>
</body>
	
</html>