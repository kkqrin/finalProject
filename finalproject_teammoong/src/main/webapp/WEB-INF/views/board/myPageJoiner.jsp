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
				<div>
					<input type="checkbox" id="allCheck" style="margin: 0;"><label for="allCheck">전체선택</label>
					<a href="#" style="font-weight: bold; padding: 0 3px; border: 1px solid #3a3a3a; border-radius: 5px;">공지 발송하기(쪽지)</a>
				</div>
			
			
				<table class="tbl-box" style="margin-top: 10px;">
					<c:forEach items="${list }" var="bj" varStatus="i">
						<tr style="border-top: 2px solid #000;">
							<th rowspan="3" style="width: 5%;"><input type="checkbox" class="oneCheck" value="${bj.memberNo }"></th>
							<th rowspan="3" style="width: 5%;">${i.index+1 }</th>
							<th style="width: 20%;">주문자 정보</th>
							<td style="text-align: left;">
								<p>주문한 사람 : ${bj.payerName }</p>
								<p>입금예정일 : ${bj.payerDate }</p>	
								<p>환불계좌정보 : ${bj.refundAccount } ${bj.refundBank } ${bj.refundName }</p>	
							</td>
						</tr>
						<tr>
							<th>배송지 정보</th>
							<td style="text-align: left;">
								<p>배송주소 : ${bj.receiverAddr }</p>
								<p>수령인 : ${bj.receiverName }( ${bj.receiverPhone})</p>
							</td>
						</tr>	
						<tr style="border-bottom: 2px solid #000;">
							<th>주문 상품 정보</th>
							<td style="text-align: left;">
								<p>총 주문금액 : <strong>${bj.depositPriceCom }</strong>원</p>
								<p>[주문 상세 정보]</p>
								<c:forEach items="${bj.boardOrderList }" var="bo">
								<p>${bo.oderName } / ${bo.orderCount }개</p>
								</c:forEach>		
							</td>
						</tr>
					</c:forEach>
				</table>
				
				
			</div>
		
		</div>
	</div>
	
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>
		
		$("#allCheck").change(function(){
			$(".oneCheck").prop('checked',$(this).prop("checked"));
		});
		
		$(".oneCheck").each(function(i,one){
			$(one).on("click",function(){
				if($(one).prop('checked')==false){
					$("#allCheck").prop('checked',false);
				}
			})
		});

</script>
</body>
</html>