<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- 슬릭 슬라이더 제이쿼리 -->
    <!-- <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script> -->
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



/* 최근 본 상품 */
.recent-product-container{
    position: absolute;
    /* 위치조정 */
    top: 416px;
    right: 40px;
    bottom: 0px;
    z-index: 1;
    margin-top: 236px;
}

.recent-product-box{
    width: 80px;
    height: 240px;
    background-color: #fff;
    border: 1px solid #eee;
    position: sticky;
    top: 50%;
    transform: translateY(-50%);
    font-size: 12px;
    line-height: 16px;
    color: rgb(51, 51, 51);
    letter-spacing: -0.3px;
}

.recent-product-title{
    text-align: center;
    padding: 10px;
    padding-top: 20px;
    font-size: 10px;
    font-weight: 500;
    color: #505050;
}

.recent-product-content{
    /* border: 1px solid black; */
    width: 90%;
    /* height: 180px; */
    /* overflow: hidden; */
    margin-top: 6px;
    margin: 0 auto;
}

.recent-product-content>ul{
    position: relative;
    top: 10px;
    display: flex;
    flex-direction: column;
    -webkit-box-align: center;
    align-items: center;
    transition: top 0.2s ease 0s;
}

.recent-product-content a{
    display: inline-block;
    margin: 2px auto;
    width: 60px;
    height: 60px;
}

.recent-product-content span{
    display: inline-block;
    width: 60px;
    height: 60px;
    /* margin: 5px;
    margin-top: 0px; */
    margin-left: 5px;
}

.recent-product-content img{
    display: block;
    width: 100%;
    height: 100%;
    object-fit: cover;
    /* width: initial;
    height: initial; */
    background: none;
    opacity: 1;
    border: 0px;
    margin: 0px;
    padding: 0px;
}

.icon-logo-box{
    width: 80px;
    height: 40px;
    /* background-color: #eee; */
    /* border-top: 5px solid #fff; */
    margin: 40px auto;
    /* padding-top: 10px; */
    position: absolute;
    top: 210px;
}

.kkt-logo>a{
    display: block;
    width: 25px;
    height: 25px;
    margin: 0 auto;
    
}

.icon-logo-box>div>a>img{
    width: 100%;
    height: 100%;
}





/* 창 크기가 작아지면 최근본상품 사라짐 */
@media screen and (max-width: 1870px){
    .recent-product-container {
        display: none !important;
    }
}
.recent-product-content .slick-slide{
    width:71px !important;
    height:67px !important;
}

</style>
</head>
<body>

    
	<!-- 최근 본 상품 -->
<div class="recent-product-container">
    <div class="recent-product-box">
        <!-- <button type="button" class="material-symbols-outlined order-product-expand-less">expand_less</button> -->
        <div class="recent-product-title">최근 본 상품</div>
        <div class="recent-product-content">
            <ul>
            	<c:forEach items="${recentProductList}" var="i">
                <li>
                    <a href="#">
                        <span>
                            <img src="/resources/upload/product/${i.thumbnail }">
                        </span>
                    </a>
                </li>
            	</c:forEach>
<!--                 <li> -->
<!--                     <a href="#"> -->
<!--                         <span> -->
<!--                             <img src="/resources/img/product/bubble_tomato.jpg"> -->
<!--                         </span> -->
<!--                     </a> -->
<!--                 </li> -->
                <!-- <li>
                    <a href="#">
                        <span>
                            <img src="/resources/img/product/cleansing_foam.jpeg">
                        </span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span>
                            <img src="/resources/img/product/orange.jpeg">
                        </span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span>
                            <img src="/resources/img/product/korean-melon.jpg">
                        </span>
                    </a>
                </li> -->
            </ul>
        </div>
        <div class="icon-logo-box">
            <div class="kkt-logo">
                <a href="#">
                    <img src="/resources/img/common/kakaotalk_logo.png">
                </a>
            </div>
        </div>
        <!-- <button type="button" class="material-symbols-outlined order-product-expand-more">expand_more</button> -->
    </div>
</div>


















    <script type="text/javascript" src="/resources/slick/slick.min.js"></script>



    <!-- 최근 본 상품 슬라이드 -->
    <script>
        $('.recent-product-content>ul').slick({
            infinite: false,
            speed: 100,
            slidesToShow: 2,
            slidesToScroll: 1,
            vertical : true,
            prevArrow : "<button type='button' class='material-symbols-outlined order-product-expand-less'>expand_less</button>",
            nextArrow : "<button type='button' class='material-symbols-outlined order-product-expand-more'>expand_more</button>"
        });
    </script>
    

</body>
</html>