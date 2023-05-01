<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	<!-- css -->
	<link rel="stylesheet" href="/resources/css/admin/admin.css" />
	<link rel="stylesheet" href="/resources/css/common/default.css" />
</head>
<style>
    .adminPage-content{
        background-color: #fff;
        overflow: hidden;
    }
    .material-symbols-outlined{
        font-size: 150px !important;
        
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
    #categorySelect{
    	display: none;
    }
    #searchOption{
    	width: 300px !important;
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
                                    <td>${b.boardNo }<input type="hidden" class="boardNo" value="${b.boardNo }"></td>
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
		                             <fmt:formatNumber value="${bo.detailPrice }"/>원
		                             </c:forEach>
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


<!-- 스크립트를 넣어봅시다 -->
    <script>

    /* 검색기능 */
    
    //첫번째 셀렉트 창 변경시 
    $("#boardSearchSelect").on("change",function(){
    	
	   	 var boardSearchOption = $("#boardSearchSelect option:selected").val();
		 
	     var detailCategoryNo = $("#searchCategoryNo").val();
	   	 var detailName = $("#searchDetailName").val();
	   	 var boardStatus = $("#searchBoardStatus").val();
	   	 
	   	 var boardSearchBox = $("[name=boardSearchBox]"); // 검색 박스
	   	 var boardSearchBoxVal = $("[name=boardSearchBox]").val(); // 검색박스 값
	   	 
	   	 var categorySelectBox = $("[name=categorySelectBox]"); // 추가 카테고리 셀렉트 박스
	   	 var categorySelectVal = $("[name=categorySelectBox]").val(); // 추가 카테고리 셀렉트 박스 value
	   	
	   	detailCategoryNo = '';
	   	detailName= '';
	   	boardStatus= '';
	   	 
	   	if(boardSearchOption == 'categoryNo'){
	   		boardSearchBox.hide();
	   		categorySelectBox.show();
		}else if(boardSearchOption == 'detailName'){
	   		boardSearchBox.hide();
	   		categorySelectBox.hide();
	   		boardSearchBox.show();
		}else if(boardSearchOption == 'boardStatus'){
			boardSearchBox.hide();
	   		categorySelectBox.hide();
	   		boardSearchBox.show();
		}
    });
	   	 
    //검색 버튼을 눌렀을때
	    $("[name=searchSubmitBtn]").on("click",function(){
	    	 boardSearchOption = $("#boardSearchSelect option:selected").val();
			 
	         detailCategoryNo = $("#searchCategoryNo").val();
	       	 detailName = $("#searchDetailName").val();
	       	 boardStatus = $("#searchBoardStatus").val();
	       	 
	       	 boardSearchBox = $("[name=boardSearchBox]"); // 검색 박스
	       	 boardSearchBoxVal = $("[name=boardSearchBox]").val(); // 검색박스 값
	       	 
	       	 categorySelectBox = $("[name=categorySelectBox]"); // 추가 카테고리 셀렉트 박스
	       	 categorySelectVal = $("[name=categorySelectBox]").val(); // 추가 카테고리 셀렉트 박스 value
	   	 
	  	 	if(boardSearchOption == 'categoryNo'){
				if(categorySelectBox.on("change")){
				 	categorySelectVal = $(this).prev().prev().val();
				}
				
		   		detailCategoryNo = categorySelectVal;
		   		detailName = '';
		   		boardStatus = '0';
		   		
		   	 }else if(boardSearchOption == 'detailName'){
		   		detailCategoryNo = '0';
		   		detailName = boardSearchBoxVal;
		   		boardStatus = '0';
		   		
		   	 }else if(boardSearchOption == 'boardStatus'){
		   		 
		   		 if(boardSearchBoxVal == '진행'){
		       		boardStatus = 1;
		       		
		   		 }else if(boardSearchBoxVal == '마감'){
		   			boardStatus = 2; 
		   		 }
		       		detailCategoryNo = '0';
		   			detailName = '';
		   	 }
	  	 	
	    	 $.ajax({
	            url: "/ajaxAdminSearchBoard.do",
	            type: "POST",
	            data: {detailCategoryNo : detailCategoryNo, detailName : detailName, boardStatus : boardStatus},
	            success: function(data) {
	            	if(data){
	            		$("#ajaxResult").empty();
	            			$(".adminPage-result").hide();
							console.log(data);
							const table =$("<table>");
							const titleTr = $("<tr>");
							titleTr.html("<th>구분</th><th>게시글 번호</th><th>카테고리 번호</th><th>작성자</th><th>게시일자</th><th>공구 시작일</th><th>공구 마감일</th><th>공구 진행여부</th><th>상품명</th><th>상품가격</th>");
							table.append(titleTr);
							for(let i=0;i<data.length;i++){
								for(let j=0;j<data[i].boardOptionList.length;j++){
								const tr = $("<tr>");
								tr.append("<td>"+"</td>")
								tr.append("<td>"+data[i].boardNo+"</td>");
								tr.append("<td>"+data[i].detailCategoryNo+"</td>");
								tr.append("<td>"+data[i].boardWriter+"</td>");
								tr.append("<td>"+data[i].boardDate+"</td>");
								tr.append("<td>"+data[i].boardStart+"</td>");
								tr.append("<td>"+data[i].boardEnd+"</td>");
								
								if(data[i].boardStatus == 1){
									tr.append("<td>진행</td>");
								}else if(data[i].boardStatus == 2){
									tr.append("<td>마감</td>");
								}
								
								tr.append("<td>"+data[i].boardOptionList[j].detailName+"</td>");
								tr.append("<td>"+data[i].boardOptionList[j].detailPrice+"원</td>");
								table.append(tr);
								
								} 
								
						}
						$("#ajaxResult").append(table);
	            		
	            	}else{
	    				console.log("다시 시도");
	            	}
	            }
	        })
	   		 
	    });
	   	
    
    
    
        
    </script>
    
</body>
</html>