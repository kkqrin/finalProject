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
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div class="content-wrap">
			<h1>결제완료</h1>
				${sessionScope.m.memberName}님의 주문내역 입니다.
			<table>
				<tr>
					<th>주문번호</th>
					<th style="width: 40%;">상품명</th>
					<th>결제날짜</th>
					<th>주문상태</th>
					<th style="width: 9%;"></th>
				</tr>
				<tr>
					<td>${pay.payNo }</td>
					<td>${productName }</td>
					<td>${pay.payDate }</td>
					<td>
						<c:if test="${pay.payStatus == 1 }">
							결제완료
						</c:if>
						<c:if test="${pay.payStatus == 2 }">
							결제취소
						</c:if>
					</td>
					<td>
						<button type="button" id="cancelPay" class="btn size01 btn-border-pri">결제취소</button>
					</td>
				</tr>
			</table>
			<div id="myModal" class="modal">
        		<div class="modal-content">
            	<h3>결제 취소</h3>
            		<p>진짜로 결제를 취소하시겠습니까? 진짜? 진짜?</p>
            		<div class="area-btn center">
               			<button type="button" id="confirmBtn" class="btn size01 btn-pri">확인</button>
               			<button type="button" id="cancelBtn" class="btn size01 btn-dkgray">취소</button>
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
	</script>
</body>
</html>