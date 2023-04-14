<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Document</title>
<head>
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

</style>
<body>
	 <div class="adminPage-sidebar">
	     <ul>
	         <li>회원 관리</li>
	         <il><a href="/adminMemberPage.do?reqPage=1">회원 관리</a></il><!-- jsp 생성완료 -->
	     </ul>
	     <ul>
	         <li>매출 관리</li>
	         <li><a href="/adminTotalSalesManage.do?reqPage=1">전체 매출 관리</a></li><!-- jsp 생성완료 -->
	         <li><a href="/categorySalesManage.do">카테고리별 매출관리</a></li>
	     </ul>
	     <ul>
	         <li>상품 관리</li>
	         <li><a href="/adminTotalProductList.do?reqPage=1">상품 관리</li><!-- jsp 생성완료 -->
	         <li><a href="/adminProductRegist.do"></a>상품 등록</li>
	         <li><a href="/adminDeliveryManagePage.do?reqPage=1"></a>배송 관리</li>
	     </ul>
	     <ul>
	         <a>이벤트 관리</a>
	         <li>쿠폰 발행 관리</li>
	     </ul>
	     <ul>
	         <li>여기여기붙어라 관리</li>
	         <li><a href="/adminBoardManagePage.do?reqPage=1">여기여기붙어라 게시판 관리</a></li><!-- jsp 생성완료 -->
	         <li><a href="/adminBoardReportManagePage.do?reqPage=1">여기여기붙어라 신고 관리</a></li><!-- jsp 생성완료 -->
	         <li>카테고리별 매출관리</li>
	     </ul>
	 </div>
</body>
</html>