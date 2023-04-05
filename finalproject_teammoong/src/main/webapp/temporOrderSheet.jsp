<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/product/ordersheet.css"/>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="content-wrap">
        <div class="order-sheet-wrap">
            <h1>주문서</h1>
            <form action="#" method="post">
                <div class="order-product-box">
                    <h4>주문 상품</h4>
                    <div class="order-product-item">
                        <div class="order-product-img">
                            <a href="#">
                                <img src="/resources/img/product/lactofit.jpg" />
                            </a>
                        </div>
                        <div class="order-product-info">
                            <div class="order-product-title">[3월 한정 파격특가][종근당건강] 락토핏 생유산균 골드(50포) 3통 (150일분) / 온가족 유산균</div>
                            <div class="order-product-option">3통 120포</div>
                        </div>
                        <div class="order-product-volume">1개</div>
                        <div class="order-product-price">1,000원</div>
                    </div>
                </div>
                <div class="order-member-box">
                    <h4>주문자 정보</h4>
                </div>
                <div class="order-delivery-box">
                    <h4>배송 정보</h4>
                </div>

                <div class="order-payment-wrap">
                    <div class="order-coupon-box">
                        <h4>쿠폰 / 적립금</h4>
                    </div>
                    <div class="order-pay-box">
                        <h4>결제 수단</h4>
                    </div>
                    <div class="order-agree-box">
                        <h4>개인정보 수집 / 제공</h4>
                    </div>
                    <div class="total-pay-box">
                        결제 금액
                    </div>
                </div>
                <div class="order-complete-box">
                    <button class="order-complete-btn">00원 결제하기</button>
                </div>
            </form>





        </div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>