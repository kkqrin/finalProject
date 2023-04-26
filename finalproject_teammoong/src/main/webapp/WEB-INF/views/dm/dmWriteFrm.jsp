<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<div class="mypage-right-title">쪽지 보내기</div>
			<div class="mypage-content" style="width: 600px; margin:10px auto;">
					<table>
						<tr>
							<th style="width: 30%;">보내는 사람</th>
							<td>
								${sessionScope.m.memberName }(${memberId})
								<input type="hidden" id="memberId" value="${memberId}">
							</td>
						</tr>
						<tr style="height: 42px;">
							<th>받을 사람</th>
							<td>
								<div class="horiz" style="justify-content: center;">
									<input type="text" name="dmReceiver" placeholder="받으실 분의 아이디를 입력하세요" value="${receiver }" style="width: 80%; height: 38px;">
									<button type="button" class="btn btn-dkgray size01 memberChkBtn" style="margin: 0 5px;">확인</button>
								</div>
							</td>
						</tr>
						<tr>
							<th colspan="2">내용</th>
						</tr>
						<tr>
							<td colspan="2">
								<textarea rows="10" name="dmContent"></textarea>
							</td>					
						</tr>
						<tr>
							<td colspan="2">
								<button class="btn btn-dkgray size01 sendBtn" style="display: inline-block; margin: 0 5px;">쪽지 보내기</button>
							</td>
						</tr>
					</table>
			
			</div><!-- mypage-content -->
		</div><!-- mypage-right -->
		
		</div>
		
		
		<!-- 알림 모달 -->
		<div id="dmAlertModal" class="modal modal-sec">
				<div class="modal-content">
					<div class="modal-header" style="padding: 40px; height: auto;">
						<h6 id="alertTitle" style="text-align: center;"></h6>
					</div>
					<div class="area-btn center">
						<a rel="modal:close" class="btn btn-sec size01" style="cursor: pointer;">확인</a>
					</div>
				</div>
		</div><!--모달창-->
		
	</div><!-- content-wrap -->
	
	
	
	<script>
		let sendChk = false;
		const memberId = $("#memberId").val();
	
		$(".memberChkBtn").on("click",function(){
			const dmReceiver = $("[name='dmReceiver']").val();
			
			if(memberId==dmReceiver){
				alert('본인 계정에 쪽지를 보낼 수 없습니다');
			}else{
				$.ajax({
					url:"/idDoubleCheck.do",
					type:"post",
					data:{memberId:dmReceiver},
					success:function(result){
						if(result=="dup"){
							$("#alertTitle").text("쪽지 보내기가 가능한 회원입니다");
				            $("#dmAlertModal").modal({
								 showClose: false,
					             fadeDuration: 100
					        });
							sendChk = true;
						}else{
							$("#alertTitle").text("존재하지 않는 회원입니다");
				            $("#dmAlertModal").modal({
								 showClose: false,
					             fadeDuration: 100
					        });
							sendChk = false;
						}
					}
				})//ajax
			}
		})//받는사람 회원 있는지 없는지
		
		
		$(".sendBtn").on("click",function(e){
			const dmContent = $("[name='dmContent']").val();
			if(!sendChk){
				e.preventDefault();
				$("#alertTitle").text("[확인] 버튼을 눌러 받을 사람을 확인해주세요");
	            $("#dmAlertModal").modal({
					 showClose: false,
		             fadeDuration: 100
		        });
				$("[name='dmReceiver']").focus();
			}else if(dmContent==""){
				e.preventDefault();
				$("#alertTitle").text("쪽지 내용을 입력해주세요");
	            $("#dmAlertModal").modal({
					 showClose: false,
		             fadeDuration: 100
		        });
				$("[name='dmContent']").focus();
			}else{
				const dmReceiver = $("[name='dmReceiver']").val();
				$.ajax({
					url:"/insertDm.do",
					type:"post",
					data:{dmSender:memberId, dmReceiver:dmReceiver, dmContent:dmContent},
					success:function(result){
						if(result=="ok"){

							$("#alertTitle").text("쪽지를 발송하였습니다");
				            $("#dmAlertModal").modal({
								 showClose: false,
					             fadeDuration: 100
					        });
							
							
							$("[name='dmReceiver']").val("");
							$("[name='dmContent']").val("");
							const sendData = {type:"sendDm",dmReceiver:dmReceiver};
				            ws.send(JSON.stringify(sendData));
						}else{
							$("#alertTitle").text("쪽지 전송에 실패하였습니다. 관리자에게 문의해주세요");
				            $("#dmAlertModal").modal({
								 showClose: false,
					             fadeDuration: 100
					        });
						}
					}
				})//ajax
			}
		})//쪽지 보내기 버튼
		
	</script>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>