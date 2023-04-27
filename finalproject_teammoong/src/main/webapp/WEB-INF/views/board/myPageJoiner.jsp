<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="content-wrap">
		<div class="mypage-wrap">
		
		<jsp:include page="/WEB-INF/views/common/myPageMenu.jsp" />
		
		<div class="mypage-right">
			<div class="mypage-right-title" style="display: flex; justify-content: space-between;">
				${boardName }
				<button onclick="location.href='/boardView.do?boardNo=${boardNo }'" class="btn btn-sec size01">게시물 보기</button>
			</div>
			<div class="mypage-content">
				<div style="border-bottom: 3px solid #3a3a3a; padding-bottom: 5px;">
					<input type="checkbox" id="allCheck" style="margin: 0;"><label for="allCheck">전체선택</label>
					<a href="#" style="font-weight: bold; padding: 0 3px; border: 1px solid #3a3a3a; border-radius: 5px;">쪽지보내기</a>
				</div>
			
			
				<table class="tbl-box" style="margin-top: 10px;">
					<c:forEach items="${list }" var="bj" varStatus="i">
						<tr>
							<th rowspan="3" style="width: 5%;"><input type="checkbox"></th>
							<th rowspan="3" style="width: 5%;">${i.index+1 }</th>
							<th style="width: 20%;">주문자 정보</th>
							<td style="text-align: left;">
								<p>주문한 사람 : ${bj.memberName }</p>
								<p>입금예정일 : ${bj.payerDate }</p>	
								<p>환불계좌정보 : ${bj.refundAccount } ${bj.refundBank } ${bj.refundName }</p>	
							</td>
						</tr>
						<tr>
							<th>배송지 정보</th>
							<td style="text-align: left;">
								<p>배송주소 : ${bj.receiverAddr }</p>
								<p>수령인 : ${bj.receiverName }(${bj.receiverPhone })</p>
							</td>
						</tr>	
						<tr>
							<th>주문 상품 정보</th>
							<td style="text-align: left;">
								<p>총 주문금액 : <strong>${bj.depositPrice }</strong>원</p>
								<p>[주문 상세 정보]</p>
								<p>${bj.detailName } / ${bj.orderCount }개</p>		
							</td>
						</tr>
					</c:forEach>
				</table>
				
				
			</div>
		
		</div>
	</div>
	
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>