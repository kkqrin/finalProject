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
						<a class="check">사용하고 계신 아이디(${sessionScope.m.memberId })는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</a>
						<a><span style="color:var(--primary);">탈퇴한 아이디는 본인과 타인 모두 재사용 및 데이터 복구가 불가</span>하오니 신중하게 선택하시기 바랍니다.</a>
					</div>
					<div class="note">
						<a class="check">탈퇴 후 회원정보 및 뭉 포인트는 모두 삭제됩니다.</a>
						<a>회원정보, 뭉 포인트는 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.</a>
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
						<button class="btn btn-border-pri size01">확인</button>
						</div>
					</div>
				</div><!-- step1 -->
				
				
				<div id="step2">
					<h5>비밀번호 재확인</h5>
					<a>안전한 개인정보를 위해 비밀번호를 다시 한 번 입력해주세요</a>
					<div class="fake_hr"></div>
						
					<a class="step2-td">아이디</a><a>${sessionScope.m.memberId }</a><br>
					<a class="step2-td">비밀번호</a><input type="password" name="memberPw">
				</div>
				
			</div><!-- mypage-content -->
		</div><!-- mypage-right -->
		
		</div><!-- mypage-wrap -->
	</div>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>