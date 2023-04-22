<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>받은 쪽지함</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="content-wrap">
		<div class="mypage-wrap">
		
		<jsp:include page="/WEB-INF/views/common/myPageMenu.jsp" />
		
		<div class="mypage-right">
			<div class="mypage-right-title">받은 쪽지함</div>
			<div class="mypage-content">
				<input type="hidden" id="memberId" value="${sessionScope.m.memberId }">
				<table class="receiveDmTbl">
					<thead>
					<tr>
						<th style="width: 5%;">번호</th>
						<th style="width: 55%;">쪽지</th>
						<th>보낸사람</th>
						<th>받은날짜</th>
						<th style="width: 10%;">확인</th>
					</tr>
					</thead>
					
					<tbody>
					
					</tbody>
				</table>
				
			</div><!-- mypage-content -->
		</div>
		
		</div><!-- mypage-right -->
	</div>
	
	
	<script src="/resources/js/myPageDm.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>