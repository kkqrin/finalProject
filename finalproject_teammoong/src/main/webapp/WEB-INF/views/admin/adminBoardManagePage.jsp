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
<!-- 여여붙 data tables -->
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css"/>
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
    .table{
    	border: 1px solid black;
    }
    .table>tbody>tr>th{
    	border: 1px solid black;
    }
    .table>tbody>tr>td{
    	border: 1px solid black;
    }
    .searchForm{
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
                        <table class="table">
                            <tr>
                           		<td>구분</td>
                            	<td>게시글 번호</td>
                                <td>카테고리 번호</td>
                            	<td>작성자</td>
                                <td>게시일자</td>
                                <td>공구 시작일</td>
                                <td>공구 마감일</td>
                                <td>공구 진행여부</td>
                            	<td>상품명</td>
                                <td>상품가격</td>
                            </tr>
                            <c:forEach items="${boardList }" var="b">
                            	<c:forEach items="${b.boardOptionList }" var="bo">
                                <tr>
                                	<td><input type="checkBox" id="checkBox"></td>
                                    <td>${b.boardNo }</td>
                                    <c:choose>
                                    	<c:when test="${b.detailCategoryNo == 1}">
                                    		<td>패션</td>
                                    	</c:when>
                                    </c:choose>
                                    <c:choose>
                                    	<c:when test="${b.detailCategoryNo == 2}">
                                    		<td>뷰티</td>
                                    	</c:when>
                                    </c:choose>
                                    <c:choose>
                                    	<c:when test="${b.detailCategoryNo == 3}">
                                    		<td>식품</td>
                                    	</c:when>
                                    </c:choose>
                                    <c:choose>
                                    	<c:when test="${b.detailCategoryNo == 4}">
                                    		<td>생활용품</td>
                                    	</c:when>
                                    </c:choose>
                                    <c:choose>
                                    	<c:when test="${b.detailCategoryNo == 5}">
                                    		<td>가전/디지털</td>
                                    	</c:when>
                                    </c:choose>
                                    <c:choose>
                                    	<c:when test="${b.detailCategoryNo == 6}">
                                    		<td>가구</td>
                                    	</c:when>
                                    </c:choose>
                                    <c:choose>
                                    	<c:when test="${b.detailCategoryNo == 7}">
                                    		<td>침구</td>
                                    	</c:when>
                                    </c:choose>
                                    <c:choose>
                                    	<c:when test="${b.detailCategoryNo == 8}">
                                    		<td>인테리어</td>
                                    	</c:when>
                                    </c:choose>
                                    <c:choose>
                                    	<c:when test="${b.detailCategoryNo == 9}">
                                    		<td>공구</td>
                                    	</c:when>
                                    </c:choose>
                                    <c:choose>
                                    	<c:when test="${b.detailCategoryNo == 10}">
                                    		<td>스포츠/레저/취미</td>
                                    	</c:when>
                                    </c:choose>
                                    <c:choose>
                                    	<c:when test="${b.detailCategoryNo == 11}">
                                    		<td>출산/유아동</td>
                                    	</c:when>
                                    </c:choose>
                                    <c:choose>
                                    	<c:when test="${b.detailCategoryNo == 12}">
                                    		<td>반려용품</td>
                                    	</c:when>
                                    </c:choose>
                                    <c:choose>
                                    	<c:when test="${b.detailCategoryNo == 13}">
                                    		<td>명품관</td>
                                    	</c:when>
                                    </c:choose>
                                    <c:choose>
                                    	<c:when test="${b.detailCategoryNo > 13}">
                                    		<td>테스트용인듯</td>
                                    	</c:when>
                                    </c:choose>
                                    <td>${b.boardWriter }</td>
                                    <td>${b.boardDate }</td>
                                    <td>${b.boardStart }</td>
                                    <td>${b.boardEnd }</td>
                                    <c:choose>
                                    	<c:when test="${b.boardStatus == 1 }">
                                    		<td>진행</td>
                                    	</c:when>
                                    	<c:when test="${b.boardStatus == 2 }">
                                    		<td>마감</td>
                                    	</c:when>
                                   	</c:choose>
		                             <td>${bo.detailName }</td>
		                             <td>${bo.detailPrice }원</td>
		                             </c:forEach>
                            	</c:forEach>
                                </tr>
                            <tr>
                                <th colspan="10">${pageNavi}</th>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>


<!-- 스크립트를 넣어봅시다 -->
    <script>
    
    
    
    
    

    /* html */
/*     <table id="data_list" class="table table-bordered">
	    <thead>
		        <tr>
		            <th>게시글 번호</th>
		            <th>카테고리 번호</th>
		            <th>세부카테고리</th>
		            <th>제품 가격</th>
		            <th>공구 시작일</th>
		            <th>공구 마감일</th>
		            <th>공구 진행여부</th>
		        </tr>
		    </thead>
		</table>
	     */
    /* script */
	   /*  var table = $('#data_list').DataTable({
	        ajax: {
	           url: "data.json",
	           dataSrc:''
	        },
	       columns: [
	           {"data": "boardNo"},
	           {"data": "categoryNo"},
	           {"data": "detailName"}, 
	           {"data": "boardPrice"}, 
	           {"data": "boardStart"}, 
	           {"data": "boardEnd"}, 
	           {"data": "boardStatus"}, 
	       ],
	       data : 
	    	   [
	    		   $ajax.({
	    			   url : "/ajaxAdminBoardManagePage.do",
	    			   type:"get"
	    			   success: function(data){
							
	    				   data.forEach(function(item,index){
	    					   
	    				   })
			    		   {"boardNo":"1","categoryNo":"과일","detailName":"신선과일","boardPrice":"3000","boardStart":"2023-04-12","boardEnd":"2023-04-15","boardStatus":"1"},
			    		   {"boardNo":"1","categoryNo":"과일","detailName":"신선과일","boardPrice":"3000","boardStart":"2023-04-12","boardEnd":"2023-04-15","boardStatus":"1"},
	    				   
	    			   }
	    		   })
		       ]
	   }); */


        
    </script>
    
</body>
</html>