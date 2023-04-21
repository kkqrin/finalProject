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
			<div class="mypage-content">
			
				<table>
					<tr>
						<th>보내는 사람</th>
						<td>${sessionScope.m.memberName }(${sessionScope.m.memberId })</td>
					</tr>
					<tr>
						<th>받을 사람</th>
					</tr>
				
				</table>
			
			
			
			</div>
		</div>
		
		</div>
	</div>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>