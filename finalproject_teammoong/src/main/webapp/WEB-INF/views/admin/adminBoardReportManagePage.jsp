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
                            <option name="boardNo" value="boardNo">게시번호 검색</option>
                            <option name="memberName" value="memberName">유저이름 검색</option>
                            <option name="boardStatus" value="boardStatus">신고항목 검색</option>
                        </select>
                        <input type="text" name="orderSearchBox" id="searchOption">
                        <!-- 주문 상태 검색 시 1,2,3,4 로 변환해주는 절차 필요 -->
                        <button type="button" name="searchSubmitBtn">검색</button>
                    </div>
                    <div class="adminPage-result">
                        <table>
                            <tr>
                            	<td>구분</td>
                                <td>글번호</td>
                                <td>제목</td>
                                <td>작성일자</td>
                                <td>공구상태</td>
                                <td>신고번호</td>
                                <td>글작성자</td> 
                                <td>신고항목</td> <!-- choose -->
                          <!--       <td>상태변경</td>
                                <td>적용</td> -->
                                <td>삭제처리</td>
                            </tr>
                            <c:forEach items="${reportList }" var="r">
                            	<c:forEach items="${r.notifyList }" var="ny">
	                                <tr>
	                                	<td><input type="checkBox" id="checkBox"></td>
	                                    <td>${r.boardNo }</td>
	                                    <td>${r.boardName }</td>
	                                    <td>${r.boardDate }</td>
	                                    <c:choose>
	                                    	<c:when test="${r.boardStatus == 1 }">
	                                    		<td>진행</td>
	                                    	</c:when>
	                                    	<c:when test="${r.boardStatus == 2 }">
	                                    		<td>마감</td>
	                                    	</c:when>
	                                    	<c:when test="${r.boardStatus == 3 }">
	                                    		<td>신고마감</td>
	                                    	</c:when>
	                                    </c:choose>
	                                    <td>${ny.notifyNo }</td>
	                                    <td>${r.boardWriter }</td>
	                                    
	                                    <c:choose>
	                                    	<c:when test="${ny.notifyItem == 1 }">
	                                    		<td>비난</td>
	                                    	</c:when>
	                                    	<c:when test="${ny.notifyItem == 2 }">
	                                    		<td>욕설</td>
	                                    	</c:when>
	                                    	<c:when test="${ny.notifyItem == 3 }">
	                                    		<td>패드립</td>
	                                    	</c:when>
	                                    	<c:when test="${ny.notifyItem == 4 }">
	                                    		<td>허위물품</td>
	                                    	</c:when>
	                                    	<c:when test="${ny.notifyItem == 5 }">
	                                    		<td>사기</td>
	                                    	</c:when>	
	                                    </c:choose>
	                                   <!--  
	                                    <td>
	                                        <select name="orderStatusList">명훈님한테 물어보고 변경할 것
	                                            <option name="orderStatusList" value="0">결제완료</option>
	                                            <option name="orderStatusList" value="1">결제취소</option>
	                                        </select>
	                                    </td>
	                                    
	                                    <td>
		                                    <button type="button" id="changeBoardStatus">상태변경</button>
	                                    </td>
	                                     -->
	                                    <td>
		                                    <button type="button" id="deleteBoardBtn">삭제처리</button>
	                                    </td>
	                                </tr>
                            	</c:forEach>
                            </c:forEach>
                            <tr>
                                <th colspan="9">${pageNavi}</th>
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