<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/member/myPageDeleteMember.css" />
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div class="content-wrap">
		<div class="mypage-wrap">
		
		<jsp:include page="/WEB-INF/views/common/myPageMenu.jsp" />
		
		<div class="mypage-right">
			<div class="mypage-right-title">회원 탈퇴</div>
			<div class="mypage-content">
				
				<div id="step1">
					<div class="note-title">
						<h6><span style="color: red;">!</span> 탈퇴 안내</h6>
						<a>회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</a>
					</div>
					
					<div class="note">
						<a class="check">사용하고 계신 아이디(${sessionScope.m.memberId })는 탈퇴할 경우 복구 및 재사용이 불가능합니다.</a>
						<a><span style="color:var(--primary);">탈퇴한 아이디는 데이터 복구 불가 및 본인과 타인 모두 재사용 불가</span>하오니 신중하게 선택하시기 바랍니다.</a>
					</div>
					<div class="note">
						<a class="check">탈퇴 후 뭉 포인트 및 회원정보는 모두 소멸/삭제됩니다.</a>
						<a>뭉 포인트는 즉시 소멸, 회원정보는 3개월간 보관 뒤 모두 삭제되며, 소멸/삭제된 데이터는 복구되지 않습니다.</a>
						<a>삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.</a>
					</div>
					<div class="note">
						<a class="check">탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.</a>
						<a>여기여기 붙어라 게시글과 참여 내역, 쪽지는 탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다.</a>
						<a>삭제를 원하는 데이터가 있다면 반드시 탈퇴 전 삭제하시기 바랍니다.</a>
					</div>
					
					<div class="fake_hr"></div>
					
					<div class="note agree">
						<a><input type="checkbox" id="agree">안내 사항을 모두 확인하였으며, 이에 동의합니다</a>
						<div class="area-btn right">
						<button id="step1Btn" class="btn btn-border-pri size01">확인</button>
						</div>
					</div>
				</div><!-- step1 -->
				
				
				<div id="step2">
					<h5>비밀번호 재확인</h5>
					<a>안전한 개인정보를 위해 비밀번호를 다시 한 번 입력해주세요</a>
					<div class="fake_hr"></div>
					
					<table>
						<tr>
							<th>아이디</th>
							<td>
							${sessionScope.m.memberId }
							<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
							</td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="memberPw"></td>
						</tr>						
					</table>
					
					<div class="area-btn center">
						<button id="step2Btn" class="btn btn-border-pri size01">확인</button>
					</div>
				</div><!-- step2 -->
				
				
				<div id="step3">
					<div>
						<div class="img"></div>
						<h5>정말 떠나시나요...?</h5>
					</div>
				
					<div class="note-title">
						<h6>탈퇴 사유를 선택해주세요</h6>
						<a>소중한 의견 반영하여 더 발전하는 뭉쳐야 산다가 되겠습니다.</a>
					</div>
					<div class="fake_hr"></div>
					
					<form action="/updateMemberOut.do">
						<div>
							<input type="radio" name="outReason" value="1" required> 원하는 제품이 없어서
						</div>
						<div>
							<input type="radio" name="outReason" value="2" required> 공동구매에 어려움이 있어서
						</div>
						<div>
							<input type="radio" name="outReason" value="3" required> 서비스 불만족(배송, 고객 응대 등)
						</div>
						<div>
							<input type="radio" name="outReason" value="4" required> 뭉쳐야산다를 자주 사용하지 않음
						</div>
						<div>
							<strong>기타 사유</strong>
							<textarea name="outContent" rows="3" cols="3" placeholder="기타 사유가 있으시면 자유롭게 적어주세요."></textarea>
						</div>
						<div class="area-btn center">
							<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
							<button class="btn btn-border-pri size01">제출 및 탈퇴</button>
						</div>
					</form>
				</div><!-- step3 -->
				
				
			</div><!-- mypage-content -->
		</div><!-- mypage-right -->
		
		</div><!-- mypage-wrap -->
	</div>
	
	
	<script>
		$(function(){
			$("#agree").prop('checked',false);
		});
		
	
		$("#step1Btn").on("click",function(){
			if($("#agree").prop('checked')){
				$("#step1").hide();
				$("#step2").show();
			}
		});//첫번째 스텝 버튼 클릭 시
	
		$("#step2Btn").on("click",function(){
			const memberId = $("[name='memberId']").val();
			const memberPw = $("[name='memberPw']").val();
			$.ajax({
				url:"/chkBeforeOutMember.do",
				type: "post",
				data: {memberId:memberId, memberPw:memberPw},
				success: function(data){
					if(data=="ok"){
						$("#step2").hide();
						$("#step3").show();
					}else{
						alert("비밀번호가 틀립니다");
					}
				}
			})//ajax
		});//두번째 스텝 -- 비밀번호 맞는지
	</script>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>