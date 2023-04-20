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
        /* background-color: #54185c; */
        width: 1200px;
        margin: auto;
    }
    .adminPage-header{
        margin-left: 30px;
    }
    .adminPage-header>div{
        padding-top: 10px;
        padding-bottom: 10px;
    }
    .adminPage-header>div>a{
        color: #54185c;
        list-style: none;
        text-align: center;
        font-size: 40px;
        font-weight: bold;

    }
    .adminPage-back{
        background-color: lightyellow;
        overflow: hidden;
    }
    .adminPage-sidebar{
        float: left;
        width: 300px;
        background-color: #c6cacc;
        height: 2000px;
        text-align: center;
        
    }
    .adminPage-sidebar>ul{
        padding: 0;
        margin: 0;
        list-style: none;
        text-align: left;
        margin-top: 20px;
        

    }
    .adminPage-sidebar>ul>li{
        /* border: 1px solid black; */
        font-size: 20px;
        padding-top: 10px;
        padding-bottom: 10px;
        
        
    }
    .adminPage-sidebar>ul :hover{
        color: #f88000;
        background-color: white;
        
    }
    
    .adminPage-sidebar>ul>li>a{
        text-decoration: none;
        color: #54185c;
        font-weight: bold;
        margin-left: 30px;
    }
    .adminPage-back>ul>li{
        text-decoration: none;
        
    }
    
</style>
<body>
	 <div class="adminPage-sidebar">
	     <ul>
	         <li><a>회원 관리</a></li>
	         <li><a href="/adminMemberPage.do?reqPage=1">회원 관리</a></li><!-- jsp 생성완료 -->
	     </ul>
	     <ul>
	         <li><a>매출 관리</a></li>
	         <li><a href="/adminTotalSalesManage.do?reqPage=1">전체 매출 관리</a></li><!-- jsp 생성완료 -->
	         <li><a href="/categorySalesManage.do">카테고리별 매출관리</a></li>
	     </ul>
	     <ul>
	         <li><a>상품 관리</a></li>
	         <li><a href="/adminTotalProductList.do?reqPage=1">상품 관리</a></li><!-- jsp 생성완료 -->
	         <li><a href="/adminProductRegist.do">상품 등록</a></li>
	         <li><a href="/adminDeliveryManagePage.do?reqPage=1">배송 관리</a></li>
	     </ul>
	     <ul>
	         <li><a>이벤트 관리</a></li>
	         <li><a href="/adminDaycheckManagePage.do">쿠폰 발행 관리</a></li>
	     </ul>
	     <ul>
	         <li><a>여기여기붙어라 관리</a></li>
	         <li><a href="/adminBoardManagePage.do?reqPage=1">여기여기붙어라 게시판 관리</a></li><!-- jsp 생성완료 -->
	         <li><a href="/adminBoardReportManagePage.do?reqPage=1">여기여기붙어라 신고 관리</a></li><!-- jsp 생성완료 -->
	         <li><a>카테고리별 매출관리</a></li>
	     </ul>
	 </div>
</body>
</html>