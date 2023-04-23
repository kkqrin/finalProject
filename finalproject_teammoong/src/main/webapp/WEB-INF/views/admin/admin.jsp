<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <!-- google icon -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	<!--  -->
	<link rel="stylesheet" href="/resources/css/admin/admin.css" />
</head>
<style>
	.adminPage-title{
		margin-bottom: 20px;
	}
    .adminPage-main{
        background-color: lightgreen;
    }
    .adminPage-content{
        background-color: #fff;
        overflow: hidden;
    }
    .material-symbols-outlined{
        font-size: 150px !important;
        
        
    }
    .mainContent{
        float: left;
        width: 280px;
        height: 400px;
        text-align: center;
        border: 1px solid #114757;
       	box-sizing: border-box;
       	border-radius: 15px;
       	margin-bottom: 20px;
       	margin-left: 10px;
       	margin-right: 10px;
       	
    }
    .adminPage-content :hover{
    	color: black;
    	background-color: white;
    }
    
    .c-1{
        background-color: #f88000;
    }
    .c-2{
        background-color: #ffa200;
    }
    .c-3{
        background-color: #bf389f;
    }
    .c-4{
        background-color: #70ad54;
    }
    .c-5{
        background-color: #f1bff8;
    }
    .c-6{
        background-color: #89C9DC;
    }



</style>
<body>
<%-- <jsp:include page="/WEB-INF/views/common/header.jsp" /> --%>
    <div class="adminPage-wrapper">
        <div class="adminPage-header">
            <div class="adminPage-title"><a>Moong's Admin</a></div>
        </div>
        <div class="adminPage-back">
            <jsp:include page="/WEB-INF/views/admin/adminSideNavi.jsp" />
            <div class="adminPage-main">
                <div class="adminPage-content">
                    <div class="mainContent c-1">
                        <div class="member title"><h3>회원수 관리</h3></div>
                        <div class="member icon"><span class="material-symbols-outlined">account_circle</span></div>
                        <div class="member subTitle"><h4>총 회원수</h4></div>
                        <div class="member totalCount"><span id="memberTotalCount"></span><span>명</span></div>
                        <div class="member variationTitle"><h5>증감</h5></div>
                        <div class="member variationCount"><span>+10명/-10명</span></div>
                    </div>
                    <div class="mainContent c-2">
                        <div class="product title"><h3>상품 관리</h3></div>
                        
                        <div class="product icon"><span class="material-symbols-outlined">redeem</span></div>
                        <div class="product subTitle"><h4>오늘 판매된 상품</h4></div>
                        <div class="product totalCount"><span id="productTotalCount"></span><span>개</span></div>
                        <div class="product variationTitle"><h5>증감</h5></div>
                        <div class="product variationCount"><span>+10개/-10개</span></div>
                    </div>
                    <div class="mainContent c-3">
                        <div class="board title"><h3>여기여기붙어라 관리</h3></div>
                        <div class="board icon"><span class="material-symbols-outlined">thumb_up</span></div>
                        <div class="board subTitle"><h4>오늘 등록된 게시물</h4></div>
                        <div class="board totalCount"><span id="boardTotalcount"></span><span>개</span></div>
                        <div class="board variationTitle"><h5>증감</h5></div>
                        <div class="board variationCount"><span>+5개/-5개</span></div>
                    </div>
                    <div class="mainContent c-4">
                        <div class="order title"><h3>매출액 관리</h3></div>
                        <div class="order icon"><span class="material-symbols-outlined">calculate</span></div>
                        <div class="order subTitle"><h4>이번달 매출액</h4></div>
                        <div class="order totalCount"><span id="orderTotalcount"></span><span>원</span></div>
                        <!-- <div class="order variationTitle"><span>증감</span></div>
                        <div class="order variationCount"><span>+50,000,000원/-50,000,000원</span></div> -->
                    </div>
                    <div class="mainContent c-5">
                        <div class="bestProduct title"><h3>베스트 상품 관리</h3></div>
                        <div class="bestProduct icon"><span class="material-symbols-outlined">mode_heat</span></div>
                        <div class="bestProduct subTitle"><h4>베스트 상품 매출액</h4></div>
                        <div class="bestProduct totalCount"><span id="bestProductTotalCount"></span><span>원</span></div>
                        <!-- <div class="bestProduct variationTitle"><span>증감</span></div>
                        <div class="bestProduct variationCount"><span>+20,000,000원/-20,000,000원</span></div> -->
                    </div>
                    <div class="mainContent c-6">
                        <div class="coupon title"><h3>쿠폰 관리</h3></div>
                        <div class="coupon icon"><span class="material-symbols-outlined">festival</span></div>
                        <div class="coupon subTitle"><h4>현지 진행중인 쿠폰 이벤트</h4></div>
                        <div class="coupon totalCount"><span id="couponTotalCount"></span><span>건</span></div>
                        <!-- <div class="coupon variationTitle"><span>증감</span></div>
                        <div class="coupon variationCount"><span>+1건/-1건</span></div> -->
                        
                    </div>
                </div>
            </div>
            <button type="button" class="checkBtn">확인해봅시다</button>
        </div>

    </div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>
    $(document).ready(function(){
        var memberTotalCount = $("#memberTotalCount");
        var productTotalCount = $("#productTotalCount");
        var boardTotalCount = $("#boardTotalcount");
        var orderTotalCount = $("#orderTotalcount");
        var bestProductTotalCount = $("#bestProductTotalCount");
        var couponTotalCount = $("#couponTotalCount");
        
        var memberSpan = $(".member .variationCount");
        var productSpan = $(".product .variationCount");
        var boardSpan = $(".board .variationCount");
        var orderSpan = $(".order .variationCount");

        $.ajax({
            url : "/ajaxTotalCount.do",
            method : "get",
            dataType : "json",
            success : function(data){
            	console.log(data);
                memberTotalCount.text(data[0]);
                if(data[1] > 0){
	                memberSpan.text("+"+data[1]);
	                memberSpan.css("color","blue")
                }else if(data[1] == 0){
                	memberSpan.text(0);
                }else if(data[1] < 0){
                	memberSpan.text("-"+data[1]);
                	memberSpan.css("color","red")
                }
                productTotalCount.text(data[2]);
                if(data[3] > 0){
	                productSpan.text("+"+data[3]);
	                productSpan.css("color","blue")
                }else if(data[3] == 0){
                	productSpan.text(0);
                }else if(data[3] < 0){
                	productSpan.text("-"+data[3]);
                	productSpan.css("color","red")
                }
                boardTotalCount.text(data[4]);
                if(data[5] > 0){
	                boardSpan.text("+"+data[5]);
	                boardSpan.css("color","blue")
                }else if(data[5] == 0){
                	boardSpan.text(0);
                }else if(data[5] < 0){
                	boardSpan.text("-"+data[3]);
                	boardSpan.css("color","red")
                }
                orderTotalCount.text(data[6]);
                if(data[7] > 0){
	                orderSpan.text("+"+data[5]);
	                orderSpan.css("color","blue")
                }else if(data[7] == 0){
                	orderSpan.text(0);
                }else if(data[7] < 0){
                	orderSpan.text("-"+data[3]);
                	orderSpan.css("color","red")
                }
                /* bestProductTotalCount.text(data[8]);
                couponTotalCount.text(data[5]);  */
            }
            
        })
        
    })
    	/* 
        $(".checkBtn").on("click",function(){
	        $.ajax({
	            url : "/ajaxTotalCount.do",
	            method : "get",
	            dataType : "json",
	            success : function(data){
	            	console.log("통신성공");
	            	console.log(data);
	                memberTotalCount.text(data[0]);
	                productTotalCount.text(data[1]);
	                boardTotalCount.text(data[2]);
	                orderTotalCount.text(data[3]);
	                bestProductTotalCount.text(data[4]);
	                couponTotalCount.text(data[5]); 
	            }
	            
	        })
        	
        }) */
        
        
        
        

    </script>
</body>
</html>