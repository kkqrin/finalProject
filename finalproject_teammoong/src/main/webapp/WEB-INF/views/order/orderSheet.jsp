<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/product/ordersheet.css"/>

<style>
    /* #delivery-member{
        width: auto;
        display: inline-block;
        min-height: auto;
    } */
    input[type=radio],input[type=checkbox]{
        width: auto;
        display: inline-block;
        min-height: auto;
    }
    .deli-box>input[type=text],
    .saved-money-box>input[type=text]{
        height: auto;
    }

</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	
	
	<div class="content-wrap">
	
		<input type="hidden" id="session-member-name" value="${sessionScope.m.memberName}">
		<input type="hidden" id="session-member-phone" value="${sessionScope.m.memberPhone}">
		<input type="hidden" id="session-member-zonecode" value="${sessionScope.m.memberZoneCode}">
		<input type="hidden" id="session-member-addr" value="${sessionScope.m.memberAddr}">
	
	
        <pre>
            남은 일 : 주소검색 API, 유효성 검사 (나쁜사용자), 전체 주문금액보다 쿠폰/적립금 더 못쓰게
        </pre>
        <div class="order-sheet-wrap">
            <h1>주문서</h1>
            <!--  -->
            <!-- <form action="/insertPay.do" method="post"> -->
            <form action="/order.do" method="post">
                <div class="order-product-box">
                    <h4>
                        주문 상품
                        <span class="material-symbols-outlined order-product-expand-less">expand_less</span>
                        <span class="material-symbols-outlined order-product-expand-more">expand_more</span>
                    </h4>
                    
                    <!-- 상품 리스트 요약 -->
                    <div class="order-product-item total-product-count-box">
                        <div class="order-product-info total-product-count">
                            <div class="order-product-title">
                                    <span id="first-product-name"></span> 등 현재 주문 상품은 총 [<span id="order-product-count"></span>]건
                            </div>
                        </div>
                    </div>
                    
                    
                    
                    <!-- 상품 리스트 -->
                    <c:forEach items="${orderProductList }" var="i">
                        <div class="order-product-item">
                            <div class="order-product-img">
                                <a href="/productView.do?productNo=${i.productNo}">
                                    <img src="/resources/upload/product/${i.thumbnail }" />
                                </a>
                            </div>
                            <div class="order-product-info">
                                <div class="order-product-title">
                                    <a href="/productView.do?productNo=${i.productNo}">${i.productName }</a>
                                </div>
                                <div class="order-product-option">${i.optionDetailName }</div>
                            </div>
                            <!-- 뷰 page : 상품 하나의 수량들 , 장바구니 : 0 -->
                            <!-- page가 0이면 orderDetailCnt 사용, 아니면 page 그대로 사용 -->
                            <c:choose>
                                <c:when test="${page eq 0}">
                                    <div class="order-product-volume"><span>${i.basketCount}</span>개</div>
                                    <input type="text" name="orderDetailCnt" value="${i.basketCount }">
                                </c:when>
                                <c:otherwise>
                                    <div class="order-product-volume"><span>${page}</span>개</div>
                                    <input type="text" name="orderDetailCnt" value="${page }">
                                </c:otherwise>
                            </c:choose>

                            <div class="order-product-price"><span></span>원</div>
                            <input type="text" id="productPrice" class="product-price" value="${i.productPrice }">
							<input type="text" id="productDisCount" class="product-discount" value="${i.productDiscount }">
                            
							<input type="text" name="productNo" class="product-no" value="${i.productNo }">
							<input type="text" name="optionInfoNo" value="${i.optionNo }">
                            <input type="text" name="orderDetailCost" value="${i.productCost}">
                            <input type="text" name="orderSalePrice" value="">
                            <!-- <input type="text" name="orderProductCount" value=""> -->
                            <!-- <input type="text" name="orderPrice" value=""> -->
                            <!-- <input type="text" name="productName" value="${i.productName }"> -->
                            <!-- ${i.productPrice } * ( 100 - ${i.productDiscount }) / 100 -->
                            <!-- .toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") -->
                            <!-- 
                                ////////////// 가격 정리 //////////////
                                1. 주문 테이블  (주문서 안의 총 가격) ======> orderPrice 주문서당 총 상품가격(할인들어간 금액), totalPrice 사용자 실제 결제 금액 (쿠폰/적립금 사용후)
                                2. 주문 상세 테이블 (한 주문당 상품들에 관한 테이블) ====> productPrice 상품당 가격, productCost 상품당 원가(판매자)
                            -->
                        </div>
                    </c:forEach>
					
                </div>
                <div class="order-member-box">
                    <h4>주문자 정보</h4>
                    <table class="tbl-box" style="margin-top: 20px;">
                        <tr>
                            <th>보내는분</th>
                            <td colspan="2">${sessionScope.m.memberName}</td>
                        </tr>
                        <tr>
                            <th>휴대폰</th>
                            <td colspan="2">${sessionScope.m.memberPhone}</td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td colspan="2">${sessionScope.m.memberEmail}</td>
                        </tr>
                    </table>
                </div>
                <div class="order-delivery-box">
                    <h4>배송 정보</h4>
                    <div>
                        <input type="checkbox" id="delivery-member">
                        <label for="delivery-member">주문자 정보와 동일</label>
                    </div>
                    <table class="tbl-box deli-sheet">
                        <tr>
                            <th><label for="deli-member">받으실분</label></th>
                            <td colspan="2">
                                <input type="text" name="deliReceiver" id="deli-member" class="input-noborder" placeholder="이름을 입력해주세요">
                            </td>
                        </tr>
                        <tr>
                            <th><label for="deli-phone">휴대폰</label></th>
                            <td colspan="2">
                                <input type="text" name="deliPhone" id="deli-phone" class="input-noborder" placeholder="'-' 제외 숫자만 입력해주세요">
                            </td>
                        </tr>
                        <tr>
                            <th>배송지</th>
                            <td colspan="2" class="deli-box">
                                <input type="radio" name="deli-address" id="member-address"><label for="member-address">기본 배송지</label>
                                <input type="radio" name="deli-address" id="new-input-address" checked><label for="new-input-address">직접 입력</label>
                                <div>
                                    <input type="text" id="deli-post-number" class="input-noborder" placeholder="우편번호">
                                    <button type="button" class="btn btn-pri size01">주소검색</button>
                                </div>
                                <input type="text" name="deliAddr1" id="deli-addr" class="input-noborder" placeholder="주소를 입력해주세요">
                                <input type="text" name="deliAddr2" id="deli-addr2" class="input-noborder" placeholder="상세주소를 입력해주세요">
                            </td>
                        </tr>
                        <tr>
                            <th>요청사항</th>
                            <td colspan="2">
                                <div class="selectBox-widht-explain" style="width: 100%;">
                                    <select class="select-custom deli-request" id="deli-request">
                                        <option value="default" selected>배송시 요청사항을 선택해주세요</option>
                                        <option value="1">부재시 문 앞에 놔주세요</option>
                                        <option value="2">경비실에 맡겨주세요</option>
                                        <option value="3">미리 전화 주세요</option>
                                        <option value="4">무인택배함에 놔주세요</option>
                                        <option value="5" id="direct-deli-request">직접 입력</option>
                                    </select>
                                    <input type="text" class="input-noborder direct-input-deli-request" placeholder="요청 사항을 직접 입력해주세요" style="display:none; margin-top: 10px;">
                                    <input type="hidden" name="deliRequest">
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="order-payment-wrap">
                    <div>
                        <div class="order-coupon-box">
                            <h4>쿠폰 / 적립금</h4>
                            <table class="tbl-box" style="margin-top: 20px;">
                                <tr>
                                    <th>쿠폰</th>
                                    <input type="hidden" id="number-coupon" value="0">
                                    <td colspan="2">
                                        <div class="selectBox-widht-explain" style="width: 100%;">
                                            <select class="select-custom order-coupon" id="order-coupon">
                                                <option value="0" issueNo="0" selected>사용 가능한 쿠폰 ${couponCount }장</option>
                                                <c:forEach items="${couponList }" var="i">
                                                <option value="${i.couponPrice }" issueNo="${i.issueNo}">${i.couponTitle }( <fmt:formatNumber value="${i.couponPrice }"/>원 할인 / ~ ${i.endDate } )</option>
                                                <!-- <input type="hidden" name="issueNo" value="${i.issueNo}"> -->
                                                </c:forEach>
                                                <!-- <option value="2" disabled>5만원이상 1천원 할인</option> -->
                                            </select>
                                            <input type="hidden" name="issueNo" value="0">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>적립금</th>
                                    <td colspan="2" class="saved-money-box">
                                        <div>
                                            <input type="text" id="input-saved-money" placeholder="사용 가능한 적립금 <fmt:formatNumber value="${point.pointEa }"/>원">
                                            <button type="button" class="btn btn-pri size01" id="do-saved-money">적용</button>
                                            <button type="button" class="btn btn-pri size01" id="all-saved-money">모두 사용</button>
                                            <input type="hidden" id="hidden-total-point" value="${point.pointEa }">
                                            <input type="hidden" name="minusPointEa" id="hidden-current-point" value="0">
                                            
                                            
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="order-pay-box">
                            <h4>결제 수단</h4>
                            <div>
                                <button type="button" class="btn btn-pri size02">신용카드</button>
                                <!-- <div>
                                    <button type="button" class="btn btn-pri size02">무통장 입금</button>
                                    <button type="button" class="btn btn-pri size02">휴대폰</button>
                                </div> -->
                            </div>
                        </div>
                        <div class="order-agree-box">
                            <h4>개인정보 수집 / 제공</h4>
                            <div>
                                <div>
                                    <label for="agree1"><input type="checkbox" name="chk" id="agree1"> 개인정보 수집·이용 및 처리 동의</label>
                                    <a href="#">보기</a>
                                </div>
                                <div>
                                    <label for="agree2"><input type="checkbox" name="chk" id="agree2"> 전자지급 결제대행 서비스 이용약관 동의</label>
                                    <a href="#">보기</a>
                                </div>
                                <div>
                                    <label for="all-agree"><input type="checkbox" id="all-agree"> 전체 동의</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="total-pay-box">
                        <h5>결제 금액</h5>

                        <input type="hidden" id="number-pay-price" name="orderPrice">
                        <div class="total-order-amount-1">
                            <div>주문금액</div>
                            <div><span></span>원</div>
                        </div>
                        <div class="total-order-amount-2">
                            <div>└ 상품 금액</div>
                            <div><span></span>원</div>
                        </div>
                        <div class="total-order-amount-3">
                            <div>└ 상품 할인 금액</div>
                            <div>-<span></span>원</div>
                        </div>

                        <div class="total-order-delivery-fee">
                            <div>배송비</div>
                            <div>0원</div>
                        </div>
                        <div class="total-order-coupon">
                            <div>쿠폰 할인</div>
                            <div><span>0</span>원</div>
                        </div>
                        <div class="total-order-saved-money">
                            <div>적립금 사용</div>
                            <div><span>0</span>원</div>
                        </div>

                        <div class="total-order-pay">
                            <div>최종 결제 금액</div>
                            <div><span></span>원</div>
                        </div>
                        <input type="hidden" id="hidden-total-pay"  name="totalPrice">

                        <div class="total-order-buy-save-point">
                            <button type="button" class="btn btn-pri">적립</button>
                            <div style="margin-right: 5px;">구매시</div>
                            <div><span></span>원 (10%)</div>
                            <input type="hidden" name="plusPointEa" id="plusPointEa" value="">
                        </div>
                    </div>
                </div>
				<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">

                <div class="order-complete-box area-btn full">
                    <button type="button" id="payDirectBtn" class="btn btn-pri size03 order-complete-btn"><span></span>원 결제하기</button>
                </div>
                <div class="area-btn left" style="display:none;">
                    <button class="btn btn-border-pri size01" type="button" id="alert01">성공</button>
                    <button class="btn btn-border-sec size01" type="button" id="alert02">에러</button>
                    
                </div>
                <button type="submit">제출</button>
            </form>
            





        </div>
    
    

    
    
    
    
    
    
    
    
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <!-- 주문 js -->
    <script src="/resources/js/order.js"></script>

    <script>
        $(function() {
			$( ".deli-request" ).selectmenu();
            $( ".order-coupon" ).selectmenu();
            // const productPrice = $("#productPrice").val();
            // const productDisCount = $("#productDisCount").val();
            // const salePrice = productPrice *((100-productDisCount) /100);
            // (Math.floor(productPrice*(100 - productDiscount)/1000)*10)
            // $("[name=orderSalePrice]").val((Math.floor(productPrice*(100 - productDiscount)/1000)*10));
		});

        // 상품 개수
        $("#order-product-count").text($(".order-product-item").length-1);

        // 상품 이름
        if($(".order-product-title").eq(1).children().text().length > 30){
            $("#first-product-name").text($(".order-product-title").eq(1).children().text().substr(0,30)+"..");
        }else{
            $("#first-product-name").text($(".order-product-title").eq(1).children().text());
        }


        // 배송 요청
        $(".deli-request").on("selectmenuchange", function(){
            // jQuery ui select change 이벤트
            if($(this).val() == 5){
                $(".direct-input-deli-request").show();
                
                $(".direct-input-deli-request").on("change", function(){
                    $("[name=deliRequest]").val($(".direct-input-deli-request").val());
                })
            }else{
                $(".direct-input-deli-request").val("");
                $(".direct-input-deli-request").hide();
                // 배송 요청사항
                // console.log($(this).children().eq($(this).val()).text());
                $("[name=deliRequest]").val($(this).children().eq($(this).val()).text());
            }
            // console.log($("[name=deliRequest]").val());
        })


        // 더보기 버튼과 주문한 상품 정보 숨기기
        $(".order-product-expand-less").hide();
        $(".order-product-item").hide();
        $(".total-product-count-box").show();

        $(".order-product-expand-more").on("click",function(){
            $(".order-product-expand-less").show();
            $(".order-product-expand-more").hide();
            // 주문한 상품 전체보기
            $(".order-product-item").show();
            // 주문 상품 전체 개수 숨기기
            $(".total-product-count-box").hide();
        });
        $(".order-product-expand-less").on("click",function(){
            $(".order-product-expand-more").show();
            $(".order-product-expand-less").hide();
            // 주문한 상품 전체 숨기기
            $(".order-product-item").hide();
            // 주문 상품 전체 개수 보이기
            $(".total-product-count-box").show();
        });

        // 상품리스트 상품 가격 + 화폐 단위
		for(let i=0;i<$(".order-product-price").length;i++){
			// console.log($(".cart-product-price").length);

			const productPrice = $(".product-price").eq(i).val();
			const productDiscount = $(".product-discount").eq(i).val();
            const orderDetailCnt = $(".order-product-volume>span").eq(i).text();
			
			// Math.floor(productPrice*(100 - productDiscount)/1000)*10);
			$(".order-product-price").eq(i).children().text(((Math.floor(productPrice*(100 - productDiscount)/1000)*10)*orderDetailCnt).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
            $("[name=orderSalePrice]").eq(i).val((Math.floor(productPrice*(100 - productDiscount)/1000)*10));
            console.log("orderDetailCnt : "+orderDetailCnt);
            // $("[name=orderDetailCnt]").eq(i).val(orderDetailCnt);
		};


        // 결제 금액 (기본 세팅)
        let productPriceSum = 0;
        let discountPrice = 0;
        let payPrice = 0;




        for(let i=0;i<$(".product-price").length;i++){
            const productPrice = $(".product-price").eq(i).val();
            const productDiscount = $(".product-discount").eq(i).val();
            // 수량
            const orderDetailCnt = Number($(".order-product-volume>span").eq(i).text());

            
            // 수량 hidden
            // $("[name=orderDetailCnt]").val(orderDetailCnt);

            // 할인 전 원래 가격(상품금액)
            productPriceSum = (Number(productPriceSum) + Number(productPrice)) * orderDetailCnt;
            $(".total-order-amount-2>div").last().children().text((productPriceSum).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

            // 할인되는 금액(할인금액)
            discountPrice = ( Number(discountPrice) + Number(productPrice-(Math.floor(productPrice*(100 - productDiscount)/1000)*10)) ) * orderDetailCnt;
            $(".total-order-amount-3>div").last().children().text(discountPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
			
            // 주문금액 (결제할 금액)
            payPrice = ( Number(payPrice) + Number((Math.floor(productPrice*(100 - productDiscount)/1000)*10)) ) * orderDetailCnt;
            $("[name=orderPrice]").val(payPrice);
            $(".total-order-amount-1>div").last().children().text(payPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
        
        }
        
        // 최종 결제 금액 계산을 위해 hidden에 넣어둠
        $("#number-pay-price").val(payPrice);

        // 최종 결제 금액 = 주문금액 (- 쿠폰(0) - 적립금(0))
        $(".total-order-pay>div").last().children().text($(".total-order-amount-1>div").last().children().text());

        // 적립금
        $(".total-order-buy-save-point>div").last().children().text(Math.ceil(Number($("#number-pay-price").val())*10/100).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

        // 최종 결제 버튼
        $(".order-complete-btn>span").text($(".total-order-pay>div").last().children().text());
        
        // 최종 결제 금액 hidden
        $("#hidden-total-pay").val(payPrice);
        
        // 구매시 적립금 number값 hidden에 숨김
        $("[name=plusPointEa]").val(Math.ceil(payPrice*10/100));    

        







        // 쿠폰 할인
        $( ".order-coupon" ).on("selectmenuchange", function(){
            const couponVal = Number($(this).val());
            const totalPay =  Number($("#hidden-total-pay").val());

            if(couponVal > totalPay){
                alert("안된다!");
            }else{
                $(".total-order-coupon>div").last().children().text("-"+$(this).val().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                // console.log($(this).val());
                
                // 현재 적용된 쿠폰 가격, 계산을 위해 hidden에 넣어둠
                $("#number-coupon").val($(this).val());
                // 최종 결제 금액 : 주문금액 - 쿠폰 - 적립금
                // 현재 적용된 쿠폰 및 적립금 빼서 계산
                $(".total-order-pay>div").last().children().text(($("#number-pay-price").val()-$(this).val()-$("#hidden-current-point").val()).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                
                // 최종 결제 금액 hidden에 숨김
                $("#hidden-total-pay").val(($("#number-pay-price").val()-$(this).val()-$("#hidden-current-point").val())).trigger('change');

                // 선택된 쿠폰의 이슈쿠폰 번호
                $("[name=issueNo]").val($(this).children(":selected").attr("issueNo"));
                // $("[name=issueNo]").val()
            }
        });


        // 적립금 모두 사용
        $("#all-saved-money").on("click", function(){
            const totalPay =  Number($("#hidden-total-pay").val());
            const myPoint = Number($("#hidden-total-point").val());

            // 1. 내적립금 만원 / 상품 5천원일때
            // [모두사용] 상품가격만 (내적립금>상품)

            // 2. 내적립금 5천원 / 상품 만원일때
            // [모두사용] 내적립금만 (내적립금<상품)
            
            console.log("totalPay : "+totalPay);
            console.log("myPoint :"+myPoint);

            // 최종 결제 금액보다 보유중인 총 적립금이 적으면 최종 결제 금액만 사용됨
            if(myPoint > totalPay){
                console.log("myPoint > totalPay");
                // hidden-total-point
                $(".total-order-saved-money>div").last().children().text("-"+totalPay.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                // input창도 동기화
                $("#input-saved-money").val(totalPay);
                
                // 최종 결제 금액 : 주문금액 - 쿠폰 - 적립금
                $(".total-order-pay>div").last().children().text(($("#number-pay-price").val()-$("#number-coupon").val()-totalPay).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                // 계산을 위해 hidden에 넣어둠
                $("#hidden-current-point").val(totalPay);
                // 최종 결제 금액 hidden에 숨김
                $("#hidden-total-pay").val($("#number-pay-price").val()-$("#number-coupon").val()-totalPay).trigger('change');
            }else{
                console.log("myPoint < totalPay");
                // hidden-total-point
                $(".total-order-saved-money>div").last().children().text("-"+$("#hidden-total-point").val().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                // input창도 동기화
                $("#input-saved-money").val($("#hidden-total-point").val());
                
                // 최종 결제 금액 : 주문금액 - 쿠폰 - 적립금
                $(".total-order-pay>div").last().children().text(($("#number-pay-price").val()-$("#number-coupon").val()-$("#hidden-total-point").val()).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                // 계산을 위해 hidden에 넣어둠
                $("#hidden-current-point").val($("#hidden-total-point").val());
                // 최종 결제 금액 hidden에 숨김
                $("#hidden-total-pay").val($("#number-pay-price").val()-$("#number-coupon").val()-$("#hidden-total-point").val()).trigger('change');
            }
        });

        
        // 적립금 일부 사용
        $("#do-saved-money").on("click", function(){

            const input = Number($("#input-saved-money").val());
            const total = Number($("#hidden-total-point").val());

            const totalPay =  $("#hidden-total-pay").val(); // 최종 결제 금액


            // && 모든 로직은 최종 결제 금액을 넘으면 안됨!
            if(input <= totalPay){
                // 입력한 포인트가 보유중인 총 적립금보다 적으면 입력한 포인트 적용
                if(input < total){
                    $(".total-order-saved-money>div").last().children().text("-"+$("#input-saved-money").val().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                        
                    // 계산을 위해 hidden에 넣어둠
                    $("#hidden-current-point").val($("#input-saved-money").val());

                    // 최종 결제 금액 : 주문금액 - 쿠폰 - 적립금
                    $(".total-order-pay>div").last().children().text(($("#number-pay-price").val()-$("#number-coupon").val()-input).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                    // 최종 결제 금액 hidden에 숨김
                    $("#hidden-total-pay").val($("#number-pay-price").val()-$("#number-coupon").val()-input).trigger('change');
                }else{
                    // 보유 적립금보다 많으면 총 적립금 적용
                    $(".total-order-saved-money>div").last().children().text("-"+$("#hidden-total-point").val().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                    // input창도 동기화
                    $("#input-saved-money").val($("#hidden-total-point").val());
                    
                    // 계산을 위해 hidden에 넣어둠
                    $("#hidden-current-point").val($("#hidden-total-point").val());
                    
                    // 최종 결제 금액 : 주문금액 - 쿠폰 - 적립금
                    $(".total-order-pay>div").last().children().text(($("#number-pay-price").val()-$("#number-coupon").val()-$("#hidden-total-point").val()).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                    // 최종 결제 금액 hidden에 숨김
                    $("#hidden-total-pay").val($("#number-pay-price").val()-$("#number-coupon").val()-$("#hidden-total-point").val()).trigger('change');
                    
                }
            }else{
                alert("최종 결제 금액보다 많은 포인트를 입력하셨습니다.");
            }
            
        });

        // 최종 결제 금액에 따라 적립 포인트 계산
        $("#hidden-total-pay").on("change", function(){
            $(".total-order-buy-save-point>div").last().children().text(Math.ceil(Number($(this).val())*10/100).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

            // number값 hidden에 숨김
          
            // const plusPoint = $(".total-order-buy-save-point>div").last().children().text();
            // Math.ceil(Number($(this).val())*10/100)

            // 결제버튼에 최종 결제 금액 표시
            $(".order-complete-btn>span").text($(".total-order-pay>div").last().children().text());
        })
		
        //결제엔진
        $("#payDirectBtn").on("click",function(){
			const price = $("#hidden-total-pay").val();
			
			const d = new Date();
			
			const memberMail = $("[name=memberMail]").val();
			const memberName = $("[name=memberName]").val();
			const memberPhone = $("[name=memberPhone]").val();
			
			const date = d.getFullYear()+""+(d.getMonth()+1)+""+d.getDate()+""+d.getHours()+""+d.getMinutes()+""+d.getSeconds();
			
			IMP.init("imp35435215");
			IMP.request_pay({
				pg : "html5_inicis",
				pay_method : "card",
				merchant_uid: "상품번호_"+date,//상점에서 관리하는 주문번호
				name: "뭉쳐야산다",//결제이름
				amount : price,
				buyer_email: memberMail,
				buyer_name: memberName,
				buyer_tel: memberPhone
			},function(rsp){
				if(rsp.success){
					$("#alert01").click();
		            
				}else{
					$("#alert02").click();
				}
			});
		});
        //결제 완료 메세지버튼
        $(function () {
            $("#alert01").on("click", function () {
                jQueryAlert('success',"결제 완료");
            });
            $("#alert02").on("click", function () {
                jQueryAlert('error',"결제 실패");
            });

            function jQueryAlert(type, msg) {
                let $type = type;
                let messageBox = msg;
                switch ($type) {
                    case 'success':
                    messageBox = $.parseHTML('<div class="alert__success"></div>');
                    break;
                    case 'error':
                    messageBox = $.parseHTML('<div class="alert__error"></div>');
                    break;
                }
                $("body").append(messageBox);
                $(messageBox).dialog({
                    dialogClass :$type,
                    open: $(messageBox).append(msg),
                    draggable: false,
                    modal: true,
                    buttons: {
                        "OK": function () {
                            $(this).dialog("close");
                            $("#submit").click();
                            
                        }
                    },
                    show: {
                        effect: 'fade',
                        duration: 200 //at your convenience
                    },
                    hide: {
                        effect: 'fade',
                        duration: 200 //at your convenience
                    }
                });
            };
        
        });
		// console.log($("[name=memberNo]"));



    </script>
</body>
</html>