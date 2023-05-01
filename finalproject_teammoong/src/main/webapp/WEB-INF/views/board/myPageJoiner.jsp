<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
				<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
				<div>
					<input type="checkbox" id="allCheck" style="margin: 0;"><label for="allCheck">전체선택</label>
					<a id="sendDm" style="font-weight: bold; padding: 0 3px; border: 1px solid #3a3a3a; border-radius: 5px; cursor: pointer;">쪽지 보내기</a>
				</div>
			
			
				<table class="tbl-box" style="margin-top: 10px;">
					<c:forEach items="${list }" var="bj" varStatus="i">
						<tr style="border-top: 2px solid #000;">
							<th rowspan="3" style="width: 5%;">
								<input type="checkbox" class="oneCheck">
								<input type="hidden" name="dmReceivers" value="${bj.memberId }" disabled>
							</th>
							<th rowspan="3" style="width: 5%;">
								${fn:length(list)-i.index }
							</th>
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
	
	
	<!-- 쪽지보내기 모달 -->
	<div id="dmWriteFrm" class="modal modal-sec">
		<div class="modal-content">
			<div class="modal-header" style="height: auto;">
				<h6>발송하기</h6>
				<a>작성한 내용이 선택한 회원의 쪽지함으로 발송됩니다</a>
			</div>
			<div class="modal-body" style="display: flex; flex-direction: column;">
				<div>
				<textarea name="dmContent" rows="10"></textarea>
				</div>
			</div>
			<div class="area-btn" style="display: flex; justify-content: space-between;">
				<a rel="modal:close" class="btn btn-sec size01 close" style="cursor: pointer;">취소</a>
				<button id="send" class="btn btn-sec size01" style="cursor: pointer;">보내기</button>
			</div>
		</div>
	</div><!--모달창-->



	<!-- 알림 모달 -->
	<div id="alertModal" class="modal modal-sec">
				<div class="modal-content">
					<div class="modal-header" style="padding: 40px; height: auto;">
						<h6 id="alertTitle" style="text-align: center;"></h6>
					</div>
					<div class="area-btn center">
						<a rel="modal:close" class="btn btn-sec size01" style="cursor: pointer;">확인</a>
					</div>
				</div>
	</div><!--모달창-->
	
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
				}//전체체크 풀리기
				if($(one).prop('checked')){
					$(one).next().prop('disabled',false);
				}else{
					$(one).next().prop('disabled',true);
				}//disabled
			})
		});

		
		
		
		$("#sendDm").click(function(){
			const receivers = $(".oneCheck:checked").length;
			if(receivers == 0){
				$("#alertTitle").html("받을 사람을 선택해주세요");
	            $("#alertModal").modal({
					 showClose: false,
		             fadeDuration: 100
		        });
			}else{
				$("#dmWriteFrm").modal({
					 showClose: false,
		             fadeDuration: 100
		        });
			}
		});
		
		$(".close").click(function(){
			$("[name='dmContent']").val("");
		});
		
		
		
		
		$("#send").click(function(){
			
			let receivers = [];
			$("[name='dmReceivers']:not(:disabled)").each(function(i,one){
				receivers[i] = $(one).val();
			});
			
			const dmContent = $("[name='dmContent']").val();
			const dmSender = $("[name='memberId']").val();
			$.ajax({
				url:"/insertGroupDm.do",
				traditional: true,
				data:{dmReceivers:receivers,dmContent:dmContent,dmSender:dmSender},
				success:function(result){
					if(result=="ok"){
						alert("쪽지를 발송하였습니다");
						$(".close").click();
					}else{
						alert("발송 오류. 관리자에게 문의하세요");
					}
				}
			})//ajax
		});

</script>
</body>
</html>