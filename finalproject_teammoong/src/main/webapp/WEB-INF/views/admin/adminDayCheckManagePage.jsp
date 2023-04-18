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
	<!-- data tables -->
	<link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/> 
	<script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
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
    #orderStatusSelect{
    	display: none;
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
            <div class="adminPage-main">
                <div class="adminPage-content">
                    <div class="adminPage-search">
                        <select id="orderSearchSelect">
                            <option value="orderNo">주문번호 검색</option>
                            <option value="memberName">주문자 이름 검색</option>
                            <option value="orderStatus">주문 상태 검색</option>
                        </select>
                        <input type="text" name="orderSearchBox" id="searchOption">
                        <!-- 주문 상태 검색 시 1,2,3,4 로 변환해주는 절차 필요 -->
                        <select id="orderStatusSelect">
                        	<option value="1">결제완료</option>
                        	<option value="2">배송준비중</option>
                        	<option value="3">배송중</option>
                        	<option value="4">배송완료</option>
                        	<option value="5">결제취소</option>
                        	<option value="6">환불완료</option>
                        </select>
                        <button type="button" name="searchSubmitBtn">검색</button>
                    </div>
                    <div class="adminPage-result">
                        <table id="dataTables" class="table table-bordered">
                            <tr>
                            	<th>구분</th>
                                <th>회원번호</th> <!-- c.d.p 공통 -->
                                <th>적립내역</th> <!--  -->
                                <th>적립포인트명</th> <!-- c.d.p 공통 -->
                                <th>적립포인트</th> <!-- c.d.p 공통 -->
                                <th>적립일시</th> <!-- c.d.p 공통 -->
                                <th>사용내역</th> <!-- c.d.p 공통 -->
                                <th>사용포인트</th> <!-- c.d.p 공통 -->
                                <th>총포인트</th> <!-- c.d.p 공통 -->
                            </tr>
                            <c:forEach items="${couponList }" var="cp">
                          		<tr>
                                	<td><input type="checkBox" id="checkBox"></td>
                                	
	                                <!-- 
                                	<c:if test="${cp.memberNo == null and dc.memberNo == null}">
                                		<td>${pc.memberNo }<td>
                                	</c:if>
                                	<c:if test="${cp.memberNo == null and pc.memberNo == null }">
                                		<td>${dc.memberNo }</td>
                                	</c:if>
                                	<c:if test="${pc.memberNo == null and dc.memberNo == null }">
                                		<td>${cp.memberNo }</td>
                                	</c:if>
                                	-->
                                	
                                    <td>${cp.memberNo }</td>
                                    <td>${cp.memberNo }</td>
                                    <td>${cp.memberNo }</td>
                                    <td>${cp.memberNo }</td>
                                    <td>${cp.memberNo }</td>
                                    <td>${cp.memberNo }</td>
                                   <%--  <c:choose>
                                    	<c:when test="${o.payStatus == 1 }">
                                    		<td>결제완료</td>
                                    	</c:when>
                                    	<c:when test="${o.payStatus == 2 }">
                                    		<td>결제취소</td>
                                    	</c:when>
                                    </c:choose>
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
                                    </c:choose> --%>
                                    <td>
                                        <select name="orderStatusList">
                                            <option value="1">결제완료</option>
                                            <option value="2">배송준비중</option>
                                            <option value="3">배송중</option>
                                            <option value="4">배송완료</option>
                                            <option value="5">결제취소</option>
                                            <option value="6">환불완료</option>
                                        </select>
                                    </td> 
                                    <td>
                                    	<%-- <input type="hidden" class="orderStatus" value="${o.orderStatus }"> --%>
                                    	<button type="button" id="changeOrderStatusBtn" onclick="changeOrderStatus();">상품 상태 변경</button>
                                    </td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <th colspan="12">${pageNavi}</th>
                            </tr>
                        </table>
	                    <form name="searchForm" method="POST" action="" class="">
	                     	<input type="hidden" class="orderNo" value="${o.orderNo }">
	                    	<button type="button" onclick="exportToExcel();">엑셀출력</button>
	                     </form><!--  -->
                    </div>
                    <div>
                    <div id="ajaxResult" class="table"></div>
                </div>
            </div>
        </div>

    </div>


<!-- 스크립트를 넣어봅시다 -->
    <script>
    /* data tables 적용해보자 */
    $("#dataTables").DataTable({
    	
    });
    
    
        
    </script>
    
</body>
</html>