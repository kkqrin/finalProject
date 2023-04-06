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
        margin-top: 300px;
        
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
    .adminPage-back>ul>li{
        text-decoration: none;
    }
</style>
<body>
    <div class="adminPage-wrapper">
        <div class="adminPage-header">
            <h1><a href="#">Admin-Page</a></h1>
        </div>
        <div class="adminPage-back">
            <div class="adminPage-sidebar">
                <ul>
                    <a href="/adminMemberPage.do">회원 관리</a>
                    <il><a href="/manageMemberGrade.do">회원등급 관리</a></il>
                </ul>
                <ul>
                    <a href="/adminSalesManagePage.do">매출 관리</a>
                    <li><a href="/totalSalesManage.do">전체 매출 관리</a></li>
                    <li><a href="/categorySalesManage.do">카테고리별 매출관리</a></li>
                </ul>
                <ul>
                    <a href="/adminProductPage.do">상품 관리</a>
                    <li><a href="/productConfirmManage.do">상품 등록 관리</a></li>
                    <li><a href="/productRegist.do"></a>상품 등록</li>
                    <li><a href="/deliveryManage.do"></a>배송 관리</li>
                </ul>
                <ul>
                    <a>이벤트 관리</a>
                    <li>쿠폰 발행 관리</li>
                </ul>
                <ul>
                    <a href="/adminBoardManagePage.do">여기여기붙어라 관리</a>
                    <li>여기여기붙어라 게시판 관리</li>
                    <li>여기여기붙어라 신고 관리</li>
                    <li>카테고리별 매출관리</li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>