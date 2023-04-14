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
            <jsp:include page="/WEB-INF/views/admin/adminSideNavi.jsp" />
            <div class="adminPage-main">
                <div class="adminPage-content">
                    <div class="adminPage-search">
                        <select id="orderSearchSelect">
                            <option name="orderNo" value="orderNo">주문번호 검색</option>
                            <option name="orderName" value="orderName">주문자 이름 검색</option>
                            <option name="orderStatus" value="orderStatus">주문 상태 검색</option>
                        </select>
                        <input type="text" name="orderSearchBox" id="searchOption">
                        <!-- 주문 상태 검색 시 1,2,3,4 로 변환해주는 절차 필요 -->
                        <button type="button" name="searchSubmitBtn">검색</button>
                    </div>
                    <div class="adminPage-result">
                        <table>
                            <tr>
                            	<td>구분</td>
                                <td>주문번호</td>
                                <td>상품번호</td>
                                <td>회원번호</td>
                                <td>결제번호</td>
                                <td>주문일자</td>
                                <td>주문상태</td> <!-- choose -->
                                <td>수량</td> 
                                <td>가격</td>
                                <td>배송주소</td> 
                                <td>결제상태</td> <!-- choose -->
                            </tr>
                            <c:forEach items="${orderList }" var="o">
                                <tr>
                                	<td><input type="checkBox" id="checkBox"></td>
                                    <td>${o.orderNo }</td>
                                    <td>${o.productNo }</td>
                                    <td>${o.memberNo }</td>
                                    <td>${o.payNo }</td>
                                    <td>${o.orderDate }</td>
                                    <td>${p.productCost }</td>
                                    <c:choose>
                                    	<c:when test="${o.orderStatus == 1 }">
                                    		<td>결제완료</td>
                                    	</c:when>
                                    	<c:when test="${o.orderStatus == 2 }">
                                    		<td>배송준비중</td>
                                    	</c:when>
                                    	<c:when test="${o.orderStatus == 3 }">
                                    		<td>배송중</td>
                                    	</c:when>
                                    	<c:when test="${o.orderStatus == 4 }">
                                    		<td>배송완료</td>
                                    	</c:when>
                                    		<c:when test="${o.orderStatus == 5 }">
                                    		<td>결제취소</td>
                                    	</c:when>
                                    		<c:when test="${o.orderStatus == 6 }">
                                    		<td>환불완료</td>
                                    	</c:when>
                                    </c:choose>
                                    <td>${o.orderDetailCnt }</td>
                                    <td>${o.orderDetailPrice }</td>
                                    <td>${o.deliveryAddress }</td>
                                    <c:choose><!-- 명훈님한테 물어보기, 주문상태하고 겹치는 내용 -->
                                    	<c:when test="${o.payStatus == 1 }">
                                    		<td>결제완료</td>
                                    	</c:when>
                                    	<c:when test="${o.payStatus == 2 }">
                                    		<td>결제취소</td>
                                    	</c:when>
                                    </c:choose>
                                    <td>
                                        <select name="orderStatusList"><!-- 명훈님한테 물어보고 변경할 것 -->
                                            <option name="orderStatusList" value="0">결제완료</option>
                                            <option name="orderStatusList" value="1">결제취소</option>
<!--                                             <option name="orderStatusList" value="2">보류</option>
                                            <option name="orderStatusList" value="3">만료</option>
                                            <option name="orderStatusList" value="3">만료</option>
                                            <option name="orderStatusList" value="3">만료</option> -->
                                        </select>
                                    </td>
                                    <td><button type="button" id="changeOrderStatusBtn">상품 상태 변경</button></td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <th colspan="11">${o.pageNavi}</th>
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