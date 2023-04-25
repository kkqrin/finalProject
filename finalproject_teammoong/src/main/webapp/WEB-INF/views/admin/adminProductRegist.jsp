<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- default 적용 -->
	<link rel="stylesheet" href="/resources/css/common/default.css" />
</head>
<style>
	.adminPage-main{
		overflow: hidden;
	}

	.adminPage-content{
		float: left;
	}
</style>
<body>
<c:if test="${not empty sessionScope.m and sessionScope.m.memberStatus == 0}">
        <!-- 관리자일때만 페이지 보이게 세팅 -->
    </c:if>
    <div class="adminPage-wrapper">
        <div class="adminPage-header">
            <div class="adminPage-title"><a>Moong's Admin</a></div>
        </div>
        <div class="adminPage-back">
            <jsp:include page="/WEB-INF/views/admin/adminSideNavi.jsp"/>
            <div class="adminPage-main">
                <div class="adminPage-content">
                    <div class="adminPage-search">
                        <select id="boardSearchSelect">
                        	<option name="none" value="">선택하세요</option>
                            <option name="searchDetailName" value="detailName">상품명 검색</option>
                            <option name="searchCategoryNo" value="categoryNo">카테고리 검색</option>
                            <option name="searchBoardStatus" value="boardStatus">공구 진행여부</option>
                        </select>
                        <select id="categorySelect" name="categorySelectBox">
                        	<option>카테고리를 선택해주세요</option>
                            <option value="1">패션</option>
                            <option value="2">뷰티</option>
                            <option value="3">식품</option>
                            <option value="4">생활용품</option>
                            <option value="5">가전/디지털</option>
                            <option value="6">가구</option>
                            <option value="7">침구</option>
                            <option value="8">인테리어</option>
                            <option value="9">공구</option>
                            <option value="10">스포츠/레저/취미</option>
                            <option value="11">출산/유아동</option>
                            <option value="12">반려용품</option>
                            <option value="13">명품관</option>
                            <option value="88">테스트용</option>
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
                        <table class="table guide-board tbl-box">
                            <tr>
                            	<td>구분</td>
                           		<td>사업자명</td>
                            	<td>사업자등록번호</td>
                                <td>대표 전화번호</td>
                            	<td>사업장 주소</td>
                                <td>담당자명</td>
                                <td>담당자 연락처</td>
                                <td>카테고리</td>
                                <td>사업자등록증 다운로드</td>
                            	<td>요청 제목</td>
                            </tr>
                            <c:forEach items="${askList }" var="a">
                                <tr>
                                	<td><input type="checkBox" id="checkBox"></td>
                                    <td>${a.corpName }<input type="hidden" class="corpName" value="${a.corpName }"></td>
                                    <td>${a.regNo }</td>
                                    <td>${a.repName }</td>
                                    <td>${a.corpAddr1 }</td>
                                    <td>${a.corpAddr2 }</td>
                                    <td>${a.contName }</td>
                                    <td>${a.contPhone }</td>
                                    <td>${a.contMail }</td>
                                    <%-- <c:choose>
                                    	<c:when test="${a.detailCategoryNo == 1}">
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
                                    
                                    <c:choose>
                                    	<c:when test="${b.boardStatus == 1 }">
                                    		<td>진행</td>
                                    	</c:when>
                                    	<c:when test="${b.boardStatus == 2 }">
                                    		<td>마감</td>
                                    	</c:when>
                                   	</c:choose> --%>
		                             <td>${a.askTitle }</td>
		                             <td>${a.askDate }</td>
	                            </c:forEach>
                                </tr>
                            <tr>
                                <th colspan="10">${pageNavi}</th>
                            </tr>
                        </table>
                    </div>
                    <div id="ajaxResult" class="table"></div>
                </div>
            </div>
        </div>
    </div>


</body>
</html>