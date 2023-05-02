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
<!-- google icon -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	<!-- css -->
	<link rel="stylesheet" href="/resources/css/admin/admin.css" />
	<link rel="stylesheet" href="/resources/css/common/default.css" />
</head>
<style>
    .adminPage-wrapper{
        background-color: #111;
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
    <div class="adminPage-wrapper" id="adminOrderTable">
        <div class="adminPage-header">
            <div class="adminPage-title"><a href="/#">Moong's Admin</a></div>
        </div>
        <div class="adminPage-back">
            <jsp:include page="/WEB-INF/views/admin/adminSideNavi.jsp"/>
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
                        <table>
                            <tr>
                            	<th>구분</th>
                                <th>주문번호</th>
                                <th>상품번호</th>
                                <th>회원번호</th>
                                <th>결제번호</th>
                                <th>주문일자</th>
                                <th>상품원가</th>
                                <th>수량</th> 
                                <th>가격</th>
                                <th>배송주소</th> 
                                <th>결제상태</th> <!-- choose -->
                                <th>주문상태</th> <!-- choose -->
                            </tr>
                            <c:forEach items="${orderList }" var="o">
                                <tr>
                                	<td><input type="checkBox" id="checkBox"></td>
                                    <td>${o.orderNo }</td>
                                    <td>${o.productNo }</td>
                                    <td>${o.memberNo }</td>
                                    <td>${o.orderDate }</td>
                                    <td><fmt:formatNumber value="${o.productCost }"/></td>
                                    <td>${o.orderDetailCnt }</td>
                                    <td><fmt:formatNumber value="${o.orderDetailPrice }"/></td>
                                    <td>${o.deliAddr }</td>
                                    <c:choose>
                                    	<c:when test="${o.orderStatus == 1 }">
                                    		<td>
                                    			결제완료<input type="hidden" value="1">
                                    		</td>
                                    	</c:when>
                                    	<c:when test="${o.orderStatus == 2 }">
                                    		<td>
                                    			배송준비중<input type="hidden" value="2">
                                    		</td>
                                    	</c:when>
                                    	<c:when test="${o.orderStatus == 3 }">
                                    		<td>
                                    			배송중<input type="hidden" value="3">
                                    		</td>
                                    	</c:when>
                                    	<c:when test="${o.orderStatus == 4 }">
                                    		<td>
                                    			배송완료<input type="hidden" value="4">
                                    		</td>
                                    	</c:when>
                                    		<c:when test="${o.orderStatus == 5 }">
                                    		<td>
                                    			결제취소<input type="hidden" value="5">
                                    		</td>
                                    	</c:when>
                                    		<c:when test="${o.orderStatus == 6 }">
                                    		<td>
                                    			환불완료<input type="hidden" value="6">
                                    		</td>
                                    	</c:when>
                                    </c:choose>
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
                                    	<input type="hidden" class="orderStatus" value="${o.orderStatus }">
                                    	<button type="button" id="changeOrderStatusBtn" onclick="changeOrderStatus();">상품 상태 변경</button>
                                    </td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <th colspan="12">${pageNavi}</th>
                            </tr>
                            <form name="searchForm" method="POST" action="" class="">
	                        	<input type="hidden" class="orderNo" value="${o.orderNo }">
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
    /* 등급 변경 */
    /* 왜 첫번째만 변경되는가?! */
    	function changeOrderStatus(){
    		var orderStatus = $(this).prev().('[name=orderStatusList] :selected').val();
    		var orderOldStatus = $(this).parent().parent().children().eq(11).$("[input=hidden]").val();
    		var orderNo = $(this).parent().parent().children().eq(1).text();
    		console.log(orderStatus);
    		console.log(orderOldStatus);
    		console.log(orderNo);
    		
            $.ajax({
                url: "/ajaxChangeDeliveryStatus.do",
                type: "POST",
                data: {orderStatus : orderStatus, orderNo : orderNo},
                success: function(data) {
                	if(data == "ok"){
                		$("#adminOrderTable").load(location.href+ '#adminOrderTable');
                	}else{
	    				console.log("다시 시도");
                		
                	}
                }
            })
            
            };
            
            $("[name=searchSubmitBtn]").on("click",function(){
           	 var orderSearchOption = $("#orderSearchSelect option:selected").val();
           	 var orderNo = $("#orderNo").val();
           	 var memberNo = $("#memberNo").val();
           	 var orderStatus = $("#orderStatus").val();
           	 var orderSearchBox = $("[name=orderSearchBox]").val();
           	 var orderStatusSelect = $("#orderStatusSelect");
           	 var orderStatusSelectVal = $("#orderStatusSelect option:selected").val();
           	 
           	 if(orderSearchOption == 'orderNo'){
           		orderNo = orderSearchBox;
           		 
           	 }else if(orderSearchOption == 'memberNo'){
           		memberNo = orderSearchBox;
           		 
           	 }else if(orderSearchOption == 'orderStatus'){
           		orderStatusSelect.show();
           		orderStatus = orderStatusSelectVal;
           	 }
           	 
           	 
           	 $.ajax({
                   url: "/ajaxAdminSearchMember.do",
                   type: "POST",
                   data: {orderNo : orderNo, memberNo : memberNo, orderStatus : orderStatus},
                   success: function(data) {
                   	if(data){
                   		$("#ajaxResult").empty();
                   			$(".adminPage-result").hide();
  							const table =$("<table>");
  							const titleTr = $("<tr>");
  							titleTr.html("<th>구분</th><th>주문번호</th><th>상품번호</th><th>회원번호</th><th>결제번호</th><th>주문일자</th><th>상품원가</th><th>수량</th><th>가격</th><th>배송주소</th><th>결제상태</th><th>주문상태</th>");
  							table.append(titleTr);
  							for(let i=0;i<data.length;i++){
  								const tr = $("<tr>");
  								tr.append("<td>"+"</td>")
  								tr.append("<td>"+data[i].orderNo+"</td>");
  								tr.append("<td>"+data[i].productNo+"</td>");
  								tr.append("<td>"+data[i].memberNo+"</td>");
  								tr.append("<td>"+data[i].payNo+"</td>");
  								tr.append("<td>"+data[i].orderDate+"</td>");
  								tr.append("<td>"+data[i].productCost+"</td>");
  								tr.append("<td>"+data[i].orderdetailCnt+"</td>");
  								tr.append("<td>"+data[i].orderDetailPrice+"</td>");
  								tr.append("<td>"+data[i].deliAddr+"</td>");
  								
  								if(data[i].orderStatus == 1){
  									tr.append("<td>결제완료</td>");
  								}else if(data[i].orderStatus == 2){
  									tr.append("<td>배송준비중</td>");
  								}else if(data[i].orderStatus == 3){
  									tr.append("<td>배송중</td>");
  								}else if(data[i].orderStatus == 4){
  									tr.append("<td>배송완료</td>");
  								}else if(data[i].orderStatus == 5){
  									tr.append("<td>결제취소</td>");
  								}else if(data[i].orderStatus == 6){
  									tr.append("<td>환불완료</td>");
  								}
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