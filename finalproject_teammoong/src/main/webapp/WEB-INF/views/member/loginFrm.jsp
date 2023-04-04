<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/member/loginFrm.css" />
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

	
	
	<div class="content-wrap">
		<div class="memberLogin">
			<div class="login-title"><h3>로그인</h3></div>
			<div class="id-pw-input">
				<form action="/login.do" method="post">
					<label for="id">아이디</label>
					<input class="input-basic" type="text" name="memberId" id="id" placeholder="아이디를 입력하세요">
					<label for="pw">비밀번호</label>
					<input class="input-basic" type="password" name="memberPw" id="pw" placeholder="비밀번호를 입력하세요">
					<div class="area-btn full">
						<button type="submit" class="btn btn-pri size02">로그인</button>
					</div>
				</form>	
			</div>
			<div class="search-zone">
				<a href="/searchIdFrm.do">아이디 찾기</a>
				<a href="/searchPwFrm.do">비밀번호 찾기</a>
			</div>
			<p class="proposalMsg">아직 뭉쳐야 산다 회원이 아니신가요? <a href="/signUpFrm.do"> 회원가입하기</a></p>
		</div>
	</div>
	
	
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
