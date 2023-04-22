<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보낸 쪽지함</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="content-wrap">
		<div class="mypage-wrap">
		
		<jsp:include page="/WEB-INF/views/common/myPageMenu.jsp" />
		
		<div class="mypage-right">
			<div class="mypage-right-title">보낸 쪽지함</div>
			<div class="mypage-content">
				<input type="hidden" id="memberId" value="${sessionScope.m.memberId }">
				<table class="sendDmTbl">
					<thead>
					<tr>
						<th style="width: 5%;">번호</th>
						<th style="width: 55%;">쪽지</th>
						<th>받은사람</th>
						<th>보낸날짜</th>
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
	<script>
		getSendDm();
	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>