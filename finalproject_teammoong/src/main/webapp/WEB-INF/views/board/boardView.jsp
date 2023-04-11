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
		<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 


</head>
<body>	
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="content-wrap">
		<div class="content-boardView-wrap">
		<form action="/boardWriteView.do" method="post">
				<div style="display: none;">
					${b.boardNo }
				</div>
				<div style="display: none;">
					${b.boardWriter }
				</div>
				<div style="display: none;">
					${b.boardDate }
				</div>
				<div style="background-color: #212429; color: #fff; width: 100%; height: 80px; text-align: center; font-size: 23px; line-height: 80px;">
					${b.boardName }
				</div>
			<table class="boardView-wrap">
				<c:forEach items="${f }" var="bf">
					<tr style="border: none;">
						<td colspan="4" style="border: none;">
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
					<td style="text-align:left;" colspan="4">- 주문 상품 선택<sup>*</sup></td>
				</tr>
				<tr>
					<th>상품</th>
					<th>가격</th>
					<th>재고</th>
					<th>수량</th>
				</tr>
				<tr>
					<c:forEach items="${o }" begin="0" end="${size}" varStatus="i" var="bo">
					<input type="hidden" id="oSize" value="${size}">
					<tr>
						<td>
							${bo.detailName}
						</td>
						<td><input type="hidden" id="detailPrice" value="${bo.detailPrice}">${bo.detailPrice}</td>
						<td>
							${bo.detailCount}
						</td>
						<td>
							<input type="text" id="totalEaInput" class="detailCount"  placeholder="수량 입력" value="" required>
						</td>
					</tr>
					</c:forEach>
				</tr>
				<tr>
					<td style="text-align:left;" colspan="4">- 주문 금액 확인<sup>*</sup></td>
				</tr>
				<tr>
					<td style="text-align:left;" colspan="2">- 총 상품 금액</td>
					<td style="text-align:right;" colspan="2" id="result-price"></td>
				</tr>
				<tr>
					<td style="text-align:left;"colspan="4">- 주문자 정보<sup>*</sup></td>
				</tr>
				<tr>
					<td style="text-align:left;" colspan="4">
						<input type="text" name="memberName"  required placeholder="주문자명"> 
					</td>
				</tr>
				<tr>
					<td style="text-align:left;" colspan="4">
						<input type="text" name="memberEmail"  required placeholder="주문자 이메일주소"> 
					</td>
				</tr>
				<tr>
					<td style="text-align:left;" colspan="4">
						<input type="text" name="memberPhone"  required placeholder="주문자 핸드폰번호"> 
					</td>
				</tr>
				<tr>
					<td style="text-align:left;"colspan="4">- 환불계좌 정보(가상계좌 환불, 제작무산 등의 경우) <sup>*</sup></td>
				</tr>
				<tr>
					<td>
						<select class="select-custom" id="ui-id-1" name="refundBank" required>
						<option value="null" selected disabled hidden>은행선택</option>
						</select>
					</td>
					<td colspan="2"><input type="text" name="refundAccount"
							required placeholder="계좌번호"></td>
					<td><input type="text" name="refundName" required placeholder="예금주명"></td>
				</tr>
				<tr>
					<td style="text-align:left;" colspan="4">- 개인정보 수집 및 동의<sup>*</sup></td>
				</tr>
				<tr>
					<td style="text-align:left;" colspan="4">상품 주문 및 배송을 위해 위에 입력된 개인정보를 수집합니다.<br> 수집한 개인정보는
주문과 배송이외의 목적으로는 사용하지 않습니다.<br>
개인정보의 수집 및 이용에 대한 동의를 거부할수 있으며, 이 경우 상품 주문이 어려울 수 있습니다.</td>
				</tr>
				<tr>
					<td colspan="4"><input type="checkbox" required>동의</td>
				</tr>
			</table>
			<input class="btn btn-border-sec size01" type="submit" id="form" value="안전하게 구매하기"> 
		</form>	
		</div>
	</div>
	<input type="hidden" id="listSize" value="${fn:length(o)}">
		<script type="text/javascript"
		src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	
	<script>
	
// 	$("[name='0orderCount']").on("change",function(){
// 		const orderCount = $("[name='0orderCount']").val();
// 		const price = $("[name='0price']").val();
// 		const result = orderCount * price;
// 		 $("#result-price").val(result);
// 	});
 
 	$(".detailCount").on("change",function(){
 		var detailPrice = $(this).parent().parent().children().eq(1).children().val();//가격
 		var totalEaInput = $(this).val();//내가 입력한 수량

	
		console.log(detailPrice);
		console.log(totalEaInput);
 		
 		let resultPrice =  Number($("#result-price").text()) + detailPrice * totalEaInput;
 		$("#result-price").text(resultPrice);
 		

		
		
 	});
	function calcTotal(testPrice){
		const detailCount = $(".detailCount");
		for(let i=0;i<detailCount.length; i++){
			const input = detailCount[i];
		}
	}
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
	
	
		const refundBank = ["NH농협은행", "KB국민은행", "신한은행", "우리은행", "하나은행",
				"IBK기업은행", "부산은행", "경남은행", "대구은행", "우체국은행", "새마을금고", "SC제일은행",
				"광주은행", "수협", "전북은행", "신협은행", "제주은행", "케이뱅크", "카카오뱅크", "토스뱅크",
				"카카오뱅크(미성년자)", "토스뱅크(미성년자)", "씨티은행", "KDB산업" ];

		function makeBankList() {
			for (let i = 0; i < refundBank.length; i++) {
				let option = "<option value="+refundBank[i]+">"
						+ refundBank[i] + "</option>";
				$("[name='refundBank']").append(option);
			}
		}

		makeBankList();
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />	
</body>
</html>