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
	<!-- css -->
	<link rel="stylesheet" href="/resources/css/admin/admin.css" />
	<link rel="stylesheet" href="/resources/css/common/default.css" />
	
</head>
<style>
	.adminPage-main{
		overflow: hidden;
	}

	.adminPage-content{
		float: left;
	}
	
	.select-custom{
		min-height: 32px;
	    padding: 8px 10px;
	    border-radius: 4px;
	    height: 37px;
	}
	
	.adminPage-search {
	  display: flex;
	  align-items: center;
	  margin-bottom: 15px;
	}
	
	.adminPage-result{
		width: 98%;
	}

	.search-select,
	.search-input,
	.area-btn {
	  	margin-right: 10px;
	}

	.btn {
	  	margin-right: 5px;
	}
	[name=allChangeMemberStatus]{
		margin-top: 20px;
	}
	.size02{
		font-size: 15px !important;
	}	
	
	
</style>
<body>
<c:if test="${not empty sessionScope.m and sessionScope.m.memberStatus == 0}">
        <!-- 관리자일때만 페이지 보이게 세팅 -->
    </c:if>
    <div class="adminPage-wrapper">
        <div class="adminPage-header">
            <div class="adminPage-title"><a href="/#">Moong's Admin</a></div>
        </div>
        <div class="adminPage-back">
            <jsp:include page="/WEB-INF/views/admin/adminSideNavi.jsp"/>
            <div class="adminPage-main">
                <div class="adminPage-content">
                    <div class="adminPage-search">
	                    <div class="search-select">
	                        <select id="askSearchSelect" class="select-custom">
	                        	<option name="none" value="">선택하세요</option>
	                            <option name="searchDetailName" value="detailName">상품명 검색</option>
	                            <option name="searchCategoryNo" value="categoryNo">카테고리 검색</option>
	                            <option name="searchBoardStatus" value="boardStatus">공구 진행여부</option>
	                        </select>
	                        <select id="categorySelect" class="select-custom">
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
	                    </div>
                    <div class="search-input">
                        <input type="text" name="boardSearchBox" id="searchOption">
                    </div>
                        <div class="area-btn right">
	                        <button type="button" name="searchSubmitBtn" class="btn btn-pri size01">검색</button>
	                        <button type="button" name="goList" class="btn btn-pri size01">목록</button>
                        </div>
                    </div>
                    <div class="adminPage-result">
                        <table class="table tbl-box">
                            <tr>
                           		<th>사업자명</th>
                            	<th>사업자등록번호</th>
                                <th>대표자명</th>
                            	<th>사업장 주소1</th>
                            	<th>사업장 주소2</th>
                                <th>담당자명</th>
                                <th>담당자 연락처</th>
                                <th>담당자 메일</th>
                                <th>카테고리</th>
                            	<th>요청제목</th>
                            	<th>요청일자</th>
                            </tr>
                            <c:forEach items="${askList }" var="a">
                                <tr>
                                    <td>${a.corpName }<input type="hidden" class="corpName" value="${a.corpName }"></td>
                                    <td>${a.regNo }</td>
                                    <td>${a.repName }</td>
                                    <td>${a.corpAddr1 }</td>
                                    <td>${a.corpAddr2 }</td>
                                    <td>${a.contPhone }</td>
                                    <td>${a.contName }</td>
                                    <td>${a.contMail }</td>
                                    <td>${a.categoryName }</td>
		                            <td>${a.askTitle }</td>
		                            <td>${a.askDate }</td>
                                </tr>
                            </c:forEach>
                   		</table>
                        <div class="pagination">${pageNavi }</div>
                    </div>
                    <div id="ajaxResult" class="table"></div>
                </div>
            </div>
        </div>
    </div>
<script type="text/javascript">

/*목록으로*/
$("[name=goList]").on("click",function(){
	location.reload();
})

/* 검색기능 */





</script>

</body>
</html>