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

</head>
<style>
    .adminPage-wrapper{
        background-color: #111;
        width: 1200px;
        margin: auto;
    }
    .adminPage-header{
        margin-left: 30px;
    }
    .adminPage-back{
        background-color: lightyellow;
        overflow: hidden;
    }
    .adminPage-sidebar{
        float: left;
        width: 300px;
        background-color: lightcoral;
        height: 2000px;
    }
    .adminPage-sidebar>ul>li{
        text-decoration: none;
        
    }
    .adminPage-main{
        background-color: lightgreen;
    }
    .adminPage-content{
        background-color: #fff;
        overflow: hidden;
    }
    .material-symbols-outlined{
        font-size: 150px;
        
    }
    .mainContent{
        float: left;
        width: 300px;
        height: 400px;
        text-align: center;
    }
    .icon{

    }
    .mainContent>div>h2{

    }
    .mainContent>div>h3{
        
    }
    .mainContent>div>h4{
        
    }


</style>
<body>
<%-- <jsp:include page="/WEB-INF/views/common/header.jsp" /> --%>
    <div class="adminPage-wrapper">
        <div class="adminPage-header">
            <h1><a href="#">관리자 페이지 입니다.</a></h1>
        </div>
        <div class="adminPage-back">
            <div class="adminPage-sidebar">
                <ul>
                    <li>회원 관리</li>
                    <li><a href="/adminMemberPage.do?reqPage=1">회원 관리</a></li><!-- jsp 생성완료 -->
                </ul>
                <ul>
                    <li>매출 관리</li>
                    <li><a href="/adminTotalSalesManage.do?reqPage=1">전체 매출 관리</a></li><!-- jsp 생성완료 -->
                    <li><a href="/categorySalesManage.do">카테고리별 매출관리</a></li>
                </ul>
                <ul>
                    <li>상품 관리</li>
                    <li><a href="/adminTotalProductList.do?reqPage=1">전체 상품 관리</li><!-- jsp 생성완료 -->
                    <li><a href="/adminProductRegist.do"></a>상품 등록</li>
                    <li><a href="/adminDeliveryManagePage.do?reqPage=1"></a>배송 관리</li>
                </ul>
                <ul>
                    <li>이벤트 관리</li>
                    <li>쿠폰 발행 관리</li>
                </ul>
                <ul>
                    <li>여기여기붙어라 관리</li>
                    <li><a href="/adminBoardManagePage.do?reqPage=1">여기여기붙어라 게시판 관리</a></li><!-- jsp 생성완료 -->
                    <li><a href="/adminBoardReportManagePage.do?reqPage=1">여기여기붙어라 신고 관리</a></li><!-- jsp 생성완료 -->
                    <li>카테고리별 매출관리</li>
                </ul>
            </div>
            <div class="adminPage-main">
                <div class="adminPage-content">
                    <div class="mainContent">
                        <div class="member title"><h3>회원수 관리</h3></div>
                        <div class="member icon"><span class="material-symbols-outlined">account_circle</span></div>
                        <div class="member subTitle"><h4>총 회원수</h4></div>
                        <div class="member totalCount"><span id="memberTotalCount"></span><span>명</span></div>
                        <div class="member variationTitle"><h5>증감</h5></div>
                        <div class="member variationCount"><span>+10명/-10명</span></div>
                    </div>
                    <div class="mainContent">
                        <div class="product title"><h3>상품 관리</h3></div>
                        <div class="product icon"><span class="material-symbols-outlined">redeem</span></div>
                        <div class="product subTitle"><h4>오늘 판매된 상품</h4></div>
                        <div class="product totalCount"><span id="productTotalCount"></span><span>개</span></div>
                        <div class="product variationTitle"><h5>증감</h5></div>
                        <div class="product variationCount"><span>+10개/-10개</span></div>
                    </div>
                    <div class="mainContent">
                        <div class="board title"><h3>여기여기붙어라 관리</h3></div>
                        <div class="board icon"><span class="material-symbols-outlined">thumb_up</span></div>
                        <div class="board subTitle"><h4>오늘 등록된 게시물</h4></div>
                        <div class="board totalCount"><span id="boardTotalcount"></span><span>개</span></div>
                        <div class="board variationTitle"><h5>증감</h5></div>
                        <div class="board variationCount"><span>+5개/-5개</span></div>
                    </div>
                    <div class="mainContent">
                        <div class="order title"><h3>매출액 관리</h3></div>
                        <div class="order icon"><span class="material-symbols-outlined">calculate</span></div>
                        <div class="order subTitle"><h4>이번달 매출액</h4></div>
                        <div class="order totalCount"><span id="orderTotalcount"></span><span>원</span></div>
                        <!-- <div class="order variationTitle"><span>증감</span></div>
                        <div class="order variationCount"><span>+50,000,000원/-50,000,000원</span></div> -->
                    </div>
                    <div class="mainContent">
                        <div class="bestProduct title"><h3>베스트 상품 관리</h3></div>
                        <div class="bestProduct icon"><span class="material-symbols-outlined">mode_heat</span></div>
                        <div class="bestProduct subTitle"><h4>베스트 상품 매출액</h4></div>
                        <div class="bestProduct totalCount"><span id="bestProductTotalCount"></span><span>원</span></div>
                        <!-- <div class="bestProduct variationTitle"><span>증감</span></div>
                        <div class="bestProduct variationCount"><span>+20,000,000원/-20,000,000원</span></div> -->
                    </div>
                    <div class="mainContent">
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
        var memberTotalCount = $("#memberTotalCount");
        var productTotalCount = $("#productTotalCount");
        var boardTotalCount = $("#boardTotalcount");
        var orderTotalCount = $("#orderTotalcount");
        var bestProductTotalCount = $("#bestProductTotalCount");
        var couponTotalCount = $("#couponTotalCount");

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
        	
        })

    </script>
</body>
</html>