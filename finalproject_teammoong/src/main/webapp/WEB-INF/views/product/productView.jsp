<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- 슬릭 슬라이더 제이쿼리 -->
	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<!-- 슬릭 슬라이더 -->
	<link rel="stylesheet" href="/resources/slick/slick-theme.css"/>
	<link rel="stylesheet" href="/resources/slick/slick.css"/>
	<!-- 슬라이더 화살표 아이콘 arrow -->
	<script src="https://kit.fontawesome.com/285f888d1c.js" crossorigin="anonymous"></script>
    <!--productView.css-->
    <link rel="stylesheet" href="/resources/css/product/productView.css">
    <script src="/resources/js/jquery-3.6.0.js"></script>
</head>
<style>
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
    #test {
    color: #f88000;
    font-variation-settings:
    'FILL' 1,
    'wght' 400,
    'GRAD' 0,
    'opsz' 48
    }
    .material-symbols-outlined1:hover {
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
	        <div class="top-info-box">
            <div class="img-box"style="width: 500px;">
            <c:forEach items="${p.fileList }" var="i">
                <img src="/resources/upload/product/${i.filepath }" style="border-radius: 20px;">
            </c:forEach>
            </div>
            <div class="first-info-box">
                <div class="product-name"><a>${p.productName }</a></div>
                <div class="price-box-top">
                <div class="price-box1">
                    <div class="product-discount">
                        <a>${p.productDiscount}%</a>
                    </div>
                </div>
                    <div class="flex-price-box">
                    <div class="price-box2">
                        <div class="no-discount-price">
                            <a style="text-decoration: line-through;">${p.productPrice}</a>
                            <span>원</span>
                        </div>
                        <div class="real-price"><span class="product-price"></span><span class="product-price-currency"> 원</span></div>
                    </div>
                    <div class="icon-box">
                        <div class="like-icon">
                            <a name="like">
                                <!-- <c:if test="${productNo eq boardNo}"> -->
                                <span class="material-symbols-outlined">favorite</span>
                                <!-- </c:if> -->
                            </a>
                        </div>
                        <div class="share-icon">
                            <a href="#">
                                <span class="material-symbols-outlined">share</span>
                            </a>
                        </div>
                    </div>
                </div>
                </div>
                <div class="flex-wrap">
                    <div class="flex-box">
                        <div class="info-title-box">
                            <a class="info-title">택배배송</a>
                        </div>
                        <div class="info-content ic1">
                            <ul>
                                <li class="delivery-info">무료배송<span>(뭉쳐야산다 모든제품 무료배송)</span></li>
                                <li>공동구매 완료되면 배송시작</li>
                            </ul>
                        </div>
                    </div>

                        <div class="flex-box">
                            <div class="info-title-box">
                                <a class="info-title">배송기간</a>
                            </div>
                            <div class="info-content">
                                <ul>
                                    <li>1일내 도착 확률 ------------- <span class="delivery-percent">88%</span></li>
                                    <li>3일내 도착 확률 ------------- <span class="delivery-percent">91%</span></li>
                                    <li>5일내 도착 확률 ------------- <span class="delivery-percent">95%</span></li>
                                </ul>
                            </div>
                        </div>
                        
                        <div class="flex-box">
                            <div class="info-title-box">
                                <a class="info-title">적립금액</a>
                            </div>
                            <div>
                                <ul class="info-content">
                                    <li>1일내 도착 확률 : 88%</li>
                                    <li>3일내 도착 확률 : 91%</li>
                                    <li>5일내 도착 확률 : 97%</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>  
            </div>
        <div class="gonggu-content-wrap">

        </div>
    </div>
<input type="hidden" id="productPrice" value="${p.productPrice}">
<input type="hidden" id="productDiscount" value="${p.productDiscount}">
<input type="hidden" id="loginMember" value="${sessionScope.m.memberNo}">
<input type="hidden" id="productNo" value="9">
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<!-- <div class="quick-scroll-bar">
    <ul>
        <li><a href="#" class="product-info-btn">상품설명</a></li>
<li><a href="#" class="product-view-btn">상세정보</a></li>
<li><a href="#" class="product-review-btn">리뷰보기</a></li>
<li><a href="#" class="product-inquiry-btn">문의하기</a></li>
</ul>
</div>
<div class="quick-scroll-content">
<div class="product-info-box" style="height: 500px;">상품정보</div>
<div class="product-info-view" style="height: 500px;">상세정보</div>
<div class="product-review" style="height: 500px;">리뷰보기</div>
<div class="product-inquiry" style="height: 500px;">문의하기</div>

</div> -->

    
    
</body>
    	<!-- 슬릭 슬라이더 js -->
	<script type="text/javascript" src="/resources/slick/slick.min.js"></script>
    <script>
        console.log($("#productNo").val())
        window.onload = function(){
            $.ajax({
                url : "/selectProductLike.do",
                type : "POST",
                dataType : "JSON",
                data : {memberNo : $("#loginMember").val(), productNo : $("#productNo").val()},
                success : function(data){
                    console.log(data);
                    if(data.memberNo == $("#loginMember").val()){
                        $("[name=like]").empty();
                        $("[name=like]").append("<span class='material-symbols-outlined' id='test'>favorite</span>")
                    }
                }
            });
        }
        let productPrice = $("#productPrice").val();
        let productDiscount = $("#productDiscount").val();
        
        $(function(){
            let result = productPrice * (100-productDiscount)/100000;
            var num = 0;
            num = result;
            console.log(result);
            var DiscountPrice = Math.floor(result);
            console.log(DiscountPrice*1000);
            var price = DiscountPrice*1000;
            price = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            console.log(price);
            $(".product-price").text(price);
        })

        $('.img-box').slick();
        $(".scroll-top").on("click",function(){
            var offset = $("body").offset();
            $("html, body").animate({scrollTop: offset.top},400);
        });
        $(document).ready(function(){
            $('.product-info-btn').click(function(){
                var offset = $('.product-info-box').offset(); //선택한 태그의 위치를 반환
                    //animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함 
                    $("html, body").animate({scrollTop: offset.top},400); // 선택한 위치로 이동. 두번째 인자는 0.4초를 의미한다.
            });
        });
        $(document).ready(function(){
            $('.product-view-btn').click(function(){
                var offset = $('.product-info-view').offset(); //선택한 태그의 위치를 반환
                    //animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함 
                    $("html, body").animate({scrollTop: offset.top},400); // 선택한 위치로 이동. 두번째 인자는 0.4초를 의미한다.
            });
        });
        $(document).ready(function(){
            $('.product-review-btn').click(function(){
                var offset = $('.product-review').offset(); //선택한 태그의 위치를 반환
                    //animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함 
                    $("html, body").animate({scrollTop: offset.top},400); // 선택한 위치로 이동. 두번째 인자는 0.4초를 의미한다.
            });
        });
        $(document).ready(function(){
            $('.product-inquiry-btn').click(function(){
                var offset = $('.product-inquiry').offset(); //선택한 태그의 위치를 반환
                    //animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함 
                    $("html, body").animate({scrollTop: offset.top},400); // 선택한 위치로 이동. 두번째 인자는 0.4초를 의미한다.
            });
        });
        $("[name=like]").on("click",function(){
            $.ajax({
                url : "/productLike.do",
                type : "POST",
		    	dataType : "JSON",
                data : {productNo : 9, memberNo : $("#loginMember").val()},
                success : function(data){
                    console.log(data);
                }
            });
        });
        </script>
</html>