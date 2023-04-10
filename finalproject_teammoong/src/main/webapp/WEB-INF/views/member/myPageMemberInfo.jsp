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
			<div class="mypage-right-title">회원 정보 수정</div>
			<div class="mypage-content">
				아이디:<br>
				생일:<br>
				이메일:<br>
				휴대폰:<br>
				계좌번호:<br>
				주소:<br>
				
			</div>
		</div>
		
		</div>
	</div>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>