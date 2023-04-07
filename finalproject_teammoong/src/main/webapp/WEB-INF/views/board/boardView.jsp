<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="content-wrap">
		<div class="content-boardView-wrap">
			<table class="boardView-wrap">
				<tr>
					<td>
						<c:forEach items="${f }" var="bf">
							<img src="/resources/upload/board/${bf.filepath}" style="width:300px; height:300px">
						</c:forEach>
					</td>
					<td>${b.boardNo }</td>
					<td>${b.boardWriter }</td>
					<td>${b.boardDate }</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>