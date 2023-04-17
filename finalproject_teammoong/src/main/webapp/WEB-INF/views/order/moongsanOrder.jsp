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
            남은 일 : 주소검색 API, 유효성 검사 (나쁜사용자)
        </pre>
        <div class="order-sheet-wrap">
            <h1>뭉쳐야산다!</h1>
            <form action="#" method="post">
                <div class="order-product-box">
                    <h4>
                        주문 상품
                        <!-- <span class="material-symbols-outlined order-product-expand-less">expand_less</span>
                        <span class="material-symbols-outlined order-product-expand-more">expand_more</span> -->
                    </h4>
                    
                    <!-- 상품 리스트 요약 -->
                    <!-- <div class="order-product-item total-product-count-box">
                        <div class="order-product-info total-product-count">
                            <div class="order-product-title">
                                    <span id="first-product-name"></span> 등 현재 주문 상품은 총 [<span id="order-product-count"></span>]건
                            </div>
                        </div>
                    </div> -->
                    
                    
                    
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
                            <div class="order-product-volume">1개</div>
                            <div class="order-product-price"><span></span>원</div>
                            <input type="hidden" class="product-price" value="${i.productPrice }">
							<input type="hidden" class="product-discount" value="${i.productDiscount }">
                            <!-- ${i.productPrice } * ( 100 - ${i.productDiscount }) / 100 -->
                            <!-- .toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") -->
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
                                <input type="text" id="deli-member" class="input-noborder" placeholder="이름을 입력해주세요">
                            </td>
                        </tr>
                        <tr>
                            <th><label for="deli-phone">휴대폰</label></th>
                            <td colspan="2">
                                <input type="text" id="deli-phone" class="input-noborder" placeholder="'-' 제외 숫자만 입력해주세요">
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
                                <input type="text" id="deli-addr" class="input-noborder" placeholder="주소를 입력해주세요">
                                <input type="text" id="deli-addr2" class="input-noborder" placeholder="상세주소를 입력해주세요">
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
                                                <option value="0" selected>사용 가능한 쿠폰 ${couponCount }장</option>
                                                <c:forEach items="${couponList }" var="i">
                                                <option value="${i.couponPrice }">${i.couponTitle }( <fmt:formatNumber value="${i.couponPrice }"/>원 할인 / ~ ${i.endDate } )</option>
                                                </c:forEach>
                                                <option value="2" disabled>5만원이상 1천원 할인</option>
                                            </select>
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
                                            <input type="hidden" id="hidden-current-point" value="0">
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <h3>뭉쳐야산다의 공동구매 제품은 뭉산머니로만 결제가 가능합니다.</h3>
                        <h4>뭉산머니가 부족한 경우 충전후 사용해주세요.</h4>
                        <h4>뭉산머니 충전하러 가기 >>>>> 1. 마이페이지의 적립금 2. 모달? 새창? 띄워서 3. 그냥 이니시스 결제를 -> 적립금 (4만원대면 5만원 충전되는방식)</h4>
                        <!-- <div class="order-pay-box">
                            <h4>결제 수단</h4>
                            <div>
                                <button type="button" class="btn btn-pri size02">신용카드</button>
                            </div>
                        </div> -->
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

                        <input type="hidden" id="number-pay-price">
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
                        <input type="hidden" id="hidden-total-pay">

                        <div class="total-order-buy-save-point">
                            <button type="button" class="btn btn-pri">적립</button>
                            <div style="margin-right: 5px;">구매시</div>
                            <div><span></span>원 (10%)</div>
                        </div>
                    </div>
                </div>


                <div class="order-complete-box area-btn full">
                    <button class="btn btn-pri size03 order-complete-btn">00원 결제하기</button>
                </div>
            </form>





        </div>
    
    

    
    
    
    
    
    
    
    
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    <!-- 주문 js -->
    <script src="/resources/js/order.js"></script>

    <script>
        $( function() {
			$( ".deli-request" ).selectmenu();
            $( ".order-coupon" ).selectmenu();
		});

        // 상품 개수
        // $("#order-product-count").text($(".order-product-item").length-1);

        // // 상품 이름
        // if($(".order-product-title").eq(1).children().text().length > 30){
        //     $("#first-product-name").text($(".order-product-title").eq(1).children().text().substr(0,30)+"..");
        // }else{
        //     $("#first-product-name").text($(".order-product-title").eq(1).children().text());
        // }


        // 배송 요청
        $(".deli-request").on("selectmenuchange", function(){
            // jQuery ui select change 이벤트
            if($(this).val() == 5){
                $(".direct-input-deli-request").show();
            }else{
                $(".direct-input-deli-request").val("");
                $(".direct-input-deli-request").hide();
            }
            console.log($(this).val());
        })


        // 더보기 버튼과 주문한 상품 정보 숨기기
        // $(".order-product-expand-less").hide();
        // $(".order-product-item").hide();
        // $(".total-product-count-box").show();

        // $(".order-product-expand-more").on("click",function(){
        //     $(".order-product-expand-less").show();
        //     $(".order-product-expand-more").hide();
        //     // 주문한 상품 전체보기
        //     $(".order-product-item").show();
        //     // 주문 상품 전체 개수 숨기기
        //     $(".total-product-count-box").hide();
        // });
        // $(".order-product-expand-less").on("click",function(){
        //     $(".order-product-expand-more").show();
        //     $(".order-product-expand-less").hide();
        //     // 주문한 상품 전체 숨기기
        //     $(".order-product-item").hide();
        //     // 주문 상품 전체 개수 보이기
        //     $(".total-product-count-box").show();
        // });

        // 상품리스트 상품 가격 + 화폐 단위
		for(let i=0;i<$(".order-product-price").length;i++){
			// console.log($(".cart-product-price").length);

			const productPrice = $(".product-price").eq(i).val();
			const productDiscount = $(".product-discount").eq(i).val();
			
			// Math.floor(productPrice*(100 - productDiscount)/1000)*10)
			$(".order-product-price").eq(i).children().text((Math.floor(productPrice*(100 - productDiscount)/1000)*10).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		};


        // 결제 금액
        let productPriceSum = 0;
        let discountPrice = 0;
        let payPrice = 0;
        for(let i=0;i<$(".product-price").length;i++){
            const productPrice = $(".product-price").eq(i).val();
            const productDiscount = $(".product-discount").eq(i).val();

            // 할인 전 원래 가격(상품금액)
            productPriceSum = Number(productPriceSum) + Number(productPrice);
            $(".total-order-amount-2>div").last().children().text((productPriceSum).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));


            // 할인되는 금액(할인금액)
            discountPrice = Number(discountPrice) + Number(productPrice-(Math.floor(productPrice*(100 - productDiscount)/1000)*10));
            $(".total-order-amount-3>div").last().children().text(discountPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

            // 주문금액 (결제할 금액)
            payPrice = Number(payPrice) + Number((Math.floor(productPrice*(100 - productDiscount)/1000)*10));
            $(".total-order-amount-1>div").last().children().text(payPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
            
            // 최종 결제 금액 계산을 위해 hidden에 넣어둠
            $("#number-pay-price").val(payPrice);

            // 최종 결제 금액 = 주문금액 (- 쿠폰(0) - 적립금(0))
            $(".total-order-pay>div").last().children().text($(".total-order-amount-1>div").last().children().text());

            // 적립금
            $(".total-order-buy-save-point>div").last().children().text(Math.ceil(Number($("#number-pay-price").val())*10/100).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
        }

        // 쿠폰 할인
        $( ".order-coupon" ).on("selectmenuchange", function(){
            $(".total-order-coupon>div").last().children().text("-"+$(this).val().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
            // console.log($(this).val());

            // 현재 적용된 쿠폰 가격, 계산을 위해 hidden에 넣어둠
            $("#number-coupon").val($(this).val());
            // 최종 결제 금액 : 주문금액 - 쿠폰 - 적립금
            // 현재 적용된 쿠폰 및 적립금 빼서 계산
            $(".total-order-pay>div").last().children().text(($("#number-pay-price").val()-$(this).val()-$("#hidden-current-point").val()).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));

            // 최종 결제 금액 hidden에 숨김
            $("#hidden-total-pay").val(($("#number-pay-price").val()-$(this).val()-$("#hidden-current-point").val())).trigger('change');
        });


        // 적립금 모두 사용
        $("#all-saved-money").on("click", function(){
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
        });

        // 적립금 일부 사용
        $("#do-saved-money").on("click", function(){
            const input = Number($("#input-saved-money").val());
            const total = Number($("#hidden-total-point").val());

            if(input < total){
                $(".total-order-saved-money>div").last().children().text("-"+$("#input-saved-money").val().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
                // input창도 동기화
                $("#input-saved-money").val($("#input-saved-money").val());

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
            
        });

        // 최종 결제 금액에 따라 적립 포인트 계산
        $("#hidden-total-pay").on("change", function(){
            $(".total-order-buy-save-point>div").last().children().text(Math.ceil(Number($(this).val())*10/100).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
        })

        
    </script>
</body>
</html>