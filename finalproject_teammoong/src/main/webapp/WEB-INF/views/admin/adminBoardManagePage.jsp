<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    .adminPage-sidebar>ul>li{
        list-style-type: none;
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
    <c:if test="${not empty sessionScope.m and sessionScope.m.memberStatus == 0}">
        <!-- 관리자일때만 페이지 보이게 세팅 -->
    </c:if>
    <div class="adminPage-wrapper">
        <div class="adminPage-header">
            <h1><a href="#">Admin-Page</a></h1>
        </div>
        <div class="adminPage-back">
            <div class="adminPage-sidebar">
                <ul>
                    <a href="/adminMemberPage.do?reqPage=1">회원 관리</a>
                    <li><a href="/manageMemberGrade.do">회원등급 관리</a></li>
                </ul>
                <ul>
                    <a>매출 관리</a>
                    <li><a href="/adminTotalSalesManage.do?reqPage=1">전체 매출 관리</a></li>
                    <li><a href="/categorySalesManage.do">카테고리별 매출관리</a></li>
                </ul>
                <ul>
                    <a href="/adminTotalProductList.do?reqPage=1">상품 관리</a>
                    <li><a href="/productConfirmManage.do">상품 등록 관리</a></li>
                    <li><a href="/productRegist.do?reqPage=1"></a>상품 등록</li>
                    <li><a href="/deliveryManage.do"></a>배송 관리</li>
                </ul>
                <ul>
                    <a>이벤트 관리</a>
                    <li>쿠폰 발행 관리</li>
                </ul>
                <ul>
                    <a href="/adminBoardManagePage.do">여기여기붙어라 관리</a>
                    <li><a href="/allBoardList.do?reqPage=1">여기여기붙어라 게시판 관리</a></li>
                    <li><a href="/adminBoardReportManagePage.do?reqPage=1">여기여기붙어라 신고 관리</a></li>
                    <li>카테고리별 매출관리</li>
                </ul>
            </div>
            <div class="adminPage-main">
                <div class="adminPage-content">
                    <div class="adminPage-search">
                        <select id="boardSearchSelect">
                            <option name="boardNo" value="boardNo">주문번호 검색</option>
                            <option name="boardName" value="boardName">주문자 이름 검색</option>
                            <option name="boardStatus" value="boardStatus">주문 상태 검색</option>
                        </select>
                        <input type="text" name="boardSearchBox" id="searchOption">
                        <!-- 주문 상태 검색 시 1,2,3,4 로 변환해주는 절차 필요 -->
                        <button type="button" name="searchSubmitBtn">검색</button>
                    </div>
                    <div class="boardStatus">
                    	<div class="boardSalse-wrap">
	                    	<div class="boardTotalStatus">
	                    	
	                    	</div>
	                    	<div class="boardMonthStatus">
	                    	
	                    	</div>
                    	</div>
                    </div>
                    <div class="adminPage-result">
                        <table>
                            <tr>
                           		<td>구분</td>
                            	<td>게시글 번호</td>
                                <td>카테고리 번호</td>
                                <td>상품가격</td>
                                <td>게시일자</td>
                                <td>공구 시작일</td>
                                <td>공구 마감일</td>
                                <td>공구 진행여부</td>
                            </tr>
                            <c:forEach items="${boardList }" var="b">
                                <tr>
                                	<td><input type="checkBox" id="checkBox"></td>
                                    <td>${b.boardNo }</td>
                                    <td>${b.categoryNo }</td>
                                    <td>${b.detailName }</td>
                                    <td>${b.boardPrice }</td>
                                    <td>${b.boardStart }</td>
                                    <td>${b.boardEnd }</td>
                                    <td>
                                       	<c:choose>
	                                    	<c:when test="${b.boardStatus == 1 }">
	                                    		<td>진행</td>
	                                    	</c:when>
	                                    	<c:when test="${b.boardStatus == 2 }">
	                                    		<td>마감</td>
	                                    	</c:when>
                                    	</c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <th colspan="8">${b.pageNavi}</th>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>


<!-- 스크립트를 넣어봅시다 -->
    <script>
	
        
    </script>
    
</body>
</html>