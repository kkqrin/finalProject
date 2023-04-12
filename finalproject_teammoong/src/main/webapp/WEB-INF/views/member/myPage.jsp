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
				<div class="mypage-right-title">구매 내역/후기 작성</div>
				<div class="mypage-content">
					본격적인 콘텐츠가 들어가는 부분
				</div>
			</div>
		</div><!--mypage-wrap-->
	</div><!-- content-wrap -->
	
	
	
	
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>