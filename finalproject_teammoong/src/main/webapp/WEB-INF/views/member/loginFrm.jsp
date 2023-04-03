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
			<div><h3>로그인</h3></div>
			<form action="/login.do" method="post">
				<a>아이디</a>
				<input class="input-basic" type="text" name="memberId" placeholder="아이디를 입력하세요">
				<a>비밀번호</a>
				<input class="input-basic" type="passowrd" name="memberPw" placeholder="비밀번호를 입력하세요">
				<div class="area-btn full">
					<button type="button" class="btn btn-border-pri size02">회원가입</button>
					<button type="submit" class="btn btn-pri size02">로그인</button>
				</div>
			</form>	
			<div class="search">
				<a href="#">아이디 찾기</a>
				<span>|</span>
				<a href="#">비밀번호 찾기</a>
			</div>
		</div>
	</div>
	
	
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
