<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 


</head>

<style>

table tbody tr, table tbody tr td{
    border: none;
    font-size: 16px;
 
}
sup{
    color: red;
}
.status_index{
    background-color: #fec123 ;
    color: #fff;
    width: 20px;
    border-radius: 50%;
    position: absolute;
    left: 700px;
    margin-top: 50px;
}

</style>

<body>	
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="content-wrap">
		<div class="content-boardView-wrap">
		<form action="/boardWriteView.do" method="post">
				<div style="display: none;">
					<input type="text" name="memberNo" value="${sessionScope.m.memberNo }">
				</div>
				<div style="display: none;">
					<input type="text" name="boardNo" value="${b.boardNo }">
				</div>
				<div style="display: none;">
					${b.boardWriter }
				</div>
				<div>
					${b.boardDate }
				</div>
				<div style="background-color: #212429; color: #fff; width: 100%; height: 80px; text-align: center; font-size: 23px; line-height: 80px;">
					${b.boardName }
				</div>
			<table class="boardView-wrap">
				<c:forEach items="${f }" var="bf" varStatus="status">
					<tr style="border: none;">
						<td colspan="4" style="border: none;">
						<div class="status_index">${status.index+1}</div>
							<img src="/resources/upload/board/${bf.filepath}" style="width:300px; height:300px">
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td style="text-align:left;" colspan="4">-상품 설명<sup>*</sup></td>
				</tr> 
				<tr>
					<td colspan="4"><input type="text" value="${b.boardContent }" readonly style="text-align: center;"></td>
				</tr>
				<tr>
					<td style="text-align:left;" colspan="4">-입금 정보<sup>*</sup></td>
				</tr> 
				<tr>
					<td colspan="4">
						<input type="text" id="paydate" required>
						<input type="hidden" name="payerDate" required>
					</td>
				</tr> 
				<tr>
					<td style="text-align:left;" colspan="4">
						<input type="text" name="payerName"  required placeholder="입금자명"> 
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
							<input type="text" id="totalEaInput" class="detailCount" name="orderCount" placeholder="수량 입력" value="" required>
						</td>
					</tr>
					</c:forEach>
				</tr>
				<tr>
					<td style="text-align:left;" colspan="4">- 주문 금액 확인<sup>*</sup></td>
				</tr>
				<tr>
					<td style="text-align:left;" colspan="2">- 총 상품 금액</td>
					<td style="text-align:right;" colspan="2" id="result-price" >
						<input type="text" value="" name="depositPrice">
					</td>
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
					<td style="text-align:left;" colspan="4">- 배송지 정보<sup>*</sup></td>
				</tr>
				<tr>
					<td style="text-align:left;" colspan="4">
						<input type="text" name="receiverName"  required placeholder="수령자명"> 
					</td>
				</tr>
				<tr>
					<td style="text-align:left;" colspan="4">
						<input type="text" name="receiverPhone"  required placeholder="연락처"> 
					</td>
				</tr>
				<tr>
					<td class="addr" style="text-align:left;"colspan="4"><input
						type="hidden" name="receiverAddr"></td>
				</tr>
				<tr>
					<td colspan="3"><input type="text" name="memberZoneCode"
						placeholder="우편번호 조회 버튼을 눌러주세요" readonly required></td>
					<td colspan="1" style="padding-left: 80px;"><button type="button" id="addr"
							class="btn btn-sec size02">우편번호 조회</button></td>
				</tr>
				<tr>
					
					<td colspan="4"><input type="text" name="address"
						placeholder="기본배송지로 등록됩니다" readonly required></td>
				</tr>
				<tr>
					
					<td colspan="4"><input type="text" name="detailAddr"
						placeholder="상세주소를 입력해주세요" required></td>
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
					<td style="text-align:left; border: solid 1px #ced4da;" colspan="4">상품 주문 및 배송을 위해 위에 입력된 개인정보를 수집합니다.<br> 수집한 개인정보는
주문과 배송이외의 목적으로는 사용하지 않습니다.<br>
개인정보의 수집 및 이용에 대한 동의를 거부할수 있으며, 이 경우 상품 주문이 어려울 수 있습니다.</td>
				</tr>
				<tr>
					<td colspan="4"><label><input type="checkbox" required>동의</label></td>
				</tr>
			</table>
			<input class="btn btn-border-sec size01" type="submit" id="form" value="제출" style="background-color: #f26656; border-color: #f0513e; color: #fff; cursor: pointer; padding: 20px 50px 20px 50px; margin-top: 15px"> 
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

	$( function() {
				$( ".select-custom" ).selectmenu();
			});	
 
 	$(".detailCount").on("change",function(){
 		
 		
	
 		const detailCount = $(".detailCount");
 		let totalPrice = 0;
 		detailCount.each(function(index,item){
 			var detailPrice = $(item).parent().parent().children().eq(1).children().val();//가격
 	 		var totalEaInput = $(item).val();//내가 입력한 수량
 	 		totalPrice += detailPrice*totalEaInput;
 		});
	

 		$("[name='depositPrice']").val(totalPrice);
 		

		
		
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
				$("[name=payerDate]").val(deliveryDate);
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
		
		
		$("#addr").on("click",function(){
			new daum.Postcode({
		        oncomplete: function(data) {
		        	console.log(data);
		        	$("[name='memberZoneCode']").val(data.zonecode);
		        	const addr = String(data.address);
		        	$("[name='address']").val(addr);
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
		        }
		    }).open();
		});//다음 지도 API
		
		
		$("[name='detailAddr']").keyup(function(){
			let address = $("[name='address']").val();
			let detailAddr = $(this).val();
			if(address!="" && detailAddr!=""){
				address += " "+detailAddr;
				$("[name='receiverAddr']").val(address); //합친 주소 값넣기
				result[6]=true;
			}else{
				result[6]=false;
			}
		});//주소 입력 확인
		
// 		$("[type='submit']").on("click",function(){
			
// 			event.preventDefault();
				
// 			console.log("보드넘버: "+$("[name='boardNo']").val());
// 			console.log("멤버넘버: "+$("[name='memberNo']").val());
// 			console.log("페이어네임: "+$("[name='payerName']").val());
// 			console.log("페이어데이트: "+$("[name='payerDate']").val());
// 			console.log("리시버네임: "+$("[name='receiverName']").val());
// 			console.log("리시버폰: "+$("[name='receiverPhone']").val());
// 			console.log("리시버주소: "+$("[name='receiverAddr']").val());
// 			console.log("리펀드뱅크: "+$("[name='refundBank']").val());
// 			console.log("리펀드어카운트: "+$("[name='refundAccount']").val());
// 			console.log("리펀드네임: "+$("[name='refundName']").val());
// 			console.log("오더카운트: "+$("[name='orderCount']").val());
// 		});
		
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />	
</body>
</html>