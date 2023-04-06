<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                    <table class="tbl-box">
                        <tr>
                            <th>보내는분</th>
                            <td colspan="2">김띵훈</td>
                        </tr>
                        <tr>
                            <th>휴대폰</th>
                            <td colspan="2">010-1111-1111</td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td colspan="2">1234@naver.com</td>
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
                                <input type="radio" name="deli-address" id="new-input-address"><label for="new-input-address">직접 입력</label>
                                <div>
                                    <input type="text" id="deli-post-number" class="input-noborder" placeholder="우편번호">
                                    <button type="button" class="btn btn-pri size01">주소검색</button>
                                </div>
                                <input type="text" class="input-noborder" placeholder="주소를 입력해주세요">
                                <input type="text" class="input-noborder" placeholder="상세주소를 입력해주세요">
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
                    <div class="order-coupon-box">
                        <h4>쿠폰 / 적립금</h4>
                        <table class="tbl-box">
                            <tr>
                                <th>쿠폰</th>
                                <td colspan="2">
                                    <div class="selectBox-widht-explain" style="width: 100%;">
                                        <select class="select-custom order-coupon" id="order-coupon">
                                            <option value="default" selected>사용 가능한 쿠폰 1장 / 전체 2장</option>
                                            <option value="1">웰컴 쿠폰 10%</option>
                                            <option value="2">5만원이상 1천원 할인</option>
                                            <option value="3">input readonly 될까? 옵션에?</option>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>적립금</th>
                                <td colspan="2" class="saved-money-box">
                                    <div>
                                        <input type="text" placeholder="사용 가능한 적립금 1,000원">
                                        <button type="button" class="btn btn-pri size01">적용</button>
                                        <button type="button" class="btn btn-pri size01">모두 사용</button>
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
                            <input type="checkbox" id="agree1"><label for="agree1">개인정보 수집·이용 및 처리 동의</label>
                            <input type="checkbox" id="agree2"><label for="agree2">전자지급 결제대행 서비스 이용약관 동의</label>
                            <input type="checkbox" id="all-agree"><label for="all-agree">전체 동의</label>
                        </div>
                    </div>
                    <div class="total-pay-box">
                        결제 금액
                        총 얼마 어쩌고
                        저쩌고
                    </div>
                </div>


                <div class="order-complete-box area-btn full">
                    <button class="btn btn-pri size03 order-complete-btn">00원 결제하기</button>
                </div>
            </form>





        </div>
    
    
    
    
    
    
    
    
    
    
    
    
    
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <script>
        $( function() {
			$( ".deli-request" ).selectmenu();
            $( ".order-coupon" ).selectmenu();
		});

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

        // $("#deli-request-button").on("click", function(){
        //     console.log("클릭!!");
        // });

        // $(".ui-menu-item-wrapper").on("click", function(){
        //     // console.log($(this).text());
        //     console.log($(".ui-selectmenu-text").text());
        // });

        // $(".ui-selectmenu-text").on("change", function(){
        //     console.log("변경됨");
        // });

        
        // $("#deli-request-button").attr("aria-labelledby").on("change",function(){
        //     //aria-labelledby="ui-id-3"
        //     console.log($(this).val());
        //     if($(this).val() == 5){
        //         $(".direct-input-deli-request").show();
        //     }else{
        //         $(".direct-input-deli-request").val("");
        //         $(".direct-input-deli-request").hide();
        //     }
        // });
    </script>
</body>
</html>