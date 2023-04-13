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
			<div class="mypage-right-title">회원 정보</div>
			<div class="mypage-content">
				<form action="/UpdateMember.do" method="post">
				
				<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }"><br>
				아이디:<input type="text" name="memberId" value="${sessionScope.m.memberId }"><br>
				생일:<input type="text" name="memberBDay" value="${sessionScope.m.memberBday }"><br>
				이메일:<input type="text" name="memberEmail" value="${sessionScope.m.memberEmail }"><br>
				휴대폰:<input type="text" name="memberPhone" value="${sessionScope.m.memberPhone }"><br>
				계좌번호:
				<c:choose>
					<c:when test="${empty sessionScope.m.memberAccount }">
						<select name="memberBank" id="noneBank" class="select-custom">
							<option value="null" selected disabled hidden>은행을 선택하세요</option>
						</select>
					</c:when>
					<c:otherwise>
						<input type="hidden" id="memberBank" value="${sessionScope.m.memberBank }">
						<select name="memberBank" id="Bank" class="select-custom">
						</select>
					</c:otherwise>
				</c:choose>
				<input type="text" name="memberAccount" value="${sessionScope.m.memberAccount }"><br>
				주소:<input type="text" name="memberAddr" value="${sessionScope.m.memberAddr }"><br>
				
				<div class="area-btn right">
					<button class="btn btn-sec size02" type="submit">회원정보 수정</button>
				</div>
				</form>
			</div>
		</div><!-- mypage-right -->
		
		</div><!-- mypage-wrap -->
	</div><!-- content-wrap -->
	
	
	
	
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>