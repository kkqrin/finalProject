<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새로운 비밀번호 변경</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

	
	
	<div class="content-wrap">
		<input type="hidden" name="memberId" value="${memberId }">
		<div class="updatePw-wrap">
			<div class="searchId-title"><h3>비밀번호 변경</h3></div>
			<div class="toPhone-view">
				<a>새로운 비밀번호</a>
				<input type="text" name="memberName" placeholder="영문,숫자,특수문자(공백 제외)조합으로 8글자 이상">
				<a class="caution">영문,숫자,특수문자(공백 제외)조합으로 8글자 이상</a>
				<a>비밀번호 확인</a>
				<input type="text" name="memberPhone" placeholder="비밀번호를 다시 한 번 입력해주세요">
				<a class="caution">핸드폰 번호를 확인해주세요</a>
				<div class="area-btn full">
				<button class="btn btn-sec size02 sendPhone">아이디 찾기</button>
				</div>
				<a href="/searchPwFrm.do" style="display:block; text-align:center;text-decoration:underline; margin-top:10px;">비밀번호 찾기</a>
			</div>
		</div>
	</div><!-- content-wrap -->


	
</body>
</html>