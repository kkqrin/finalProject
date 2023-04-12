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
    <div class="adminPage-wrapper" id="adminProductTable">
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
                    <li><a href="/adminTotalProductList.do?reqPage=1">상품 관리</a></li>
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
                    <li>여기여기붙어라 게시판 관리</li>
                    <li><a href="/adminBoardReportManagePage.do?reqPage=1">여기여기붙어라 신고 관리</a></li>
                    <li>카테고리별 매출관리</li>
                </ul>
            </div>
            <div class="adminPage-main">
                <div class="adminPage-content">
                    <div class="adminPage-search">
                        <select id="productSearchSelect">
                            <option value="productNo">상품 번호 검색</option>
                            <option value="productName">상품 이름</option>
                            <option value="productStatus">상품 상태 검색</option>
                        </select>
                        <input type="text" name="productSearchBox" id="searchOption" placeholder="상품 상태 검색시 [대기/등록/보류/만료] 중 하나로 입력해주세요">
                        <!-- 상품 상태 검색 시 1,2,3,4 로 변환해주는 choose 걸어줘야 함 -->
                        <button type="button" name="searchSubmitBtn">검색</button>
                    </div>
                    <div class="adminPage-result">
                        <table>
                            <tr>
                            	<td>구분</td>
                                <td>상품번호</td>
                                <td>세부카테고리번호</td>
                                <td>상품이름</td>
                                <td>상품수량</td>
                                <td>상품가격</td>
                                <td>원가</td>
                                <td>공동구매인원수</td>
                                <td>상품내용</td>
                                <td>상품할인률</td> 
                                <td>상품상태</td>
                            </tr>
                            <c:forEach items="${productList }" var="p">
                                <tr>
                                	<td><input type="checkBox" id="checkBox"></td>
                                    <td>${p.productNo }</td>
                                    <td>${p.dCategoryNo }</td>
                                    <td>${p.productName }</td>
                                    <td>${p.productEa }</td>
                                    <td>${p.productPrice }</td>
                                    <td>${p.productCost }</td>
                                    <td>${p.productNumber }</td>
                                    <td>${p.productContent }</td>
                                    <td>${p.productDiscount }</td>
                                    <c:choose>
                                    	<c:when test="${p.productStatus == 1 }">
                                    		<td>대기</td>
                                    	</c:when>
                                    	<c:when test="${p.productStatus == 2 }">
                                    		<td>등록</td>
                                    	</c:when>
                                    	<c:when test="${p.productStatus == 3 }">
                                    		<td>보류</td>
                                    	</c:when>
                                    	<c:when test="${p.productStatus == 4 }">
                                    		<td>만료</td>
                                    	</c:when>
                                    </c:choose>
                                    <td>
                                        <select class="productStatusList" id="productStatusList">
                                            <option value="0">대기</option>
                                            <option value="1">등록</option>
                                            <option value="2">보류</option>
                                            <option value="3">만료</option>
                                        </select>
                                    </td>
                                    <td>
                                    	<input type="hidden" class="productStatus" value="${p.productStatus }">
                                    	<button type="button" id="changeProductStatusBtn" onclick="changeProductStatus();">상품 상태 변경</button>
                                    </td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <th colspan="11">${pageNavi}</th>
                            </tr>
                            <tr>
                                <th colspan="2"><button type="button" name="allChangeProductStatus">일괄 변경</th>
                            </tr>
	                        <form name="searchForm" method="POST" action="" class="">
	                        	<input type="hidden" class="productNo" value="${p.productNo }">
	                       		<button type="button" onclick="exportToExcel();">엑셀출력</button>
	                        </form><!--  -->
                        </table>
                    </div>
                     <div id="ajaxResult" class="table"></div>
                </div>
            </div>
        </div>

    </div>


<!-- 스크립트를 넣어봅시다 -->
    <script>
	function changeProductStatus(){
		var productStatusSelect = $(".productStatusList option:selected").val();
		var productNo = $(".productNo").val();
		
        $.ajax({
            url: "/ajaxChangeProductStatus.do",
            type: "POST",
            data: {productStatusSelect : productStatus, productNo : productNo},
            success: function(data) {
            	if(data == "ok"){
            		$("#adminProductTable").load(location.href+ '#adminProductTable');
            	}else{
    				console.log("다시 시도");
            		
            	}
            }
        })
        
        };
        
        /* 검색기능 */
        $("[name=searchSubmitBtn]").on("click",function(){
       	 var productSearchOption = $("#productSearchSelect option:selected").val();
         var productNo = $("#productNo").val();
       	 var productName = $("#productName").val();
       	 var productStatus = $("#productStatus").val();
       	 var productSearchBox = $("[name=productSearchBox]").val();
       	 
       	 if(memberSearchOption == 'productNo'){
       		productNo = memberSearchBox;
       		 
       	 }else if(memberSearchOption == 'productName'){
       		productName = memberSearchBox;
       		 
       	 }else if(memberSearchOption == 'productStatus'){
       		 if(productSearchBox == '대기'){
	       		productStatus = 1;
       		 }else if(productSearchBox == '등록'){
       			productStatus = 2; 
       		 }else if(productSearchBox == '보류'){
       			productStatus = 3; 
       		 }else if(productSearchBox == '만료'){
       			productStatus = 4; 
       		 }
       	 }
       	 
        	 $.ajax({
                url: "/ajaxAdminSearchProduct.do",
                type: "POST",
                data: {productNo : productNo, productName : productName, productStatus : productStatus},
                success: function(data) {
                	if(data){
                		$("#ajaxResult").empty();
                			$(".adminPage-result").hide();
							const table =$("<table>");
							const titleTr = $("<tr>");
							titleTr.html("<th>구분</th><th>상품번호</th><th>세부카테고리번호</th><th>상품이름</th><th>상품수량</th><th>상품가격</th><th>원가</th><th>공동구매인원수</th><th>상품내용</th><th>상품할인률</th><th>상품상태</th>");
							table.append(titleTr);
							for(let i=0;i<data.length;i++){
								const tr = $("<tr>");
								tr.append("<td>"+"</td>")
								tr.append("<td>"+data[i].productNo+"</td>");
								tr.append("<td>"+data[i].dCategoryId+"</td>");
								tr.append("<td>"+data[i].productName+"</td>");
								tr.append("<td>"+data[i].productEa+"</td>");
								tr.append("<td>"+data[i].productPrice+"</td>");
								if(productStatus == 1){
									tr.append("<td>대기</td>");
								}else if(productStatus == 2){
									tr.append("<td>등록</td>");
								}else if(productStatus == 3){
									tr.append("<td>보류</td>");
								}else if(productStatus == 4){
									tr.append("<td>만료</td>");
								}
								tr.append("<td>"+data[i].productCost+"</td>");
								tr.append("<td>"+data[i].gongguNumber+"</td>");
								tr.append("<td>"+data[i].productContent+"</td>");
								tr.append("<td>"+data[i].productDiscount+"</td>");
								table.append(tr);
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