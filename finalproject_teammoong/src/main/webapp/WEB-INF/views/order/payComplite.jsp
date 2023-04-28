<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.modal {
    	display: none;
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        max-height: 90vh;
        padding: 0;
        box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.25);
        border-radius: 4px;
        z-index: 999;
        background-color: #fff;
    }
    .modal-content {
        padding: 20px;
        font-weight: 400;
        font-size: 15px;
        line-height: 24px;
        color: #253033;
        overflow-y: auto;
    }
    .delivery{
    	padding-top: 20px;
    }
    .area-btn{
    	padding-top: 20px;
    }
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div class="content-wrap">
			<h1>결제완료</h1>
				<p>${sessionScope.m.memberName}님의 주문내역 입니다.</p>
				<p></p>
			<table id="orderTbl">
				<tr>
					<th>주문번호</th>
					<th style="width: 40%;">주문건</th>
					<th>상품금액</th>
					<th>결제금액</th>
					<th>주문날짜</th>
					<th>주문상태</th>
					<th style="width: 9%;"></th>
				</tr>
				<tr>
					<td>${order.orderNo }</td>
					<td>${productName}
						<c:if test="${orderCnt != 0 }"> 
						외 ${orderCnt}건
						</c:if>
					</td>
					<td>${order.orderPrice }</td>
					<td>${order.totalPrice }</td>
					<td>${order.orderDate }</td>
					<td>
						<c:if test="${order.orderStatus == 1 }">
						결제완료
						</c:if>
						<c:if test="${order.orderStatus == 2 }">
						배송준비중
						</c:if>
						<c:if test="${order.orderStatus == 3 }">
						배송중
						</c:if>
						<c:if test="${order.orderStatus == 4 }">
						배송완료
						</c:if>
						<c:if test="${order.orderStatus == 5 }">
						결제취소
						</c:if>
						<c:if test="${order.orderStatus == 6 }">
						환불완료
						</c:if>
						<c:if test="${order.orderStatus == 7 }">
						환불완료
						</c:if>
					</td>
					<td>
						<button type="button" id="cancelPay" class="btn size01 btn-border-pri">결제취소</button>
					</td>
				</tr>				
			</table>
			<div class="delivery">
				<h3>배송정보</h3>
				<table>
					<tr>
						<th style="width: 20%;">수령인</th>
						<td>${order.deliReceiver}</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>${order.deliPhone}</td>
					</tr>
					<tr>
						<th>배송지</th>
						<td>${order.deliAddr}</td>
					</tr>
					<tr>
						<th>배송요청사항</th>
						<td>${order.deliRequest}</td>
					</tr>
				</table>
			</div>
			
			<div class="area-btn center">
				<a href="/myOrderList.do" class="btn btn-sec size02"">주문상세보기</a>
				<a href="/main.do" class="btn btn-black size02">메인으로</a>
			</div>
			
			<div id="myModal" class="modal">
        		<div class="modal-content">
            	<h3>결제 취소</h3>
            		<p>진짜로 결제를 취소하시겠습니까? 진짜? 진짜?</p>
            		<div class="area-btn center">
               			<button type="button" id="confirmBtn" class="btn size01 btn-pri">확인</button>
               			<button type="button" id="cancelBtn" class="btn size01 btn-dkgray">취소</button>
               			<input type="hidden" id="orderNo" name="orderNo" value="${order.orderNo }">
               			<input type="hidden" id="memberNo" name="memberNo" value="${sessionScope.m.memberNo }">
            		</div>
        		</div>
    		</div>
		</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
		$(document).ready(function() {
	        const cancelPayBtn = $("#cancelPay");
	        const modal = $("#myModal");
	        const confirmBtn = $("#confirmBtn");
	        const cancelBtn = $("#cancelBtn");
          
	        cancelPayBtn.on("click", function() {
	            modal.css("display", "block");
	        });

	        confirmBtn.on("click", function() {
	            modal.css("display", "none");
	            
	        });

	        cancelBtn.on("click", function() {
	            modal.css("display", "none");
	        });
	    });
		$("#confirmBtn").on("click", function(){
			const orderNo = $("#orderNo").val();
			const memberNo = $("#memberNo").val();
			$.ajax({
				url: "/payCancel.do",
				type: "get",
				data: {orderNo : orderNo, memberNo : memberNo},
				success: function(data) {
					console.log(data);
					if(data == "success"){
						alert("결제 취소");
						$("#orderTbl").hide();
					}
				},
				error: function(){
					console.log("에러")
				}
			});
		});
	</script>
</body>
</html>