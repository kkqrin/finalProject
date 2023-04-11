<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>


</head>
<body>	
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="content-wrap">
		<div class="content-boardView-wrap">
			<table class="boardView-wrap">
				<tr>
					<td colspan="4">${b.boardNo }</td>
				</tr>
				<tr>
					<td colspan="4">${b.boardWriter }</td>
				</tr>
				<tr>
					<td colspan="4">${b.boardDate }</td>
				</tr>
				<c:forEach items="${f }" var="bf">
					<tr>
						<td colspan="4">
							<img src="/resources/upload/board/${bf.filepath}" style="width:300px; height:300px">
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td style="text-align:left;" colspan="4">-입금 예정 날짜</td>
				</tr> 
				<tr>
					<td colspan="4">
						<input type="text" id="paydate" required>
						<input type="hidden" name="payerDate" required>
					</td>
				</tr>
				<tr>
					<td style="text-align:left;" colspan="4">- 은행 정보</td>
				</tr>
				<tr>
					<td style="text-align:left; background-color: #e1eeff; color: #1877f2;" colspan="4">· 폼 참여 내역에서 입금처 정보를 확인하실수 있습니다.</td>
				</tr>
				<tr>
					<td style="text-align:left;" colspan="4">- 주문 상품 선택</td>
				</tr>
				<tr>
					<th>상품</th>
					<th>가격</th>
					<th>재고</th>
					<th>수량</th>
				</tr>
				<tr>
					<c:forEach items="${o }" var="bo">
					<tr>
						<td>
							${bo.detailName}
						</td>
						<td>
							<input type="hidden" value="${bo.detailPrice}" >
							${bo.detailPrice}
						</td>
						<td>
							${bo.detailCount}
						</td>
						<td>
							<input type="text" name="orderCount"  placeholder="수량 입력" required>
						</td>
					</tr>
					</c:forEach>
				</tr>
				<tr>
					<td style="text-align:left;" colspan="4">- 주문 금액 확인</td>
				</tr>
				<tr>
					<td style="text-align:left;" colspan="2">- 총 상품 금액</td>
					<td style="text-align:right;" colspan="2" id="result-price"></td>
				</tr>
			</table>
		</div>
	</div>
		<script type="text/javascript"
		src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	
	<script>
	
	
	$("[name='orderCount']").on("change",function(){
		const test = $("[name='orderCount']").val();
		$("#result-price").append(test);
	});

	$("#paydate").daterangepicker();

	$("#paydate").daterangepicker(
		{
	locale : {
					"separator" : " ~ ", // 시작일시와 종료일시 구분자
					"format" : 'YYYY-MM-DD', // 일시 노출 포맷
					"applyLabel" : "확인", // 확인 버튼 텍스트
					"cancelLabel" : "취소", // 취소 버튼 텍스트
					"daysOfWeek" : [ "일", "월", "화", "수", "목", "금", "토" ],
					"monthNames" : [ "1월", "2월", "3월", "4월", "5월", "6월",
							"7월", "8월", "9월", "10월", "11월", "12월" ]
				},
				showDropdowns : true, // 년월 수동 설정 여부
				autoApply : true, // 확인/취소 버튼 사용여부
				timePicker24Hour : true, // 24시간 노출 여부(ex> true : 23:50, false : PM 11:50)
				timePickerSeconds: true,                 // 초 노출 여부
				singleDatePicker : true,
				minDate : moment()
				
				// 하나의 달력 사용 여부
				},

			function(start, label) {
				console.log(start.format('YYYY-MM-DD'));
				const deliveryDate = start.format('YYYY-MM-DD');
				//input hidden 날짜 값 넣어서 디비로 보내기
				$("[name=deliveryDate]").val(deliveryDate);
			});

	$("#paydate").on('show.daterangepicker', function(ev, picker) {
		$(".yearselect").css("float", "left");
		$(".monthselect").css("float", "right");
		$(".cancelBtn").css("float", "right");
	});
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />	
</body>
</html>