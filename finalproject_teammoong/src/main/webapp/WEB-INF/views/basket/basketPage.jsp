<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="content-wrap">
        <div><h1>장바구니</h1></div>
        <div class="content-wrap" style="display: flex;">
            <div class="basket-content">
                <div class="all-check">
                    <input type="checkbox" id="allCheck"> 
                    <label for="all-check">전체선택</label>
                    <span><button type="button" class="checkDelete">선택삭제</button></span>
                </div>
                <div class="basket-list">
                    <input type="checkbox" name="productCheckBox">
                    <img src="" style="width: 100px; height: 100px;">
                    <a>[플랜터스] 허니 로스트 피넛</a>
                    <button style="width: 30px; height: 30px;" class="minus-btn">-</button>
                    <input type="text" class="product-ea" value="1" style="width: 30px; height: 30px; padding: 0; box-sizing: border-box;">
                    <button style="width: 30px; height: 30px;" class="plus-btn">+</button>
                    <a>9,980원</a>
                    <button type="button">x</button>
                </div>
                <div class="product-calc-box" style="background-color: bisque; width: 300px; height: 500px;">
                    <div class="all-price">총상품금액
                    <ul>
                        <li>1. 허니로스트피넛</li>
                    </ul>
                    </div>
                    <div class="all-discount">상품할인금액
                        <ul>
                            <li>1. 허니로스트피넛</li>
                        </ul>
                    </div>
                    <div class="all-pay-price">총결제금액
                        <div>100,000원</div>
                    </div>
                </div>    
            </div>
        </div>
    </div>
    <script>
        $(".plus-btn").on("click",function(){
            let productEa = $(this).prev().val();
            if(productEa >= 1){//&&재고수량보다 낮게적용해야함
                productEa++;
                $(this).prev().val(productEa);
            }
        });
        $(".minus-btn").on("click",function(){
            let productEa = $(this).next().val();
            console.log(productEa);
            if(productEa > 1){
                productEa--;
                $(this).next().val(productEa);
            }
        });
        $("#allCheck").click(function(){
            if($(this).is(":checked")){ //대상이 체크 되어 있을 때
                //모든 체크박스 체크
                $("[name=productCheckBox]").attr("checked", true);
            }else{ //대상이 체크 해제 되어 있을 때
                //모든 체크박스 체크해제
                $("[name=productCheckBox]").attr("checked", false);
            }
        });
        $("#allCheck").change(function(){
            if($(this).is(":checked")){ //대상이 체크 되어 있을 때
            //같은 네임을 가진 체크박스 체크
            $("[name=productCheckBox]").prop("checked", true);
            }else{ //대상이 체크 해제 되어 있을 때
                //같은 네임을 가진 체크박스 체크해제
            $("[name=productCheckBox]").prop("checked", false);
            }
        });      
</body>
</html>