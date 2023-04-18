<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
table tr th {
    background: var(--pink-300)!important;
}


</style>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="content-wrap">
		<div class="mypage-wrap">
		
		<jsp:include page="/WEB-INF/views/common/myPageMenu.jsp" />
		
		<div class="mypage-right">
			<div class="mypage-right-title">참가중인 공구</div>
			<div class="mypage-content">
			<div class="table_box" style="margin-top: 10px;">
				<table>
					<colgroup class="pc">
						<col width="10%">
						<col width="30%">
						<col width="30%">
					</colgroup>
					<thead>
						<tr>
							<th scope="row">No</th>
							<th scope="row">제목</th>
							<th scope="row">작성시간</th>
							<th scope="row">입금날짜</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${list }" var="b">
						<tr>
							<td>
								<a href="/boardView.do?${b.boardNo }">${b.boardNo }</a>
							</td>
							<td>
								<a href="/boardView.do?${b.boardName }">${b.boardName }</a>
							</td>
							<td>${b.thumbnail }</td>
							<td>${b.payerDate }</td>	
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		
		</div>
	</div>
	
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
