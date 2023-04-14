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
        <pre>
            남은 일 : 적립금 [적용][모두사용] 버튼 구현 , 주소검색, 주문자 정보와 동일
        </pre>
        <div class="order-sheet-wrap">
            <h1>주문서</h1>
            <form action="#" method="post">
                <div class="order-product-box">
                    <h4>
                        주문 상품
                        <span class="material-symbols-outlined order-product-expand-less">expand_less</span>
                        <span class="material-symbols-outlined order-product-expand-more">expand_more</span>
                    </h4>
                    <div class="order-product-item total-product-count-box">
                        <!-- <div class="order-product-img">
                            <a href="#">
                                <img src="/resources/img/product/lactofit.jpg" />
                            </a>
                        </div> -->
                        <div class="order-product-info total-product-count">
                            <div class="order-product-title">
                                <!-- <a href="#"> -->
                                    [3월 한정 파격특가][종근당건강] 락토핏 ..<!-- 생유산균 골드(50포) 3통 (150일분) / 온가족 유산균 --> 외에 상품 [2]개를 주문하셨습니다.
                                <!-- </a> -->
                            </div>
                            <!-- <div class="order-product-option">3통 120포</div> -->
                        </div>
                        <!-- <div class="order-product-volume">1개</div>
                        <div class="order-product-price">1,000원</div> -->
                    </div>
                    <div class="order-product-item">
                        <div class="order-product-img">
                            <a href="#">
                                <img src="/resources/img/product/lactofit.jpg" />
                            </a>
                        </div>
                        <div class="order-product-info">
                            <div class="order-product-title">
                                <a href="#">
                                    [3월 한정 파격특가][종근당건강] 락토핏 생유산균 골드(50포) 3통 (150일분) / 온가족 유산균
                                </a>
                            </div>
                            <div class="order-product-option">3통 120포</div>
                        </div>
                        <div class="order-product-volume">1개</div>
                        <div class="order-product-price">1,000원</div>
                    </div>
                    <div class="order-product-item">
                        <div class="order-product-img">
                            <a href="#">
                                <img src="/resources/img/product/lactofit.jpg" />
                            </a>
                        </div>
                        <div class="order-product-info">
                            <div class="order-product-title">
                                <a href="#">
                                    [3월 한정 파격특가][종근당건강] 락토핏 생유산균 골드(50포) 3통 (150일분) / 온가족 유산균
                                </a>
                            </div>
                            <div class="order-product-option">3통 120포</div>
                        </div>
                        <div class="order-product-volume">1개</div>
                        <div class="order-product-price">1,000원</div>
                    </div>
                </div>
                <div class="order-member-box">
                    <h4>주문자 정보</h4>
                    <table class="tbl-box" style="margin-top: 20px;">
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
                                <input type="radio" name="deli-address" id="new-input-address" checked><label for="new-input-address">직접 입력</label>
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
                    <div>
                        <div class="order-coupon-box">
                            <h4>쿠폰 / 적립금</h4>
                            <table class="tbl-box" style="margin-top: 20px;">
                                <tr>
                                    <th>쿠폰</th>
                                    <td colspan="2">
                                        <div class="selectBox-widht-explain" style="width: 100%;">
                                            <select class="select-custom order-coupon" id="order-coupon">
                                                <option value="default" selected>사용 가능한 쿠폰 1장 / 전체 2장</option>
                                                <option value="1">웰컴 쿠폰 10%</option>
                                                <option value="2" disabled>5만원이상 1천원 할인</option>
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

                        <!-- <div class="total-order-amount-box"> -->
                        <div class="total-order-amount-1">
                            <div>주문금액</div>
                            <div>42,800원</div>
                        </div>
                        <div class="total-order-amount-2">
                            <div>└ 상품 금액</div>
                            <div>44,800원</div>
                        </div>
                        <div class="total-order-amount-3">
                            <div>└ 상품 할인 금액</div>
                            <div>- 2,000원</div>
                        </div>
                        <!-- </div> -->

                        <div class="total-order-delivery-fee">
                            <div>배송비</div>
                            <div>0원</div>
                        </div>
                        <div class="total-order-coupon">
                            <div>쿠폰 할인</div>
                            <div>0원</div>
                        </div>
                        <div class="total-order-saved-money">
                            <div>적립금 사용</div>
                            <div>0원</div>
                        </div>

                        <div class="total-order-pay">
                            <div>최종 결제 금액</div>
                            <div>42,800원</div>
                        </div>

                        <div class="total-order-buy-save-point">
                            <button type="button" class="btn btn-pri">적립</button>
                            <div>구매시</div>
                            <div>2,180원 (5%)</div>
                        </div>
                    </div>
                </div>


                <div class="order-complete-box area-btn full">
                    <button class="btn btn-pri size03 order-complete-btn">00원 결제하기</button>
                </div>
            </form>





        </div>
    
    
    
    
    	            <div class="box-round">
                <h3 class="section-tit">alert</h3>
                
                <div class="area-btn left">
                    <button class="btn btn-border-pri size01" type="button" id="alert01">성공</button>
                    <button class="btn btn-border-sec size01" type="button" id="alert02">에러</button>
                    <button class="btn btn-border-ter size01" type="button" id="alert03">경고</button>
                    <button class="btn btn-border-black size01" type="button" id="alert04">정보</button>
                </div>
            </div><!--알림 div-->
    
    
    
    
    
    
    
    
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


        // 약관 전체 동의
        $(document).ready(function() {
            $("#all-agree").click(function() {
                if($("#all-agree").is(":checked")){
                    $("input[name=chk]").prop("checked", true);
                }else{
                    $("input[name=chk]").prop("checked", false);
                } 
            });

            $("input[name=chk]").click(function() {
                var total = $("input[name=chk]").length;
                var checked = $("input[name=chk]:checked").length;

                if(total != checked){
                    $("#all-agree").prop("checked", false);
                }else{
                    $("#all-agree").prop("checked", true); 
                }
            });
        });
        

    </script>
</body>
</html>