<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    width: 80px;
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

.top-icon{
    /* width: 40px; */
    /* height: 40px; */
    /* margin: 80px auto; */
    position: fixed;
    z-index: 10;
    right: 52px;
    width: 58px;
    height: 58px;
    cursor: pointer;
    transition: opacity 0.5s ease 0s, bottom 0.5s ease 0s;
    opacity: 1;
    bottom: 15px;
}

body .top-icon.hide-icon{
    position: fixed;
    z-index: 10;
    right: 52px;
    bottom: -46px;
    width: 58px;
    height: 58px;
    opacity: 0;
    cursor: pointer;
    transition: opacity 0.5s ease 0s, bottom 0.5s ease 0s;
}

.top-icon>a>span{
    display: block;
    width: 100%;
    height: 100%;
    background: url(data:image/png;base64,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) 50% 50% / 58px 58px no-repeat;
}

.top-icon>a>span:hover{
    background: url(data:image/png;base64,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) 50% 50% / 58px 58px no-repeat;
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
                <li>
                    <a href="#">
                        <span>
                            <img src="/resources/img/product/lactofit.jpg">
                        </span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span>
                            <img src="/resources/img/product/bubble_tomato.jpg">
                        </span>
                    </a>
                </li>
                <li>
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
                </li>
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


<!-- top 아이콘-->
<div class="top-icon">
    <a>
        <span></span>
    </a>
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
    
    <!-- top 아이콘 -->
    <script>
        $(".top-icon").on("click", function(){
            // $('html').scrollTop(0);
            $('html, body').animate({scrollTop: '0'}, 680);
        });

        $(".top-icon").addClass("hide-icon");
        $(window).scroll(function () {
            if($(document).scrollTop() >= 300){
                $(".top-icon").removeClass("hide-icon");
            }else{
                $(".top-icon").addClass("hide-icon");
            }
            
    });
    </script>
</body>
</html>