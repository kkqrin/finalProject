<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<style>
	.content-wrap{
    width: 1200px;
    margin: 0 auto;
	}
	.top-info-box{
    	display: flex;
	}
	.gonggu-box th{
/* 	    width: 1200px; */
	}
	.quick-scroll-bar>ul{
	    display: flex;
	    padding: 0;
	}
	.quick-scroll-bar>ul li{
	    list-style-type: none;
	    width: 1200px;
	    text-align: center;
	}
	.quick-scroll-bar>ul li a{
/* 	    text-decoration: none; */
	}
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="content-wrap">
	        <div class="top-info-box">
            <div class="img-box">
            <c:forEach items="${p.fileList }" var="i">
                <img src="/resources/upload/product/${i.filepath }" style="width: 300px; height: 500px;">
                </c:forEach>
            </div>
            <div class="first-info-box">
                <div><a>${p.productName }</a><span><a href="#">♡</a></span><span><a href="#">☆</a></span></div>
                <div><a>00%</a><a>8,990원</a></div>
                <table border="1">
                    <tr>
                        <th>배송</th>
                        <th>Double click to editDouble click to edit</th>
                    </tr>
                    <tr>
                        <th>내일도착확률</th>
                        <th>Double click to editDouble click to edit</th>
                    </tr>
                    <tr>
                        <th>별점(리뷰)</th>
                        <th>Double click to editDouble click to edit</th>
                    </tr>
                </table>
            </div>
        </div>
        <hr>
        <div class="gonggu-box">
            <div><h1>2인 공동구매 참여하기</h1></div>
            <table border="1">
                <tr>
                    <th><img src="" style="width: 30px; height: 30px; border-radius: 50%; background-color: black;"><span>user01(1/2)</span></spam></th>
                    <th><button type="button">주문참여</button></th>
                </tr>
                <tr>
                    <th><img src="" style="width: 30px; height: 30px; border-radius: 50%; background-color: black;"><span>user01(1/2)</span></spam></th>
                    <th><button type="button">주문참여</button></th>
                </tr>
                <tr>
                    <th><img src="" style="width: 30px; height: 30px; border-radius: 50%; background-color: black;"><span>user01(1/2)</span></spam></th>
                    <th><button type="button">주문참여</button></th>
                </tr>
            </table>
        </div>
        <div class="quick-scroll-bar">
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
        </div>
        <button class="scroll-top" style="font-size: 50px;">↑</button>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
<script>
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
    </script>
</html>